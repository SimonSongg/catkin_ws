# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include".split(';') if "${prefix}/include" != "" else []
PROJECT_CATKIN_DEPENDS = "geometry_msgs;pluginlib;roscpp;std_msgs;message_runtime;dynamic_reconfigure;costmap_2d".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-lcostmap_converter".split(';') if "-lcostmap_converter" != "" else []
PROJECT_NAME = "costmap_converter"
PROJECT_SPACE_DIR = "/home/adv/catkin_ws/install"
PROJECT_VERSION = "0.0.13"
