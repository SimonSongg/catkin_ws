;; Auto-generated. Do not edit!


(when (boundp 'mbf_msgs::GetPathFeedback)
  (if (not (find-package "MBF_MSGS"))
    (make-package "MBF_MSGS"))
  (shadow 'GetPathFeedback (find-package "MBF_MSGS")))
(unless (find-package "MBF_MSGS::GETPATHFEEDBACK")
  (make-package "MBF_MSGS::GETPATHFEEDBACK"))

(in-package "ROS")
;;//! \htmlinclude GetPathFeedback.msg.html


(defclass mbf_msgs::GetPathFeedback
  :super ros::object
  :slots ())

(defmethod mbf_msgs::GetPathFeedback
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(setf (get mbf_msgs::GetPathFeedback :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get mbf_msgs::GetPathFeedback :datatype-) "mbf_msgs/GetPathFeedback")
(setf (get mbf_msgs::GetPathFeedback :definition-)
      "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======


")



(provide :mbf_msgs/GetPathFeedback "d41d8cd98f00b204e9800998ecf8427e")


