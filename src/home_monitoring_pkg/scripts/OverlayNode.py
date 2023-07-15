#!/usr/bin/env python3
import cv2
import numpy as np
import rospy

from sensor_msgs.msg import Image # frame is the message type
from utils.not_cv_bridge import imgmsg_to_cv2
from utils.not_cv_bridge import cv2_to_imgmsg

from home_monitoring_pkg.msg import PredictionMsg

# counter to detect suspicious activity
sus_counter = 0

class OverlayNode:
    def __init__(self):
        self.overlay_frame = None  # Initialize overlay_frame attribute
        rospy.init_node('overlay_node', anonymous=True)

        # subscribe to camera topic and prediction topic
        rospy.Subscriber('camera_topic', Image, self.camera_callback)
        rospy.Subscriber('prediction_topic', PredictionMsg, self.prediction_callback)

        # initialize ROS publishers
        self.overlay_pub = rospy.Publisher('overlay_topic', Image, queue_size=10)
        self.suspicious_pub = rospy.Publisher('suspicious_topic', Image, queue_size=10)
        
    def camera_callback(self, data):
        # Convert ROS image message to OpenCV image
        frame = imgmsg_to_cv2(data)
        self.overlay_frame = frame.copy()

        
    
    def prediction_callback(self, data):
        # Process mask prediction message from prediction_topic
        label_mask = data.label_mask
        label_mask_prob = data.label_mask_prob
        x_start = data.x_start
        y_start = data.y_start
        x_end = data.x_end
        y_end = data.y_end

        # Process pose prediction message from prediction_topic
        label_pose = data.label_pose
        label_pose_prob = data.label_pose_prob
        x_pose = data.x_pose
        y_pose = data.y_pose
            

        color = (0, 0, 255) if label_mask == "Mask" else (0, 255, 0)

        # Draw mask prediction
        cv2.putText(self.overlay_frame, label_mask_prob, (x_start, y_start - 10), cv2.FONT_HERSHEY_SIMPLEX, 0.45, color, 2)
        cv2.rectangle(self.overlay_frame, (x_start, y_start), (x_end, y_end), color, 2)
        
        coords = tuple(np.multiply(
                np.array((x_pose, y_pose)), [400, 400]).astype(int))
        
        # draw pose prediction
        #cv2.rectangle(self.overlay_frame, (coords[0], coords[1] + 5), (coords[0] + len(label_pose) * 20, coords[1] - 30), (245, 117, 16), -1)
        #cv2.putText(self.overlay_frame, label_pose, coords, cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2, cv2.LINE_AA)
        cv2.rectangle(self.overlay_frame, (0, 0), (250, 60), (245, 117, 16), -1)
        cv2.putText(self.overlay_frame, 'POSE', (95, 12), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 0, 0), 1, cv2.LINE_AA)
        cv2.putText(self.overlay_frame, label_pose.split(' ')[0], (90, 40), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2, cv2.LINE_AA)
        cv2.putText(self.overlay_frame, 'PROB', (15, 12), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 0, 0), 1, cv2.LINE_AA)
        cv2.putText(self.overlay_frame, label_pose_prob, (10, 40), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2, cv2.LINE_AA)

        # Publish the overlayed frame as a new image message to overlay_topic
        overlayed_msg = cv2_to_imgmsg(self.overlay_frame)
        overlayed_msg.header.stamp = rospy.Time.now()
        self.overlay_pub.publish(overlayed_msg)

        global sus_counter

        #alert activity if suspicious activity detected
        if(label_pose == "open_door" and label_mask == "Mask"):
            rospy.loginfo("Suspicious activity detected!")
            sus_counter += 1

            if(sus_counter == 70):
                rospy.loginfo('Sending image to telegram bot')
                self.suspicious_pub.publish(overlayed_msg)
                sus_counter = 0

        

if __name__ == '__main__':
    overlay_vis_node = OverlayNode()
    rospy.spin()
    cv2.destroyAllWindows()