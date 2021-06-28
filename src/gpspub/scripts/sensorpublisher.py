#!/usr/bin/env python
import rospy
import pyzed.sl as sl
import time
from std_msgs.msg import Twist

pub = rospy.Publisher('ADVSensorsData', adv_gpsmsg, queue_size = 5)
rospy.init_node('ADVSensorsPublisher', anonymous = False)

cam = sl.Camera()

init_params = sl.InitParameters()
init_params.depth_mode = sl.DEPTH_MODE.NONE

err = cam.open(init_params)
if err != sl.ERROR_CODE.SUCCESS:
    print(err) 
    rospy.loginfo("Error")   
    exit(1)


sensor_data = sl.SensorsData()
#imu_data = sl.SensorsData.IMUData()
while not rospy.is_shutdown():
    sensordata=Twist()
    if cam.grab() == sl.ERROR_CODE.SUCCESS:
        try:
            cam.get_sensors_data(sensor_data, sl.TIME_REFERENCE.IMAGE)

            imu_data_acc = sensor_data.get_imu_data().get_linear_acceleration()
            imu_data_gyr = sensor_data.get_imu_data().get_angular_velocity()
            mag_data = sensor_data.get_magnetometer_data().get_magnetic_field_calibrated()
            sensordata.linear.x = imu_data_acc[0]
            sensordata.linear.y = imu_data_acc[1]
            sensordata.linear.z = imu_data_acc[2]
            rospy.loginfo("Linear Acceleration: x: (%f) y: (%f) z: (%f) \nAngular: x: (%f) y: (%f) z: (%f) \nMag: (%f) y: (%f) z: (%f)" % (imu_data_acc[0],imu_data_acc[1],imu_data_acc[2],imu_data_gyr[0],imu_data_gyr[1],imu_data_gyr[2],mag_data[0],mag_data[1],mag_data[2]))
            time.sleep(0.5)
            pub.publish(sensordata)

        except Exception as errors:
            rospy.loginfo("error info:" + repr(errors))
            continue

    

