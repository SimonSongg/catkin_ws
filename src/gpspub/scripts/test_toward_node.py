#!/usr/bin/env python
# coding=utf-8

# 本代码会订阅一个叫ADV_chassis_move_control的节点，这个节点的类型是Vector3，其中
# x控制前后，前正后负；y控制左右；左正右负；z等于0的时候底盘可以被前面两个值正常控制
# 如果z不等于0，这会被视为急停，底盘将立刻停下。
# 输入的x和y必须在0-100之间，否则会出现异常，程序终止
# 底盘最大移动速度可调，底盘最大转向角速度可调

import rospy

from geometry_msgs.msg import Vector3, Pose2D
from sensor_msgs.msg import NavSatFix

import sys, select, termios, tty, math

# 发布
pub = rospy.Publisher('ADV_chassis_move_control', Vector3, queue_size=5) #发布底盘油门控制话题

# 参数
TARGET_LATITUDE = 29.801971    # 纬度[单位：度] 正值->北 负值->南
TARGET_LONGITUDE = 121.561637  # 经度[单位：度] 正值->东 负值->西
MAG_YAW_OFFSET = 0.10402162   # 磁北与正北之间的矫正(radius)
PID_P_FACTOR = 200.0 #PID P系数 正数
PID_I_FACTOR = 0.0  #PID I系数 正数
PID_D_FACTOR = 0.0  #PID D系数 正数
FORWARD_SPEED_PERCENT = 100.0   #前进油门百分比 0-100
LATITUDE_TO_DISTANCE_FACTOR = 11119000  #纬度转换成厘米系数
LONGITUDE_TO_DISTANCE_FACTOR = 9677400  #经度传换成厘米系数
DESTINATION_RANGE = 200 #终点符合范围：厘米

# 订阅的值
latitude = 0.0  # 纬度[单位：度] 正值->北 负值->南（猜想是越往北值越大）
longitude = 0.0 # 经度[单位：度] 正值->东 负值->西（猜想是越往东值越大）
yaw = 0.0       # Yaw角[单位：弧度] 逆时针->增加 顺时针->减少

# 内部处理的值
realYaw = 0.0
targetYaw = 0.0
errorYaw = 0.0
lastErrorYaw = 0.0
integrationErrorYaw = 0.0
differenceErrorYaw = 0.0

# 指示器
isReachedDestination = False

def rangeCheck(num, min, max):
    if (num >= min and num <= max):
        return True
    else:
        return False

def constrain(val, min_val, max_val):
    if val < min_val:
        return min_val
    if val > max_val:
        return max_val
    return val

def callbackGPS(data):
    global latitude
    global longitude
    latitude = data.latitude
    longitude = data.longitude

def callbackYaw(data):
    global yaw
    if (data.theta <= math.pi):
        yaw = -data.theta
    else :
        yaw = -data.theta + 2*math.pi
    #yaw = data.theta - math.pi

def controlPID(event):
    # 参数
    global TARGET_LATITUDE
    global TARGET_LONGITUDE
    global MAG_YAW_OFFSET
    global PID_P_FACTOR
    global PID_I_FACTOR
    global PID_D_FACTOR
    global FORWARD_SPEED_PERCENT
    global LATITUDE_TO_DISTANCE_FACTOR 
    global LONGITUDE_TO_DISTANCE_FACTOR

    # 订阅的值
    global latitude
    global longitude
    global yaw

    #内部处理的值
    global realYaw
    global targetYaw
    global errorYaw
    global lastErrorYaw
    global integrationErrorYaw
    global differenceErrorYaw

    # 指示器
    global isReachedDestination

    if not isReachedDestination:
        # 进行一些计算更新值
        realYaw = yaw + MAG_YAW_OFFSET
        targetYaw = math.atan2(longitude - TARGET_LONGITUDE, TARGET_LATITUDE - latitude)
        lastErrorYaw = errorYaw
        errorYaw = targetYaw - realYaw
        integrationErrorYaw = errorYaw + integrationErrorYaw
        differenceErrorYaw = errorYaw - lastErrorYaw

        # 输出
        output = errorYaw * PID_P_FACTOR + integrationErrorYaw * PID_I_FACTOR + differenceErrorYaw * PID_D_FACTOR
        vector3 = Vector3()
        vector3.x = FORWARD_SPEED_PERCENT;  vector3.y = constrain(output, -99, 99); vector3.z = 0.0
        pub.publish(vector3)

        rospy.loginfo("x:%s\tcalculated y:%s\ttrue y:%s" % (vector3.x, output, vector3.y)) #打印一些数据
        rospy.loginfo("latitude:%s\tlongitude:%s\ntargetLa:%s\ttargetLo:%s\nrealYaw:%s\ttarYaw:%s\terYaw:%s\n------------" % (latitude, longitude, TARGET_LATITUDE, TARGET_LONGITUDE, realYaw, targetYaw, errorYaw))
        
        # 检测是否到达
        distance = math.sqrt(math.pow(abs(TARGET_LATITUDE - latitude) * LATITUDE_TO_DISTANCE_FACTOR, 2) + math.pow(abs(TARGET_LONGITUDE - longitude) * LONGITUDE_TO_DISTANCE_FACTOR, 2))
        if distance < DESTINATION_RANGE:
            isReachedDestination = True
            vector3.x = 0.0;  vector3.y = 0.0; vector3.z = 0.0
            pub.publish(vector3)
    else:
        vector3 = Vector3()
        vector3.x = 0.0;  vector3.y = 0.0; vector3.z = 0.0
        pub.publish(vector3)

#主函数
if __name__=="__main__":
    rospy.init_node('test_toward_node') #创建ROS节点
    #rospy.Subscriber('gps/filtered', NavSatFix, callbackGPS) #订阅GPS数据
    rospy.Subscriber('GPSData', NavSatFix, callbackGPS) #订阅GPS数据
    # rospy.Subscriber('imu/rpy/filtered', Vector3Stamped, callback2)   #被遗弃，这是旧的使用Zed2的代码
    rospy.Subscriber('mag_pose_2d', Pose2D, callbackYaw)    #订阅包含磁方向的Yaw角数据

    rospy.Timer(rospy.Duration(0.1), controlPID, False)

    rospy.spin()

