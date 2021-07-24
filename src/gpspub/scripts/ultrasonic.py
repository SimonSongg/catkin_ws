#!/usr/bin/env python
import serial
import os
import rospy
from std_msgs.msg import Float64

os.system('echo %s | sudo -S %s' % ('ADV', 'chmod 777 /dev/ultrasonic0'))

ser = serial.Serial("/dev/ultrasonic0",9600,timeout=2)
ser1 = serial.Serial("/dev/ultrasonic0",9600,timeout=2) #need further specification

#ser.open()
state = 0 
data_256 = 0
data_16 = 0

state_R = 0
data_256_R = 0
data_16_R = 0

pubL = rospy.Publisher('UltraDistanceL', Float64, queue_size = 5)
pubR = rospy.Publisher('UltraDistanceR', Float64, queue_size = 5)
rospy.init_node('Ultrasonic_Publisher', anonymous = False)
ultra_dataL = Float64()
ultra_dataR = Float64()

while not rospy.is_shutdown():
    #print(1)
    line = ser.read(1)
    line1 = ser1.read(1)

    #print(line)
    dataL = int(line.encode('hex'),16)
    dataR = int(line1.encode('hex'),16)
    #print(data)
    
    #print(int(data))
    if dataL == 255 and state == 0:
        state = 1
        #print(2)
    elif dataL == 255 and state == 1:
        state = 0
        #print(3)
    elif dataL != 255 and state == 1:
        state = 2
        #print(4)
        data_256 = dataL
    elif state == 2:
        state = 3
        #print(5)
        data_16 = dataL
    elif state == 3:
        if (data_256 + data_16 + 255) & 255 == dataL:
            #print(6)
            print(data_256*256+data_16)
            ultra_dataL = (data_256*256+data_16)/1000.0
            pubL.publish(ultra_dataL)
            state = 0
            data_16 = 0
            data_256 = 0
        else:
            print("error data from left")
            #print(7)
            state = 0
            data_16 = 0
            data_256 = 0

    if dataR == 255 and state_R == 0:
        state_R = 1
        #print(2)
    elif dataR == 255 and state_R == 1:
        state_R = 0
        #print(3)
    elif dataR != 255 and state_R == 1:
        state_R = 2
        #print(4)
        data_256_R = dataR
    elif state == 2:
        state_R = 3
        #print(5)
        data_16_R = dataR
    elif state_R == 3:
        if (data_256_R + data_16_R + 255) & 255 == dataR:
            #print(6)
            print(data_256_R*256+data_16_R)
            ultra_dataL = (data_256_R*256+data_16_R)/1000.0
            pubR.publish(ultra_dataR)
            state_R = 0
            data_16_R = 0
            data_256_R = 0
        else:
            print("error data from right")
            #print(7)
            state_R = 0
            data_16_R = 0
            data_256_R = 0
    
    
    
