// Generated by gencpp from file world_canvas_msgs/DeleteMap.msg
// DO NOT EDIT!


#ifndef WORLD_CANVAS_MSGS_MESSAGE_DELETEMAP_H
#define WORLD_CANVAS_MSGS_MESSAGE_DELETEMAP_H

#include <ros/service_traits.h>


#include <world_canvas_msgs/DeleteMapRequest.h>
#include <world_canvas_msgs/DeleteMapResponse.h>


namespace world_canvas_msgs
{

struct DeleteMap
{

typedef DeleteMapRequest Request;
typedef DeleteMapResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct DeleteMap
} // namespace world_canvas_msgs


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::world_canvas_msgs::DeleteMap > {
  static const char* value()
  {
    return "d742ddbd5e3e8937162044ae4b300275";
  }

  static const char* value(const ::world_canvas_msgs::DeleteMap&) { return value(); }
};

template<>
struct DataType< ::world_canvas_msgs::DeleteMap > {
  static const char* value()
  {
    return "world_canvas_msgs/DeleteMap";
  }

  static const char* value(const ::world_canvas_msgs::DeleteMap&) { return value(); }
};


// service_traits::MD5Sum< ::world_canvas_msgs::DeleteMapRequest> should match
// service_traits::MD5Sum< ::world_canvas_msgs::DeleteMap >
template<>
struct MD5Sum< ::world_canvas_msgs::DeleteMapRequest>
{
  static const char* value()
  {
    return MD5Sum< ::world_canvas_msgs::DeleteMap >::value();
  }
  static const char* value(const ::world_canvas_msgs::DeleteMapRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::world_canvas_msgs::DeleteMapRequest> should match
// service_traits::DataType< ::world_canvas_msgs::DeleteMap >
template<>
struct DataType< ::world_canvas_msgs::DeleteMapRequest>
{
  static const char* value()
  {
    return DataType< ::world_canvas_msgs::DeleteMap >::value();
  }
  static const char* value(const ::world_canvas_msgs::DeleteMapRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::world_canvas_msgs::DeleteMapResponse> should match
// service_traits::MD5Sum< ::world_canvas_msgs::DeleteMap >
template<>
struct MD5Sum< ::world_canvas_msgs::DeleteMapResponse>
{
  static const char* value()
  {
    return MD5Sum< ::world_canvas_msgs::DeleteMap >::value();
  }
  static const char* value(const ::world_canvas_msgs::DeleteMapResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::world_canvas_msgs::DeleteMapResponse> should match
// service_traits::DataType< ::world_canvas_msgs::DeleteMap >
template<>
struct DataType< ::world_canvas_msgs::DeleteMapResponse>
{
  static const char* value()
  {
    return DataType< ::world_canvas_msgs::DeleteMap >::value();
  }
  static const char* value(const ::world_canvas_msgs::DeleteMapResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // WORLD_CANVAS_MSGS_MESSAGE_DELETEMAP_H
