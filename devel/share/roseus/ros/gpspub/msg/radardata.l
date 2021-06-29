;; Auto-generated. Do not edit!


(when (boundp 'gpspub::radardata)
  (if (not (find-package "GPSPUB"))
    (make-package "GPSPUB"))
  (shadow 'radardata (find-package "GPSPUB")))
(unless (find-package "GPSPUB::RADARDATA")
  (make-package "GPSPUB::RADARDATA"))

(in-package "ROS")
;;//! \htmlinclude radardata.msg.html


(defclass gpspub::radardata
  :super ros::object
  :slots (_RadarData ))

(defmethod gpspub::radardata
  (:init
   (&key
    ((:RadarData __RadarData) (make-array 32 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _RadarData __RadarData)
   self)
  (:RadarData
   (&optional __RadarData)
   (if __RadarData (setq _RadarData __RadarData)) _RadarData)
  (:serialization-length
   ()
   (+
    ;; float64[32] _RadarData
    (* 8    32)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[32] _RadarData
     (dotimes (i 32)
       (sys::poke (elt _RadarData i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[32] _RadarData
   (dotimes (i (length _RadarData))
     (setf (elt _RadarData i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;;
   self)
  )

(setf (get gpspub::radardata :md5sum-) "3bdcd1bf0fe69ee97213b20c034863f7")
(setf (get gpspub::radardata :datatype-) "gpspub/radardata")
(setf (get gpspub::radardata :definition-)
      "float64[32] RadarData

")



(provide :gpspub/radardata "3bdcd1bf0fe69ee97213b20c034863f7")


