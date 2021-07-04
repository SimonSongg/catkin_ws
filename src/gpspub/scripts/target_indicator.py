#!/usr/bin/env python
# coding=utf-8

import rospy
import math
from sensor_msgs.msg import NavSatFix

# route
routeArray = [[29.801971 , 121.561637] , [0.0 , 0.0]]# need further determination
# publish
pub = rospy.Publisher('GPS_target', NavSatFix, queue_size=5) #publish the target GPS coordinates

#target position arrival indicator
#isReachedDestination = False

# subscribe
latitude = 0.0  # 纬度[单位：度] 正值->北 负值->南（猜想是越往北值越大）
longitude = 0.0 # 经度[单位：度] 正值->东 负值->西（猜想是越往东值越大）

#TARGET_LATITUDE = 29.801971    # 纬度[单位：度] 正值->北 负值->南
#TARGET_LONGITUDE = 121.561637  # 经度[单位：度] 正值->东 负值->西
LATITUDE_TO_DISTANCE_FACTOR = 11119000  #纬度转换成厘米系数
LONGITUDE_TO_DISTANCE_FACTOR = 9677400  #经度传换成厘米系数
DESTINATION_RANGE = 200 #终点符合范围：厘米
nav = NavSatFix()

counter = 0

def callbackGPS(data):
    global latitude
    global longitude
    latitude = data.latitude
    longitude = data.longitude

def pubcontrol():
    # 参数
    #global TARGET_LATITUDE
    #global TARGET_LONGITUDE
    global routeArray
    global counter
    global nav
    global LATITUDE_TO_DISTANCE_FACTOR 
    global LONGITUDE_TO_DISTANCE_FACTOR

    # 订阅的值
    global latitude
    global longitude
    
    
    distance = math.sqrt(math.pow(abs(routeArray[counter][0] - latitude) * LATITUDE_TO_DISTANCE_FACTOR, 2) + math.pow(abs(routeArray[counter][1] - longitude) * LONGITUDE_TO_DISTANCE_FACTOR, 2))
    if distance < DESTINATION_RANGE:
        if ((counter + 1) == len(routeArray)):
            nav.latitude = 0.0
            nav.longitude = 0.0
            pub.publish(nav)
        else:
            counter = counter + 1
            nav.latitude = routeArray[counter][0]
            nav.longitude = routeArray[counter][1]
            pub.publish(nav)   
    else:
        nav.latitude = routeArray[counter][0]
        nav.longitude = routeArray[counter][1]
        pub.publish(nav)
        



if __name__=="__main__":
    rospy.init_node('target_indicator') #创建ROS节点
    #rospy.Subscriber('gps/filtered', NavSatFix, callbackGPS) #订阅GPS数据
    rospy.Subscriber('GPSData', NavSatFix, callbackGPS) #订阅GPS数据
    rospy.Timer(rospy.Duration(0.1), pubcontrol, False)
    rospy.spin()