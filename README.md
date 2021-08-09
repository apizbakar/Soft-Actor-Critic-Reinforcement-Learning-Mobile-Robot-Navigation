# Soft-Actor-Critic-Reinforcement-Learning-Mobile-Robot-Navigation
This example uses Soft Actor Critic(SAC) based reinforcement learning to develop the mobile robot navigation. 
This example scenario trains a mobile robot to navigate from location A to location B to avoid obstacles given range sensor readings that detect obstacles in the map. 
The objective of the reinforcement learning algorithm is to learn what controls (linear and angular velocity) for navigation from an initial to goal position and  during the travel also can avoid colliding into obstacles. 
This example uses an occupancy map of a known environment to generate range sensor readings, detect obstacles, and check collisions the robot may make. 
The range sensor readings are the observations for the SAC agent, and the linear and angular velocity controls are the action.


# main live scripts and functions(SAC_Mobile_robot_navigation.mlx) 
