#!/usr/bin/env python

import rospy
import serial
import os
from gpspub.msg import adv_gpsmsg
from sensor_msgs.msg import NavSatFix

os.system('echo %s | sudo -S %s' % ('ADV', 'chmod 777 /dev/ttyTHS0'))
pub = rospy.Publisher('ADVGPSData', adv_gpsmsg, queue_size = 5)
pub_nav = rospy.Publisher('GPSData', NavSatFix, queue_size = 5)
rospy.init_node('ADVGPSPublisher', anonymous = False)

ser=serial.Serial("/dev/ttyTHS0",115200,timeout=2)
latitude = 0.0
longitude = 0.0
flag = 0
speed = 0.0
accuracy = 0.0
counter = 0
gpsdata = adv_gpsmsg()
gpsdata_nav = NavSatFix()
gpsdata_nav.header.frame_id = "gps"

while not rospy.is_shutdown():




    line = ser.readline()

    try:
        line = str(line)

        #Latitude
        if line.startswith('la'):
            latitude = float(line[2:-2])
            gpsdata.Latitude = latitude
            gpsdata_nav.latitude = latitude
            rospy.loginfo('la:' + str(latitude))
            counter = counter + 1
        #Longitude
        elif line.startswith('lo'):
            longitude = float(line[2:-2])
            gpsdata.Longitude = longitude
            gpsdata_nav.longitude = longitude
            rospy.loginfo('lo:' + str(longitude))
            counter = counter + 1
        #Speed
        elif line.startswith('s'):
            speed = float(line[1:-2])
            gpsdata.Speed = speed
            rospy.loginfo('s:' + str(speed))
            counter = counter + 1
        #Accuracy
        elif line.startswith('a'):
            accuracy = float(line[1:-2])
            gpsdata.Accuracy = accuracy
            rospy.loginfo('a:' + str(accuracy))
            counter = counter + 1
        #Flag
        elif line.startswith('f'):
            flag = int(line[1:-2])
            gpsdata.Flag = flag
            rospy.loginfo('f:' + str(flag))
            counter = counter + 1
        if (counter == 5):
            pub.publish(gpsdata)
            pub_nav.publish(gpsdata_nav)
            counter = 0
        
        
    except Exception as err:
        rospy.loginfo("Error Info:" + repr(err))
        continue

    

