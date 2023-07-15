#!/usr/bin/env python3

# Import the necessary libraries
import rospy 
from sensor_msgs.msg import Image 
import cv2
from utils.not_cv_bridge import cv2_to_imgmsg
  
def publish_message():
 
  # Node is publishing to the camera_topic using 
  # the message type Image
  pub = rospy.Publisher('camera_topic', Image, queue_size=10)
     
  # Tells rospy the name of the node.
  # Anonymous = True makes sure the node has a unique name.=
  rospy.init_node('video_pub_py', anonymous=True)
     
  # Go through the loop 30 times per second
  rate = rospy.Rate(30) 
     
  # Create a VideoCapture object
  # The argument '2' gets the juno webcam.
  cap = cv2.VideoCapture(2)
 
  # While ROS is still running.
  while not rospy.is_shutdown():
     
      # Capture frame-by-frame
      # This method returns True/False as well
      # as the video frame.
      ret, frame = cap.read() 
         
      if ret == True:
        # Print debugging information to the terminal
        rospy.loginfo('publishing video frame')
             
        # Publish the image.
        # The 'cv2_to_imgmsg' method converts an OpenCV
        # image to a ROS image message
        pub.publish(cv2_to_imgmsg(frame))
             
      # Sleep just enough to maintain the desired rate
      # also to sync with subsriber lag
      rate.sleep()
         
if __name__ == '__main__':
  try:
    publish_message()
  except rospy.ROSInterruptException:
    pass