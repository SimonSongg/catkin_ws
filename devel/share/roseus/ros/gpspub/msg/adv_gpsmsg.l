;; Auto-generated. Do not edit!


(when (boundp 'gpspub::adv_gpsmsg)
  (if (not (find-package "GPSPUB"))
    (make-package "GPSPUB"))
  (shadow 'adv_gpsmsg (find-package "GPSPUB")))
(unless (find-package "GPSPUB::ADV_GPSMSG")
  (make-package "GPSPUB::ADV_GPSMSG"))

(in-package "ROS")
;;//! \htmlinclude adv_gpsmsg.msg.html


(defclass gpspub::adv_gpsmsg
  :super ros::object
  :slots (_Flag _Latitude _Longitude _Accuracy _Speed ))

(defmethod gpspub::adv_gpsmsg
  (:init
   (&key
    ((:Flag __Flag) 0)
    ((:Latitude __Latitude) 0.0)
    ((:Longitude __Longitude) 0.0)
    ((:Accuracy __Accuracy) 0.0)
    ((:Speed __Speed) 0.0)
    )
   (send-super :init)
   (setq _Flag (round __Flag))
   (setq _Latitude (float __Latitude))
   (setq _Longitude (float __Longitude))
   (setq _Accuracy (float __Accuracy))
   (setq _Speed (float __Speed))
   self)
  (:Flag
   (&optional __Flag)
   (if __Flag (setq _Flag __Flag)) _Flag)
  (:Latitude
   (&optional __Latitude)
   (if __Latitude (setq _Latitude __Latitude)) _Latitude)
  (:Longitude
   (&optional __Longitude)
   (if __Longitude (setq _Longitude __Longitude)) _Longitude)
  (:Accuracy
   (&optional __Accuracy)
   (if __Accuracy (setq _Accuracy __Accuracy)) _Accuracy)
  (:Speed
   (&optional __Speed)
   (if __Speed (setq _Speed __Speed)) _Speed)
  (:serialization-length
   ()
   (+
    ;; uint8 _Flag
    1
    ;; float32 _Latitude
    4
    ;; float32 _Longitude
    4
    ;; float32 _Accuracy
    4
    ;; float32 _Speed
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _Flag
       (write-byte _Flag s)
     ;; float32 _Latitude
       (sys::poke _Latitude (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Longitude
       (sys::poke _Longitude (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Accuracy
       (sys::poke _Accuracy (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Speed
       (sys::poke _Speed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _Flag
     (setq _Flag (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _Latitude
     (setq _Latitude (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Longitude
     (setq _Longitude (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Accuracy
     (setq _Accuracy (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Speed
     (setq _Speed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get gpspub::adv_gpsmsg :md5sum-) "7044bd9f13e700cf1742e5c8e5794818")
(setf (get gpspub::adv_gpsmsg :datatype-) "gpspub/adv_gpsmsg")
(setf (get gpspub::adv_gpsmsg :definition-)
      "uint8 Flag
float32 Latitude
float32 Longitude
float32 Accuracy
float32 Speed
")



(provide :gpspub/adv_gpsmsg "7044bd9f13e700cf1742e5c8e5794818")


