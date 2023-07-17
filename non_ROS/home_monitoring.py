import pickle 
import mediapipe as mp
import cv2
import numpy as np
import pandas as pd
import requests

from tensorflow.keras.applications.mobilenet_v2 import preprocess_input
from tensorflow.keras.preprocessing.image import img_to_array
from tensorflow.keras.models import load_model
from imutils.video import VideoStream
import imutils
import time
import os

mp_drawing = mp.solutions.drawing_utils
mp_holistic = mp.solutions.holistic

with open('body_language.pkl', 'rb') as f:
    model = pickle.load(f)

# Load face detector and mask detector models
prototxtPath = os.path.sep.join(["face_detector", "deploy.prototxt"])
weightsPath = os.path.sep.join(["face_detector", "res10_300x300_ssd_iter_140000.caffemodel"])
faceNet = cv2.dnn.readNet(prototxtPath, weightsPath)
maskNet = load_model("mask_detector.model")

def detect_and_predict_mask(frame, faceNet, maskNet):
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


human = ""
sus_counter = 0

# Initialize video stream
vs = VideoStream(src=0).start()
time.sleep(2.0)

# Initialize holistic model
with mp_holistic.Holistic(
        min_detection_confidence=0.5, min_tracking_confidence=0.5
) as holistic:
    while True:
        # Read frame from video stream
        frame = vs.read()
        frame = imutils.resize(frame, width=400)
        
        # Recolor frame
        image = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
        image.flags.writeable = False
        
        # Make detections with Mediapipe
        results = holistic.process(image)
        
        # Recolor image back to BGR for rendering
        image.flags.writeable = True
        image = cv2.cvtColor(image, cv2.COLOR_RGB2BGR)
        
        # Detect faces and predict masks
        (locs, preds) = detect_and_predict_mask(frame, faceNet, maskNet)
        
        # Loop over the detected face locations and their corresponding locations
        for (box, pred) in zip(locs, preds):
            (startX, startY, endX, endY) = box
            (mask, withoutMask) = pred
            
            # Determine the class label and color for mask detection
            label = "Mask" if mask > withoutMask else "No Mask"
            color = (0, 255, 0) if label == "Mask" else (0, 0, 255)
            human = label
            
            # Include the probability in the label
            label = "{}: {:.2f}%".format(label, max(mask, withoutMask) * 100)
            
            # Draw bounding box and label on the frame
            cv2.putText(image, label, (startX, startY - 10), cv2.FONT_HERSHEY_SIMPLEX, 0.45, color, 2)
            cv2.rectangle(image, (startX, startY), (endX, endY), color, 2)
        
        # Make body language predictions
        try:
            pose = results.pose_landmarks.landmark
            pose_row = list(np.array([[landmark.x, landmark.y, landmark.z, landmark.visibility] for landmark in pose]).flatten())
            X = pd.DataFrame([pose_row])
            body_language_class = model.predict(X)[0]
            body_language_prob = model.predict_proba(X)[0]
            print(body_language_class, body_language_prob)
            
            coords = tuple(np.multiply(
                np.array(
                    (results.pose_landmarks.landmark[mp_holistic.PoseLandmark.LEFT_EAR].x,
                     results.pose_landmarks.landmark[mp_holistic.PoseLandmark.LEFT_EAR].y)
                ), [400, 400]).astype(int))
            
            cv2.rectangle(image, (coords[0], coords[1] + 5), (coords[0] + len(body_language_class) * 20, coords[1] - 30), (245, 117, 16), -1)
            cv2.putText(image, body_language_class, coords, cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2, cv2.LINE_AA)
            
            cv2.rectangle(image, (0, 0), (250, 60), (245, 117, 16), -1)
            
            cv2.putText(image, 'CLASS', (95, 12), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 0, 0), 1, cv2.LINE_AA)
            cv2.putText(image, body_language_class.split(' ')[0], (90, 40), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2, cv2.LINE_AA)
            
            cv2.putText(image, 'PROB', (15, 12), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 0, 0), 1, cv2.LINE_AA)
            cv2.putText(image, str(round(body_language_prob[np.argmax(body_language_prob)], 2)), (10, 40), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2, cv2.LINE_AA)
            
        except:
            pass


        if(body_language_class == "open_door" and human == "Mask"):
            print("THIEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF")
            sus_counter += 1
            
        if(sus_counter == 50):
            print("SAVEEEEEEEEEEEEEEEE")
            frame_filename = f"thief.jpg"
            cv2.imwrite(frame_filename, frame)
            with open('thief.jpg', 'rb') as image_file:
                files = {'photo': image_file,
                        'caption': "abdnormal activities!!! call 911 omg"}
                response = requests.post('https://scubed-telebot-aa8bc18176d7.herokuapp.com/notify', files=files)

            
        # Display the resulting image
        cv2.imshow("Frame", image)
        key = cv2.waitKey(1) & 0xFF
        
        # If the 'q' key was pressed, break from the loop
        if key == ord("q"):
            break

# Clean up
cv2.destroyAllWindows()
vs.stop()
