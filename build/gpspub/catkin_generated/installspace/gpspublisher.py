#!/usr/bin/env python2

import rospy
import serial
from gpspub.msg import adv_gpsmsg

pub = rospy.Publisher('ADVGPSData', adv_gpsmsg, queue_size = 5)
rospy.init_node('ADVGPSPublisher', anonymous = False)

ser=serial.Serial("/dev/ttyTHS0",115200,timeout=2)

while not rospy.is_shutdown():

    gpsdata = adv_gpsmsg()
    latitude = 0.0
    longitude = 0.0
    flag = 0
    speed = 0.0
    accuracy = 0.0

    line = ser.readline()

    try:
        line = str(line)

        #Latitude
        if line.startswith('la'):
            latitude = float(line[2:-2])
            gpsdata.Latitude = latitude
            rospy.loginfo('la:' + str(latitude))
        #Longitude
        elif line.startswith('lo'):
            longitude = float(line[2:-2])
            gpsdata.Longitude = longitude
            rospy.loginfo('lo:' + str(longitude))
        #Speed
        elif line.startswith('s'):
            speed = float(line[1:-2])
            gpsdata.Speed = speed
            rospy.loginfo('s:' + str(speed))
        #Accuracy
        elif line.startswith('a'):
            accuracy = float(line[1:-2])
            gpsdata.Accuracy = accuracy
            rospy.loginfo('a:' + str(accuracy))
        #Flag
        elif line.startswith('f'):
            flag = int(line[1:-2])
            gpsdata.Flag = flag
            rospy.loginfo('f:' + str(flag))

        pub.publish(gpsdata)
        
    except Exception as err:
        rospy.loginfo("Error Info:" + repr(err))
        continue

    

