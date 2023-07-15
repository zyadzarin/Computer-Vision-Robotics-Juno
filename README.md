# Computer-Vision-Robotics-Juno
Intelligent Robotics Assignment.

Our robot named S-Cubed implements AI technology and is inspired by Moorebot Scout and Ring Robot. These robots showcase the application of AI in different contexts. While Moorebot Scout focuses on personal assistance and home automation, Ring Robot emphasizes home security and monitoring. These robots demonstrate how AI technology can be integrated into physical devices to enhance their functionality and provide valuable services to users.

# How to run:
This code is suggested to run specifically on the Jupiter JUNO robot coded MA020001 due to dependendency issues.

However, if you want to run it in a different robot, git clone the project, certain paths must be changed in PredictionNode.py under Scripts folder, and follow the instructions in requirements.txt to create new conda environment. After that, you can follow the instructions to run on the specific robot.

1. Run in terminal: <pre><code>$ roscore</code></pre>
2. Open new terminal, make sure in 'base' conda environment, if not run: <pre><code>$ conda activate</code></pre>
3. Run:
<pre>
  <code>(base)$ cd kakap_ws</code>
  <code>(base)$ source devel/setup.bash</code>
  <code>(base)$ roslaunch home_monitoring_pkg home_monitoring.launch</code>
</pre>

Note that 'kakap_ws' is the name of the catkin workspace, if you use this project in a different robot and git clone, the workspace might be different

# Example output
![image](https://github.com/zyadzarin/Computer-Vision-Robotics-Juno/assets/83915041/6d725c96-9ebe-471f-9cbf-01c6b7dd1575)
