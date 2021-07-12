#!/usr/bin/env python
# coding=utf-8
import rospy
from gpspub.msg import radardata
from ctypes import *
import copy
 

pub = rospy.Publisher('RadarDistance', radardata, queue_size = 5)
rospy.init_node('RadarPublisher', anonymous = False)



VCI_USBCAN2 = 4
STATUS_OK = 1
class VCI_INIT_CONFIG(Structure):  
    _fields_ = [("AccCode", c_uint),
                ("AccMask", c_uint),
                ("Reserved", c_uint),
                ("Filter", c_ubyte),
                ("Timing0", c_ubyte),
                ("Timing1", c_ubyte),
                ("Mode", c_ubyte)
                ]  
class VCI_CAN_OBJ(Structure):  
    _fields_ = [("ID", c_uint),
                ("TimeStamp", c_uint),
                ("TimeFlag", c_ubyte),
                ("SendType", c_ubyte),
                ("RemoteFlag", c_ubyte),
                ("ExternFlag", c_ubyte),
                ("DataLen", c_ubyte),
                ("Data", c_ubyte*8),
                ("Reserved", c_ubyte*3)
                ] 
ubyte_array = c_ubyte*8
ubyte_3array = c_ubyte*3
b = ubyte_3array(0, 0 ,0)
data_array = [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]
data_array1 = [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]
CanDLLName = './ControlCAN.dll' #把DLL放到对应的目录下
#canDLL = windll.LoadLibrary('./ControlCAN.dll')
#Linux系统下使用下面语句，编译命令：python3 python3.8.0.py
canDLL = cdll.LoadLibrary('/usr/bin/libcontrolcan.so')

ret = canDLL.VCI_OpenDevice(VCI_USBCAN2, 0, 0)
if ret == STATUS_OK:
    print('调用 VCI_OpenDevice成功\r\n')
if ret != STATUS_OK:
    print('调用 VCI_OpenDevice出错\r\n')

vci_initconfig = VCI_INIT_CONFIG(0x80000008, 0xFFFFFFFF, 0,
                                 0, 0x00, 0x14, 0)#波特率1000k，正常模式
ret = canDLL.VCI_InitCAN(VCI_USBCAN2, 0, 0, byref(vci_initconfig))

if ret == STATUS_OK:
    print('调用 VCI_InitCAN1成功\r\n')
if ret != STATUS_OK:
    print('调用 VCI_InitCAN1出错\r\n')

ret = canDLL.VCI_StartCAN(VCI_USBCAN2, 0, 0)
if ret == STATUS_OK:
    print('调用 VCI_StartCAN1成功\r\n')
if ret != STATUS_OK:
    print('调用 VCI_StartCAN1出错\r\n')
time_end = 0.0
time_start = 0.0
a = ubyte_array(0, 0, 0, 0, 0, 0, 0, 0)
vci_can_obj = VCI_CAN_OBJ(0x0, 0, 0, 0, 0, 0,  0, a, b)#容器
#vci_can_obj = VCI_CAN_OBJ[2500]
while True:
    radar = radardata()
    radar_ori = radardata()
    ret = canDLL.VCI_Receive(VCI_USBCAN2, 0, 0, byref(vci_can_obj), 1, 0)
    if ret > 0:
        index = list(vci_can_obj.Data)[1]
        distance = (256.0*list(vci_can_obj.Data)[2] + list(vci_can_obj.Data)[3])/100.0
        #print(distance)
        #print(list(vci_can_obj.Data))
        if (index == 31):
            data_array1[index] = distance
            data_array[index-16] = distance        
            #print(index)
            #print(data_array)
            #radar = copy.deepcopy(data_array)
            radar = data_array #try if it works
            radar_ori = data_array1
            pub.publish(radar)
            #pub.publish(radar_ori)
            
            data_array = [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]
        else:
            data_array1[index] = distance
            if (index >= 0 and index <= 15):
                data_array[index+16] = distance
            else:
                data_array[index-16] = distance
