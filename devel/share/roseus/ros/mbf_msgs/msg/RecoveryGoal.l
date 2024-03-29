;; Auto-generated. Do not edit!


(when (boundp 'mbf_msgs::RecoveryGoal)
  (if (not (find-package "MBF_MSGS"))
    (make-package "MBF_MSGS"))
  (shadow 'RecoveryGoal (find-package "MBF_MSGS")))
(unless (find-package "MBF_MSGS::RECOVERYGOAL")
  (make-package "MBF_MSGS::RECOVERYGOAL"))

(in-package "ROS")
;;//! \htmlinclude RecoveryGoal.msg.html


(defclass mbf_msgs::RecoveryGoal
  :super ros::object
  :slots (_behavior _concurrency_slot ))

(defmethod mbf_msgs::RecoveryGoal
  (:init
   (&key
    ((:behavior __behavior) "")
    ((:concurrency_slot __concurrency_slot) 0)
    )
   (send-super :init)
   (setq _behavior (string __behavior))
   (setq _concurrency_slot (round __concurrency_slot))
   self)
  (:behavior
   (&optional __behavior)
   (if __behavior (setq _behavior __behavior)) _behavior)
  (:concurrency_slot
   (&optional __concurrency_slot)
   (if __concurrency_slot (setq _concurrency_slot __concurrency_slot)) _concurrency_slot)
  (:serialization-length
   ()
   (+
    ;; string _behavior
    4 (length _behavior)
    ;; uint8 _concurrency_slot
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _behavior
       (write-long (length _behavior) s) (princ _behavior s)
     ;; uint8 _concurrency_slot
       (write-byte _concurrency_slot s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _behavior
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _behavior (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint8 _concurrency_slot
     (setq _concurrency_slot (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get mbf_msgs::RecoveryGoal :md5sum-) "ce28884316a172b85e57b78a84014451")
(setf (get mbf_msgs::RecoveryGoal :datatype-) "mbf_msgs/RecoveryGoal")
(setf (get mbf_msgs::RecoveryGoal :definition-)
      "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
# Run one of the recovery behavior listed on recovery_behaviors parameter

string behavior

# use different slots for concurrency
uint8 concurrency_slot


")



(provide :mbf_msgs/RecoveryGoal "ce28884316a172b85e57b78a84014451")


