#!/usr/bin/env python3
import pickle 
import mediapipe as mp
import cv2
import numpy as np
import pandas as pd
import rospy

from tensorflow.keras.applications.mobilenet_v2 import preprocess_input
from tensorflow.keras.preprocessing.image import img_to_array
from tensorflow.keras.models import load_model

from sensor_msgs.msg import Image # frame is the message type
from utils.not_cv_bridge import imgmsg_to_cv2
import warnings

from home_monitoring_pkg.msg import PredictionMsg

warnings.filterwarnings("ignore")

# import models for pose prediction
mp_holistic = mp.solutions.holistic
with open('/home/mustar/kakap_ws/src/home_monitoring_pkg/scripts/models/body_language.pkl', 'rb') as f:
    model = pickle.load(f)


class PredictionNode:
    def __init__(self):
        rospy.init_node('prediction_node', anonymous=True)

        # subscribe to camera topic
        rospy.Subscriber('camera_topic', Image, self.camera_callback)
        
        self.prediction_pub = rospy.Publisher('prediction_topic', PredictionMsg, queue_size=10)
        
        # Load face detector and mask detector models, for mask detection
        self.prototxtPath = "/home/mustar/kakap_ws/src/home_monitoring_pkg/scripts/models/deploy.prototxt"
        self.weightsPath = "/home/mustar/kakap_ws/src/home_monitoring_pkg/scripts/models/res10_300x300_ssd_iter_140000.caffemodel"
        self.faceNet = cv2.dnn.readNet(self.prototxtPath, self.weightsPath)
        self.maskNet = load_model("/home/mustar/kakap_ws/src/home_monitoring_pkg/scripts/models/mask_detector.model")

    def camera_callback(self, data):

        # get frame from camera_topic, then convert ros image msg to cv2 image
        current_frame = imgmsg_to_cv2(data)
        
        # get mask prediction data
        mask_prediction_tuple = self.detect_mask(current_frame)

        # get pose prediction data
        pose_prediction_tuple = self.detect_pose(current_frame, model)

        # initialize custom messageType written in msg/prediction.msg
        prediction_msg = PredictionMsg()

        # get mask prediction data and put into message
        prediction_msg.label_mask = mask_prediction_tuple[0]
        prediction_msg.label_mask_prob = mask_prediction_tuple[1]
        prediction_msg.x_start = mask_prediction_tuple[2]
        prediction_msg.y_start = mask_prediction_tuple[3]
        prediction_msg.x_end = mask_prediction_tuple[4]
        prediction_msg.y_end = mask_prediction_tuple[5]

        # get pose prediction data and put into message
        prediction_msg.label_pose = pose_prediction_tuple[0]
        prediction_msg.label_pose_prob = pose_prediction_tuple[1]
        prediction_msg.x_pose = pose_prediction_tuple[2]
        prediction_msg.y_pose = pose_prediction_tuple[3]

        
        # publish both mask and pose prediction data to prediction_topic
        self.prediction_pub.publish(prediction_msg)
        return


    def detect_mask(self, frame):
        # Detect faces and predict masks
        (locs, preds) = self.detect_and_predict_mask(frame, self.faceNet, self.maskNet)
        label = ''
        label_prob = ''
        x_start, y_start, x_end, y_end = 0, 0, 0, 0
        # Loop over the detected face locations and their corresponding locations
        for (box, pred) in zip(locs, preds):
            (x_start, y_start, x_end, y_end) = box
            (mask, withoutMask) = pred
            
            # Determine the class label and color for mask detection
            label = "Mask" if mask > withoutMask else "No Mask"
            color = (0, 255, 0) if label == "Mask" else (0, 0, 255)

            # Include the probability in the label
            label_prob = "{}: {:.2f}%".format(label, max(mask, withoutMask) * 100)
             
        return (label, label_prob, x_start, y_start, x_end, y_end)

    def detect_and_predict_mask(self, frame, faceNet, maskNet):
        # grab the dimensions of the frame and then construct a blob
        # from it
        (h, w) = frame.shape[:2]
        blob = cv2.dnn.blobFromImage(frame, 1.0, (300, 300),
            (104.0, 177.0, 123.0))

        # pass the blob through the network and obtain the face detections
        faceNet.setInput(blob)
        detections = faceNet.forward()

        # initialize our list of faces, their corresponding locations,
        # and the list of predictions from our face mask network
        faces = []
        locs = []
        preds = []

        # loop over the detections
        for i in range(0, detections.shape[2]):
            # extract the confidence (i.e., probability) associated with
            # the detection
            confidence = detections[0, 0, i, 2]

            # filter out weak detections by ensuring the confidence is
            # greater than the minimum confidence
            if confidence > 0.5:
                # compute the (x, y)-coordinates of the bounding box for
                # the object
                box = detections[0, 0, i, 3:7] * np.array([w, h, w, h])
                (startX, startY, endX, endY) = box.astype("int")

                # ensure the bounding boxes fall within the dimensions of
                # the frame
                (startX, startY) = (max(0, startX), max(0, startY))
                (endX, endY) = (min(w - 1, endX), min(h - 1, endY))

                # extract the face ROI, convert it from BGR to RGB channel
                # ordering, resize it to 224x224, and preprocess it
                face = frame[startY:endY, startX:endX]
                if face.any():
                    face = cv2.cvtColor(face, cv2.COLOR_BGR2RGB)
                    face = cv2.resize(face, (224, 224))
                    face = img_to_array(face)
                    face = preprocess_input(face)

                    # add the face and bounding boxes to their respective
                    # lists
                    faces.append(face)
                    locs.append((startX, startY, endX, endY))

        # only make a predictions if at least one face was detected
        if len(faces) > 0:
            # for faster inference we'll make batch predictions on *all*
            # faces at the same time rather than one-by-one predictions
            # in the above `for` loop
            faces = np.array(faces, dtype="float32")
            preds = maskNet.predict(faces, batch_size=32)

        # return a 2-tuple of the face locations and their corresponding
        # locations
        return (locs, preds)

    def detect_pose(self, frame, model):
        # Make body language predictions
        # Make detections with Mediapipe
        body_language_class, label_pose_prob = '', ''
        x, y = 0.00, 0.00

        with mp_holistic.Holistic(
            min_detection_confidence=0.5, min_tracking_confidence=0.5
    ) as holistic:
            results = holistic.process(frame)
            if results.pose_landmarks is not None:
                pose = results.pose_landmarks.landmark
                pose_row = list(np.array([[landmark.x, landmark.y, landmark.z, landmark.visibility] for landmark in pose]).flatten())
                X = pd.DataFrame([pose_row])
                body_language_class = model.predict(X)[0]
                body_language_prob = model.predict_proba(X)[0]
                
                label_pose_prob = str(round(body_language_prob[np.argmax(body_language_prob)], 2))
                x = results.pose_landmarks.landmark[mp_holistic.PoseLandmark.LEFT_EAR].x
                y = results.pose_landmarks.landmark[mp_holistic.PoseLandmark.LEFT_EAR].y
            else:
                pass

        # return pose label, pose label prob, and x and y
        return (body_language_class, label_pose_prob, x, y)
    
    def run(self):
        rospy.spin()
    
if __name__ == '__main__':
    prediction_node = PredictionNode()
    prediction_node.run()