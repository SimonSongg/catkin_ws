# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "gpspub: 2 messages, 0 services")

set(MSG_I_FLAGS "-Igpspub:/home/adv/catkin_ws/src/gpspub/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(gpspub_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/adv/catkin_ws/src/gpspub/msg/adv_gpsmsg.msg" NAME_WE)
add_custom_target(_gpspub_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "gpspub" "/home/adv/catkin_ws/src/gpspub/msg/adv_gpsmsg.msg" ""
)

get_filename_component(_filename "/home/adv/catkin_ws/src/gpspub/msg/radardata.msg" NAME_WE)
add_custom_target(_gpspub_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "gpspub" "/home/adv/catkin_ws/src/gpspub/msg/radardata.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(gpspub
  "/home/adv/catkin_ws/src/gpspub/msg/adv_gpsmsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/gpspub
)
_generate_msg_cpp(gpspub
  "/home/adv/catkin_ws/src/gpspub/msg/radardata.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/gpspub
)

### Generating Services

### Generating Module File
_generate_module_cpp(gpspub
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/gpspub
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(gpspub_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(gpspub_generate_messages gpspub_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/adv/catkin_ws/src/gpspub/msg/adv_gpsmsg.msg" NAME_WE)
add_dependencies(gpspub_generate_messages_cpp _gpspub_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/adv/catkin_ws/src/gpspub/msg/radardata.msg" NAME_WE)
add_dependencies(gpspub_generate_messages_cpp _gpspub_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(gpspub_gencpp)
add_dependencies(gpspub_gencpp gpspub_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS gpspub_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(gpspub
  "/home/adv/catkin_ws/src/gpspub/msg/adv_gpsmsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/gpspub
)
_generate_msg_eus(gpspub
  "/home/adv/catkin_ws/src/gpspub/msg/radardata.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/gpspub
)

### Generating Services

### Generating Module File
_generate_module_eus(gpspub
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/gpspub
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(gpspub_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(gpspub_generate_messages gpspub_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/adv/catkin_ws/src/gpspub/msg/adv_gpsmsg.msg" NAME_WE)
add_dependencies(gpspub_generate_messages_eus _gpspub_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/adv/catkin_ws/src/gpspub/msg/radardata.msg" NAME_WE)
add_dependencies(gpspub_generate_messages_eus _gpspub_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(gpspub_geneus)
add_dependencies(gpspub_geneus gpspub_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS gpspub_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(gpspub
  "/home/adv/catkin_ws/src/gpspub/msg/adv_gpsmsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/gpspub
)
_generate_msg_lisp(gpspub
  "/home/adv/catkin_ws/src/gpspub/msg/radardata.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/gpspub
)

### Generating Services

### Generating Module File
_generate_module_lisp(gpspub
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/gpspub
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(gpspub_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(gpspub_generate_messages gpspub_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/adv/catkin_ws/src/gpspub/msg/adv_gpsmsg.msg" NAME_WE)
add_dependencies(gpspub_generate_messages_lisp _gpspub_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/adv/catkin_ws/src/gpspub/msg/radardata.msg" NAME_WE)
add_dependencies(gpspub_generate_messages_lisp _gpspub_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(gpspub_genlisp)
add_dependencies(gpspub_genlisp gpspub_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS gpspub_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(gpspub
  "/home/adv/catkin_ws/src/gpspub/msg/adv_gpsmsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/gpspub
)
_generate_msg_nodejs(gpspub
  "/home/adv/catkin_ws/src/gpspub/msg/radardata.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/gpspub
)

### Generating Services

### Generating Module File
_generate_module_nodejs(gpspub
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/gpspub
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(gpspub_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(gpspub_generate_messages gpspub_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/adv/catkin_ws/src/gpspub/msg/adv_gpsmsg.msg" NAME_WE)
add_dependencies(gpspub_generate_messages_nodejs _gpspub_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/adv/catkin_ws/src/gpspub/msg/radardata.msg" NAME_WE)
add_dependencies(gpspub_generate_messages_nodejs _gpspub_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(gpspub_gennodejs)
add_dependencies(gpspub_gennodejs gpspub_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS gpspub_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(gpspub
  "/home/adv/catkin_ws/src/gpspub/msg/adv_gpsmsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/gpspub
)
_generate_msg_py(gpspub
  "/home/adv/catkin_ws/src/gpspub/msg/radardata.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/gpspub
)

### Generating Services

### Generating Module File
_generate_module_py(gpspub
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/gpspub
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(gpspub_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(gpspub_generate_messages gpspub_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/adv/catkin_ws/src/gpspub/msg/adv_gpsmsg.msg" NAME_WE)
add_dependencies(gpspub_generate_messages_py _gpspub_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/adv/catkin_ws/src/gpspub/msg/radardata.msg" NAME_WE)
add_dependencies(gpspub_generate_messages_py _gpspub_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(gpspub_genpy)
add_dependencies(gpspub_genpy gpspub_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS gpspub_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/gpspub)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/gpspub
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(gpspub_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/gpspub)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/gpspub
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(gpspub_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/gpspub)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/gpspub
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(gpspub_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/gpspub)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/gpspub
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(gpspub_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/gpspub)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/gpspub\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/gpspub
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(gpspub_generate_messages_py std_msgs_generate_messages_py)
endif()
