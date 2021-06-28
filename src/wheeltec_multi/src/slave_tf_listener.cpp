/**************************************************************************
作者：pjf
功能：多机编队
**************************************************************************/
#include <ros/ros.h>
#include <tf/transform_listener.h>
#include <geometry_msgs/Twist.h>
#include <nav_msgs/Odometry.h>
#include "sensor_msgs/LaserScan.h"

double angular_z = 0;    //通过计算得出的slave与master的角度
double linear_x = 0;    //通过计算得出的slave与master的距离

double last_angular_z = 0;  
double last_linear_x = 0;
double ddyz = 0;
double ddyx = 0;
// 增益系数调节
double Scalex_P = 0; 
double Scalex_I = 0;
double Scalez_P =0;
double Scalez_I =0;
// 编队队形标志位
double roworleng = 1;

// tf变换相关参数
std::string base_frame;
std::string base_to_row;
std::string base_to_slave;
std::string tf_prefix_;

int main(int argc, char** argv){
  ros::init(argc, argv, "wheeltec_multi");

  ros::NodeHandle node;
  ros::NodeHandle private_nh("~");

  ros::Publisher slave_vel = node.advertise<geometry_msgs::Twist>("cmd_vel_ori", 10); //发布原始数据

  private_nh.param<double>("Scalex_P", Scalex_P, 0);  
  private_nh.param<double>("Scalex_I", Scalex_I, 0);   
  private_nh.param<double>("Scalez_I", Scalez_I, 0);  
  private_nh.param<double>("Scalez_P", Scalez_P, 0);  
  private_nh.param<double>("roworleng", roworleng,1);  

  private_nh.param<std::string>("base_frame", base_frame, "base_footprint");
  private_nh.param<std::string>("base_to_row", base_to_row, "row2");
  private_nh.param<std::string>("base_to_slave", base_to_slave, "slave2");

 // 使用tf_prefix参数将frame_name解析为frame_id
  tf_prefix_ = tf::getPrefixParam(private_nh); 
  base_frame = tf::resolve(tf_prefix_, base_frame);
  base_to_row = tf::resolve(tf_prefix_, base_to_row);
  base_to_slave = tf::resolve(tf_prefix_, base_to_slave);

  tf::TransformListener listener;
  geometry_msgs::Twist vel_msg;

  ros::Rate rate(10.0);
  while (node.ok()){
    tf::StampedTransform transformSM;
    //transformSM.header.stamp = ros::Time(0);
    //由 Slave 到 master 做tf变换
    try{  
      if(roworleng)
      {
        listener.waitForTransform(base_frame, base_to_row, ros::Time(0), ros::Duration(3.0));

        listener.lookupTransform(base_frame, base_to_row,
                               ros::Time(0), transformSM);
          printf("now the formation is row\n");
      }
    else
      {
        listener.waitForTransform(base_frame, base_to_slave, ros::Time(0), ros::Duration(3.0));

        listener.lookupTransform(base_frame,  base_to_slave, ros::Time(0), transformSM);
          printf("now the formation is slave\n");
      }
    }
    catch (tf::TransformException &ex) {
      ROS_ERROR("%s",ex.what());
      ros::Duration(1.0).sleep();
      continue; 
    } 
    // 输出原始数据信息
    printf("transformSM.getOrigin().x()= %f\n",transformSM.getOrigin().x());
    printf("transformSM.getOrigin().y()= %f\n",transformSM.getOrigin().y());

    angular_z = atan2((transformSM.getOrigin().y()),
                                   (transformSM.getOrigin().x()));
    linear_x = sqrt(pow((transformSM.getOrigin().x()), 2) +
                                  pow((transformSM.getOrigin().y()), 2));

    ddyx = last_linear_x - linear_x; 
    ddyz = last_angular_z - angular_z;
    // 避免静态误差
    /*
     if (linear_x>0.1 || linear_x<-0.1|| angular_z>0.5 || angular_z<-0.5)
    {
      vel_msg.linear.x = Scalex_I * linear_x + Scalex_P * ddyx;
      vel_msg.angular.z = Scalez_I * angular_z + Scalez_P * ddyz;
      //vel_msg.linear.x += Scalex_I * linear_x - Scalex_P * ddyx;
      //vel_msg.angular.z += Scalez_I * angular_z - Scalez_P * ddyz;
      if (vel_msg.linear.x>0.4) //输出速度限幅
      {
        vel_msg.linear.x=0.4;
      }
      else if (vel_msg.linear.x<-0.4) //输出速度限幅
      {
        vel_msg.linear.x=-0.4;
      }
      if (vel_msg.angular.z>3.14) //输出速度限幅
      {
        vel_msg.angular.z=3.14;
      }
      else if (vel_msg.angular.z<-3.14) //输出速度限幅
      {
        vel_msg.angular.z=-3.14;
      }
      // 保存上一次计算的数据
      last_linear_x = linear_x;
      last_angular_z = angular_z;
    }
    */
    if (linear_x>0.07)
    {
      vel_msg.linear.x = Scalex_I * linear_x + Scalex_P * ddyx;
      vel_msg.angular.z = Scalez_I * angular_z + Scalez_P * ddyz;
      last_linear_x = linear_x;
      last_angular_z = angular_z;
    }
    else 
    {
      vel_msg.linear.x = 0;
      vel_msg.angular.z = 0;
    }

    slave_vel.publish(vel_msg);
    ros::spinOnce();
    rate.sleep();
  }

  return 0;
};
