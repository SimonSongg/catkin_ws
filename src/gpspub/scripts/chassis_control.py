#!/usr/bin/env python
# coding=utf-8

# 本代码会订阅一个叫ADV_chassis_move_control的节点，这个节点的类型是Vector3，其中
# x控制前后，前正后负；y控制左右；左正右负；z等于0的时候底盘可以被前面两个值正常控制
# 如果z不等于0，这会被视为急停，底盘将立刻停下。
# 输入的x和y必须在0-100之间，否则会出现异常，程序终止
# 底盘最大移动速度可调，底盘最大转向角速度可调

import rospy

from geometry_msgs.msg import Vector3, Twist

import sys, select, termios, tty

# 下面这两个变量指示了底盘能够达到的最大速度
# 以及最大转向角速度
# 这两个值悠着点改，别改大了，会怎样我也不知道
speedMax = 3 #移动速度 m/s
turnMax  = 1   #转向速度 rad/s

# 下面这几个变量都是输入的Vector3的变量
inputX = 0.0
inputY = 0.0
inputEmStop = False

# 下面两个用于离线检测
offlineIndicator = False
offlineCount = 0
offlineThreshold = 10   #当离线次数大于这个值的时候，自动急停   （实际这个值我觉得应该得好几百才比较正常，慢慢试）
isOffline = False

#以字符串格式返回当前速度
def vels(speed,turn,em):
    return "currently:\tspeed %s\tturn %s \temergency %s " % (speed,turn,em)

def callback(data):
    global offlineIndicator
    global inputX
    global inputY
    global inputEmStop

    offlineIndicator = False
    inputX = data.x
    inputY = data.y
    
    if data.z == 0:
        inputEmStop = False
    else:
        inputEmStop = True

def rangeCheck(num, min, max):
    if (num >= min and num <= max):
        return True
    else:
        return False

#获取键值函数
def getKey():
    tty.setraw(sys.stdin.fileno())
    rlist, _, _ = select.select([sys.stdin], [], [], 0.1)
    if rlist:
        key = sys.stdin.read(1)
    else:
        key = ''

    termios.tcsetattr(sys.stdin, termios.TCSADRAIN, settings)
    return key

#主函数
if __name__=="__main__":
    settings = termios.tcgetattr(sys.stdin)
    rospy.init_node('chassis_control') #创建ROS节点
    rospy.Subscriber('ADV_chassis_move_control', Vector3, callback) #创建底盘控制话题订阅者，‘ADV_chassis_move_control’
    
    pub = rospy.Publisher('cmd_vel', Twist, queue_size=10) #创建速度话题发布者

    x      = 0   #前进后退方向
    th     = 0   #转向/横向移动方向
    count  = 0   #键值不再范围计数
    target_speed = 0 #前进后退目标速度
    target_turn  = 0 #转向目标速度
    control_speed = 0 #前进后退实际控制速度
    control_turn  = 0 #转向实际控制速度
    try:    
        
        while(1):
            key = getKey()

            # Ctrl - C
            if (key == '\x03'):
                break

            if offlineIndicator:
                offlineCount = offlineCount + 1
            else:
                offlineCount = 0

            if offlineCount >= offlineThreshold:
                isOffline = True

            #判断是否紧急停车
            if inputEmStop or isOffline:
                control_speed = 0
                control_turn = 0
            else:
                #检查输入值是否在-100 - 100之间
                if not (rangeCheck(inputX, -100, 100)):
                    raise ValueError("Input X speed is not within range 0-100", inputX)
                if not (rangeCheck(inputY, -100, 100)):
                    raise ValueError("Input Y turn speed is not within range 0-100", inputY)

                #根据速度与方向计算目标速度
                target_speed = speedMax * inputX / 100.0
                target_turn  = turnMax * inputY / 100.0

                #平滑控制，计算前进后退实际控制速度
                if target_speed > control_speed:
                    control_speed = min( target_speed, control_speed + 0.1 )
                elif target_speed < control_speed:
                    control_speed = max( target_speed, control_speed - 0.1 )
                else:
                    control_speed = target_speed

                #平滑控制，计算转向实际控制速度
                if target_turn > control_turn:
                    control_turn = min( target_turn, control_turn + 0.5 )
                elif target_turn < control_turn:
                    control_turn = max( target_turn, control_turn - 0.5 )
                else:
                    control_turn = target_turn

            rospy.loginfo(vels(control_speed, control_turn, isOffline or inputEmStop)) #打印当前速度以及是否急停
         
            twist = Twist() #创建ROS速度话题变量
            #给速度话题变量赋值
            twist.linear.x  = control_speed; twist.linear.y = 0;  twist.linear.z = 0
            twist.angular.x = 0;             twist.angular.y = 0; twist.angular.z = control_turn

            pub.publish(twist) #ROS发布速度话题

        

    #运行出现问题则程序终止并打印相关错误信息
    except Exception as e:
        print(e)

    #程序结束前发布速度为0的速度话题
    finally:
        twist = Twist()
        twist.linear.x = 0;  twist.linear.y = 0;  twist.linear.z = 0
        twist.angular.x = 0; twist.angular.y = 0; twist.angular.z = 0
        pub.publish(twist)

    #程序结束前设置终端相关属性
    termios.tcsetattr(sys.stdin, termios.TCSADRAIN, settings)
    

