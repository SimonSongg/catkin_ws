#!/usr/bin/env python
# coding=utf-8

import rospy
import cv2

from geometry_msgs.msg import Vector3, Pose2D
from sensor_msgs.msg import NavSatFix
from gpspub.msg import radardata

import sys, select, termios, tty, math

# 发布
pub = rospy.Publisher('ADV_chassis_move_control', Vector3, queue_size=5) #发布底盘油门控制话题

# 值
isEmStop = False

# 参数
RADAR_MAX_INDEX = 31
RADAR_MID_TURN_SPEED = 95.0
RADAR_SIDE_TURN_SPEED = 30.0
RADAR_EM_DISTANCE = 1.5
RADAR_MAX_DISTANCE = 10.0
FORWARD_SPEED_MAX_PERCENT = 100.0   #前进油门百分比 0-100

# 订阅的值
radarValues = [0.0] # 雷达的值

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

def callbackRadar(data):
    global radarValues
    radarValues = data.RadarData

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

    print(radarValues)
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
    else:
        return 0, 0, False

def controlPID(event):
    global FORWARD_SPEED_MAX_PERCENT
    global isEmStop

    if not isEmStop:
        # 打印
        rospy.loginfo("Car is still on the way.")

        # 雷达
        radarFactor, radarTurn, isEmStop = controlRadar()

        # 打印
        rospy.loginfo("rdFactor:%f\trdTurn:%f\trdIsEM:%f" % (radarFactor, radarTurn, isEmStop))

        # 输出
        outputX = FORWARD_SPEED_MAX_PERCENT * (1 - radarFactor)
        outputY = radarTurn * radarFactor
        vector3 = Vector3()
        vector3.x = outputX
        vector3.y = outputY
        if isEmStop:
            vector3.z = 1.0
        else:
            vector3.z = 0.0

        # 打印
        rospy.loginfo("fnOutX:%f\tfnOutY:%f\tfnOutEm:%f" % (vector3.x, vector3.y, False if vector3.z == 0 else True))
        
        # 发布
        pub.publish(vector3)

        if cv2.waitKey(1) == 115:
            isEmStop = True

    else:
        rospy.loginfo("Car has stopped.")
        vector3 = Vector3()
        vector3.x = 0.0;  vector3.y = 0.0; vector3.z = 0.0
        pub.publish(vector3)

#主函数
if __name__=="__main__":
    rospy.init_node('test_toward_node')                                 #创建ROS节点
    rospy.Subscriber('RadarDistance', radardata, callbackRadar)

    rospy.Timer(rospy.Duration(0.1), controlPID, False)

    rospy.spin()

