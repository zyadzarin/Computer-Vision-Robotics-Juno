#!/usr/bin/env python3

import cv2
import rospy


from sensor_msgs.msg import Image # frame is the message type
from utils.not_cv_bridge import imgmsg_to_cv2
from utils.not_cv_bridge import cv2_to_imgmsg

from home_monitoring_pkg.msg import PredictionMsg

class DisplayNode:
    def __init__(self):
        self.camera_frame = None
        self.overlay_frame = None
        rospy.init_node('display_node', anonymous=True)

        # Initialize ROS subscribers
        rospy.Subscriber('camera_topic', Image, self.camera_callback)
        rospy.Subscriber('overlay_topic', Image, self.overlay_callback)

    def camera_callback(self, data):
        # Convert ROS image message to OpenCV image
        self.camera_frame = imgmsg_to_cv2(data)

    def overlay_callback(self, data):
        # Convert ROS image message to OpenCV image
        self.overlay_frame = imgmsg_to_cv2(data)

    def run(self):
        rate = rospy.Rate(30)  # Adjust the rate as per your requirement
        while not rospy.is_shutdown():
            if self.camera_frame is not None and self.overlay_frame is not None:
                # Overlay the frames
                overlayed_frame = cv2.addWeighted(self.camera_frame, 0.5, self.overlay_frame, 0.5, 0)
                
                # Display the overlayed frame
                cv2.imshow('Webcam Feed with Overlay', self.overlay_frame)
                cv2.waitKey(1)

            rate.sleep()

if __name__ == '__main__':
    display_node = DisplayNode()
    display_node.run()
    cv2.destroyAllWindows()


