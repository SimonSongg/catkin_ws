#!/usr/bin/env python
import rospy
import copy
from sensor_msgs.msg import Imu
from std_msgs.msg import Header
imu_receive = Imu()
pub = rospy.Publisher('imu_converted', Imu, queue_size = 5)
rospy.init_node('imu_convert_node', anonymous = False)

def callback(data):
    #rospy.loginfo(rospy.get_caller_id() + "I heard 12345" + str(data))
    imu_receive = copy.deepcopy(data)
    imu_receive.header.frame_id = "base_link"
    rospy.loginfo(str(imu_receive))
    pub.publish(imu_receive)



    
def listener():

    # In ROS, nodes are uniquely named. If two nodes with the same
    # name are launched, the previous one is kicked off. The
    # anonymous=True flag means that rospy will choose a unique
    # name for our 'listener' node so that multiple listeners can
    # run simultaneously.
    #rospy.init_node('listener', anonymous=True)

    rospy.Subscriber("imu/data/fuse", Imu, callback)

    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

if __name__ == '__main__':
    listener()
    