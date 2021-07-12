#!/usr/bin/env python
# coding=utf-8

import rospy

from geometry_msgs.msg import Vector3, Pose2D
from sensor_msgs.msg import NavSatFix
from gpspub.msg import radardata

import sys, select, termios, tty, math

# 发布
pub = rospy.Publisher('ADV_chassis_move_control', Vector3, queue_size=5) #发布底盘油门控制话题

# 参数
MAG_YAW_OFFSET = 0.10402162   # 磁北与正北之间的矫正(radius)
PID_P_FACTOR = 200.0 #PID P系数 正数
PID_I_FACTOR = 0.0  #PID I系数 正数
PID_D_FACTOR = 0.0  #PID D系数 正数
FORWARD_SPEED_MAX_PERCENT = 100.0   #前进油门百分比 0-100
LATITUDE_TO_DISTANCE_FACTOR = 11119000  #纬度转换成厘米系数
LONGITUDE_TO_DISTANCE_FACTOR = 9677400  #经度传换成厘米系数
DESTINATION_RANGE = 200 #终点符合范围：厘米

# 参数
RADAR_MAX_INDEX = 31
RADAR_MID_TURN_SPEED = 95.0
RADAR_SIDE_TURN_SPEED = 30.0
RADAR_EM_DISTANCE = 1.5
RADAR_MAX_DISTANCE = 10.0

# 订阅的值
latitude = 0.0  # 纬度[单位：度] 正值->北 负值->南（猜想是越往北值越大）
longitude = 0.0 # 经度[单位：度] 正值->东 负值->西（猜想是越往东值越大）
targetLatitude = 0.0    # 纬度[单位：度] 正值->北 负值->南
targetLongitude = 0.0  # 经度[单位：度] 正值->东 负值->西
isTargetReached = True  # 是否到达目的地坐标
yaw = 0.0       # Yaw角[单位：弧度] 逆时针->增加 顺时针->减少
radarValues = [0.0] # 雷达的值

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

def callbackRadar(data):
    global radarValues
    radarValues = data

def callbackYaw(data):
    global yaw
    if (data.theta <= math.pi):
        yaw = -data.theta
    else :
        yaw = -data.theta + 2 * math.pi
    #yaw = data.theta - math.pi

def callbackTargetGPS(data):
    global targetLatitude
    global targetLongitude
    global isTargetReached
    targetLatitude = data.latitude
    targetLongitude = data.longitude
    if targetLatitude == 0 and targetLongitude == 0:
        isTargetReached = True

# 雷达输出：1.权重 2.转向角度 3.是否急停
def controlRadar():
    # 全局参数
    global RADAR_MAX_INDEX
    global RADAR_MID_TURN_SPEED
    global RADAR_SIDE_TURN_SPEED
    global RADAR_EM_DISTANCE
    global RADAR_MAX_DISTANCE

    # 全局变量
    global radarValues

    # 函数内变量
    distance = 0.0
    angle = 0.0
    effNum = 0

    for index in range(len(radarValues)):
        if radarValues[index] < RADAR_EM_DISTANCE:
            return 0, 0, True
        elif radarValues[index] < RADAR_MAX_DISTANCE:
            distance += radarValues[index]
            angle += index
            effNum += 1
    
    if effNum > 0:
        distance /= effNum
        angle /= effNum
        factor = (RADAR_MAX_DISTANCE - distance) / (RADAR_MAX_DISTANCE - RADAR_EM_DISTANCE)
        turn = 0.0
        if angle > RADAR_MAX_INDEX / 2.0:
            turn = (RADAR_MAX_INDEX - angle) / (RADAR_MAX_INDEX / 2.0) * (RADAR_MID_TURN_SPEED - RADAR_SIDE_TURN_SPEED) + RADAR_SIDE_TURN_SPEED
        else:
            turn = (0 - angle) / (RADAR_MAX_INDEX / 2.0) * (RADAR_MID_TURN_SPEED - RADAR_SIDE_TURN_SPEED) - RADAR_SIDE_TURN_SPEED

        return factor, turn, False

def controlPID(event):
    # 参数
    global MAG_YAW_OFFSET
    global PID_P_FACTOR
    global PID_I_FACTOR
    global PID_D_FACTOR
    global FORWARD_SPEED_MAX_PERCENT
    global LATITUDE_TO_DISTANCE_FACTOR 
    global LONGITUDE_TO_DISTANCE_FACTOR

    # 订阅的值
    global latitude
    global longitude
    global targetLatitude
    global targetLongitude
    global isTargetReached
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
        targetYaw = math.atan2(longitude - targetLongitude, targetLatitude - latitude)
        lastErrorYaw = errorYaw
        errorYaw = targetYaw - realYaw
        integrationErrorYaw = errorYaw + integrationErrorYaw
        differenceErrorYaw = errorYaw - lastErrorYaw
        outputTurnByGPS = errorYaw * PID_P_FACTOR + integrationErrorYaw * PID_I_FACTOR + differenceErrorYaw * PID_D_FACTOR

        # 雷达
        radarFactor, radarTurn, isEmStop = controlRadar()

        # 输出
        outputX = FORWARD_SPEED_MAX_PERCENT * (1 - radarFactor)
        outputY = (constrain(outputTurnByGPS, -99, 99) * (1 - radarFactor) + radarTurn * radarFactor)
        vector3 = Vector3()
        vector3.x = outputX
        vector3.y = outputY
        if isEmStop:
            vector3.z = 1.0
        else:
            vector3.z = 0.0
        pub.publish(vector3)

        rospy.loginfo("                             \
            x:%f\ttrue y:%f\n      \
            latitude:%f\tlongitude:%f\n             \
            targetLa:%f\ttargetLo:%f\n              \
            realYaw:%f\ttarYaw:%f\terYaw:%f\n       \
            ------------" % \
            (vector3.x, vector3.y,
            latitude, longitude,
            targetLatitude, targetLongitude,
            realYaw, targetYaw, errorYaw
            )) #打印一些数据

        # 检测是否到达
        distance = math.sqrt(math.pow(abs(targetLatitude - latitude) * LATITUDE_TO_DISTANCE_FACTOR, 2) + math.pow(abs(targetLongitude - longitude) * LONGITUDE_TO_DISTANCE_FACTOR, 2))
        if distance < DESTINATION_RANGE or isTargetReached:
            isReachedDestination = True
            vector3.x = 0.0;  vector3.y = 0.0; vector3.z = 0.0
            pub.publish(vector3)
    else:
        vector3 = Vector3()
        vector3.x = 0.0;  vector3.y = 0.0; vector3.z = 0.0
        pub.publish(vector3)

#主函数
if __name__=="__main__":
    rospy.init_node('test_toward_node')                                 #创建ROS节点
    #rospy.Subscriber('gps/filtered', NavSatFix, callbackGPS)           #订阅GPS数据
    rospy.Subscriber('GPSData', NavSatFix, callbackGPS)                 #订阅GPS数据
    #rospy.Subscriber('imu/rpy/filtered', Vector3Stamped, callback2)    #被遗弃，这是旧的使用Zed2的代码
    rospy.Subscriber('mag_pose_2d', Pose2D, callbackYaw)                #订阅包含磁方向的Yaw角数据
    rospy.Subscriber('TargetGPS', NavSatFix, callbackTargetGPS)         #订阅目标GPS坐标数据
    rospy.Subscriber('RadarDistance', radardata, callbackRadar)

    rospy.Timer(rospy.Duration(0.1), controlPID, False)

    rospy.spin()

