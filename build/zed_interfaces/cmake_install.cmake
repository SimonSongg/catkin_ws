# Install script for directory: /home/adv/catkin_ws/src/zed_interfaces

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/adv/catkin_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/zed_interfaces/msg" TYPE FILE FILES
    "/home/adv/catkin_ws/src/zed_interfaces/msg/BoundingBox2Df.msg"
    "/home/adv/catkin_ws/src/zed_interfaces/msg/BoundingBox2Di.msg"
    "/home/adv/catkin_ws/src/zed_interfaces/msg/BoundingBox3D.msg"
    "/home/adv/catkin_ws/src/zed_interfaces/msg/Keypoint2Df.msg"
    "/home/adv/catkin_ws/src/zed_interfaces/msg/Keypoint2Di.msg"
    "/home/adv/catkin_ws/src/zed_interfaces/msg/Keypoint3D.msg"
    "/home/adv/catkin_ws/src/zed_interfaces/msg/Object.msg"
    "/home/adv/catkin_ws/src/zed_interfaces/msg/ObjectsStamped.msg"
    "/home/adv/catkin_ws/src/zed_interfaces/msg/Skeleton2D.msg"
    "/home/adv/catkin_ws/src/zed_interfaces/msg/Skeleton3D.msg"
    "/home/adv/catkin_ws/src/zed_interfaces/msg/RGBDSensors.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/zed_interfaces/srv" TYPE FILE FILES
    "/home/adv/catkin_ws/src/zed_interfaces/srv/set_pose.srv"
    "/home/adv/catkin_ws/src/zed_interfaces/srv/reset_odometry.srv"
    "/home/adv/catkin_ws/src/zed_interfaces/srv/reset_tracking.srv"
    "/home/adv/catkin_ws/src/zed_interfaces/srv/start_svo_recording.srv"
    "/home/adv/catkin_ws/src/zed_interfaces/srv/stop_svo_recording.srv"
    "/home/adv/catkin_ws/src/zed_interfaces/srv/start_remote_stream.srv"
    "/home/adv/catkin_ws/src/zed_interfaces/srv/stop_remote_stream.srv"
    "/home/adv/catkin_ws/src/zed_interfaces/srv/set_led_status.srv"
    "/home/adv/catkin_ws/src/zed_interfaces/srv/toggle_led.srv"
    "/home/adv/catkin_ws/src/zed_interfaces/srv/start_3d_mapping.srv"
    "/home/adv/catkin_ws/src/zed_interfaces/srv/stop_3d_mapping.srv"
    "/home/adv/catkin_ws/src/zed_interfaces/srv/start_object_detection.srv"
    "/home/adv/catkin_ws/src/zed_interfaces/srv/stop_object_detection.srv"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/zed_interfaces/cmake" TYPE FILE FILES "/home/adv/catkin_ws/build/zed_interfaces/catkin_generated/installspace/zed_interfaces-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/adv/catkin_ws/devel/include/zed_interfaces")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/adv/catkin_ws/devel/share/roseus/ros/zed_interfaces")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/adv/catkin_ws/devel/share/common-lisp/ros/zed_interfaces")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/adv/catkin_ws/devel/share/gennodejs/ros/zed_interfaces")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python2" -m compileall "/home/adv/catkin_ws/devel/lib/python2.7/dist-packages/zed_interfaces")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/adv/catkin_ws/devel/lib/python2.7/dist-packages/zed_interfaces")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/adv/catkin_ws/build/zed_interfaces/catkin_generated/installspace/zed_interfaces.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/zed_interfaces/cmake" TYPE FILE FILES "/home/adv/catkin_ws/build/zed_interfaces/catkin_generated/installspace/zed_interfaces-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/zed_interfaces/cmake" TYPE FILE FILES
    "/home/adv/catkin_ws/build/zed_interfaces/catkin_generated/installspace/zed_interfacesConfig.cmake"
    "/home/adv/catkin_ws/build/zed_interfaces/catkin_generated/installspace/zed_interfacesConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/zed_interfaces" TYPE FILE FILES "/home/adv/catkin_ws/src/zed_interfaces/package.xml")
endif()

