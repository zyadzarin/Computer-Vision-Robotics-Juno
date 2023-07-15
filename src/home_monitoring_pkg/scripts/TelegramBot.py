#!/usr/bin/env python3
import requests
import rospy
from sensor_msgs.msg import Image # Image is the message type
from utils.not_cv_bridge import imgmsg_to_cv2
import cv2


def callback(data):
    rospy.loginfo("Received suspicious Image")

    # Convert ROS Image message to OpenCV image
    sus_image = imgmsg_to_cv2(data)
    frame_filename = f"thief.jpg"
    cv2.imwrite(frame_filename, sus_image)
    with open('thief.jpg', 'rb') as image_file:
        files = {'photo': image_file,
                'caption': "uwu please help"}
        response = requests.post('https://scubed-telebot-aa8bc18176d7.herokuapp.com/notify', files=files)

#receive suspicious image
def receive_message():
    rospy.init_node('telegram_bot_py', anonymous=True)

    rospy.Subscriber('suspicious_topic', Image, callback)
    rospy.spin()



if __name__ == '__main__':
  receive_message()