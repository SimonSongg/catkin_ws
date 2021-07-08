
import pyrealsense2 as rs
import numpy as np
import cv2
import os

# Start index
index = 0

# Configure depth and color streams
pipeline = rs.pipeline()
config = rs.config()

# Get device product line for setting a supporting resolution
pipeline_wrapper = rs.pipeline_wrapper(pipeline)
pipeline_profile = config.resolve(pipeline_wrapper)
device = pipeline_profile.get_device()
device_product_line = str(device.get_info(rs.camera_info.product_line))
depth_sensor = device.query_sensors()[0]
laser_pwr = depth_sensor.get_option(rs.option.laser_power)
print(laser_pwr)
depth_sensor.set_option(rs.option.laser_power, 360)

found_rgb = False
for s in device.sensors:
    if s.get_info(rs.camera_info.name) == 'RGB Camera':
        found_rgb = True
        break
if not found_rgb:
    print("The demo requires Depth camera with Color sensor")
    exit(0)

config.enable_stream(rs.stream.depth, 1280, 720, rs.format.z16, 30)
config.enable_stream(rs.stream.color, 1280, 720, rs.format.bgr8, 30)

for filename in os.listdir('D:\\catkin_ws\\vision_dataset_tool\\z16'):
    currentIndex = int(os.path.splitext(filename)[0])
    if currentIndex > index:
        index = currentIndex
for filename in os.listdir('D:\\catkin_ws\\vision_dataset_tool\\rgb8'):
    currentIndex = int(os.path.splitext(filename)[0])
    if currentIndex > index:
        index = currentIndex

index += 1

# Start streaming
pipeline.start(config)

try:
    while True:
        # Wait for a coherent pair of frames: depth and color
        frames = pipeline.wait_for_frames()
        depth_frame = frames.get_depth_frame()
        color_frame = frames.get_color_frame()
        if not depth_frame or not color_frame:
            continue

        # Convert images to numpy arrays
        depth_image = np.asanyarray(depth_frame.get_data())
        color_image = np.asanyarray(color_frame.get_data())

        # Show images
        cv2.namedWindow('RealSense1', cv2.WINDOW_AUTOSIZE)
        cv2.namedWindow('RealSense2', cv2.WINDOW_AUTOSIZE)
        cv2.imshow('RealSense1', depth_image)
        cv2.imshow('RealSense2', color_image)

        key = cv2.waitKey(1)
        #print(key)
        print (depth_sensor.get_option(rs.option.laser_power))
        if key == 115:  # s
            cv2.imwrite('D:\\catkin_ws\\vision_dataset_tool\\z16\\%d.png' % index, depth_image, [cv2.IMWRITE_PNG_COMPRESSION, 0])
            cv2.imwrite('D:\\catkin_ws\\vision_dataset_tool\\rgb8\\%d.png' % index, color_image, [cv2.IMWRITE_PNG_COMPRESSION, 0])
            index += 1
        elif key == 107:    # k
            break

finally:
    # Stop streaming
    pipeline.stop()