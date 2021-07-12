import serial
import os

os.system('echo %s | sudo -S %s' % ('ADV', 'chmod 777 /dev/ttyUSB2'))

ser=serial.Serial("/dev/ttyUSB2",9600,timeout=2)
#ser.open()
state = 0 
data_256 = 0
data_16 = 0

while True:
    line = ser.read(1)
    data = line[0]
    #print(data)
    if data == 255 and state == 0:
        state = 1
    elif data == 255 and state == 1:
        state = 0
    elif data != 255 and state == 1:
        state = 2
        data_256 = data
    elif state == 2:
        state = 3
        data_16 = data
    elif state == 3:
        if (data_256 + data_16 + 255) & 255 == data:
            print(data_256*256+data_16)
            state = 0
            data_16 = 0
            data_256 = 0
        else:
            print("error data")
            state = 0
            data_16 = 0
            data_256 = 0
    
    
    
