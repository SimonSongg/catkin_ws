#!/usr/bin/env python
import serial
import os
import rospy
from std_msgs.msg import Float64

os.system('echo %s | sudo -S %s' % ('ADV', 'chmod 777 /dev/ultrasonic0'))

ser=serial.Serial("/dev/ultrasonic0",9600,timeout=2)
#ser.open()
state = 0 
data_256 = 0
data_16 = 0

pub = rospy.Publisher('UltraDistance', Float64, queue_size = 5)
rospy.init_node('Ultrasonic_Publisher', anonymous = False)
ultra_data = Float64()

while not rospy.is_shutdown():
    #print(1)
    line = ser.read(1)
    #print(line)
    data = int(line.encode('hex'),16)
    #print(data)
    
    #print(int(data))
    if data == 255 and state == 0:
        state = 1
        #print(2)
    elif data == 255 and state == 1:
        state = 0
        #print(3)
    elif data != 255 and state == 1:
        state = 2
        #print(4)
        data_256 = data
    elif state == 2:
        state = 3
        #print(5)
        data_16 = data
    elif state == 3:
        if (data_256 + data_16 + 255) & 255 == data:
            #print(6)
            print(data_256*256+data_16)
            ultra_data = (data_256*256+data_16)/1000.0
            pub.publish(ultra_data)
            state = 0
            data_16 = 0
            data_256 = 0
        else:
            print("error data")
            #print(7)
            state = 0
            data_16 = 0
            data_256 = 0
    
    
    
