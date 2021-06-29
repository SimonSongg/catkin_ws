; Auto-generated. Do not edit!


(cl:in-package gpspub-msg)


;//! \htmlinclude radardata.msg.html

(cl:defclass <radardata> (roslisp-msg-protocol:ros-message)
  ((RadarData
    :reader RadarData
    :initarg :RadarData
    :type (cl:vector cl:float)
   :initform (cl:make-array 32 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass radardata (<radardata>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <radardata>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'radardata)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name gpspub-msg:<radardata> is deprecated: use gpspub-msg:radardata instead.")))

(cl:ensure-generic-function 'RadarData-val :lambda-list '(m))
(cl:defmethod RadarData-val ((m <radardata>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gpspub-msg:RadarData-val is deprecated.  Use gpspub-msg:RadarData instead.")
  (RadarData m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <radardata>) ostream)
  "Serializes a message object of type '<radardata>"
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'RadarData))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <radardata>) istream)
  "Deserializes a message object of type '<radardata>"
  (cl:setf (cl:slot-value msg 'RadarData) (cl:make-array 32))
  (cl:let ((vals (cl:slot-value msg 'RadarData)))
    (cl:dotimes (i 32)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<radardata>)))
  "Returns string type for a message object of type '<radardata>"
  "gpspub/radardata")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'radardata)))
  "Returns string type for a message object of type 'radardata"
  "gpspub/radardata")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<radardata>)))
  "Returns md5sum for a message object of type '<radardata>"
  "3bdcd1bf0fe69ee97213b20c034863f7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'radardata)))
  "Returns md5sum for a message object of type 'radardata"
  "3bdcd1bf0fe69ee97213b20c034863f7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<radardata>)))
  "Returns full string definition for message of type '<radardata>"
  (cl:format cl:nil "float64[32] RadarData~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'radardata)))
  "Returns full string definition for message of type 'radardata"
  (cl:format cl:nil "float64[32] RadarData~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <radardata>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'RadarData) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <radardata>))
  "Converts a ROS message object to a list"
  (cl:list 'radardata
    (cl:cons ':RadarData (RadarData msg))
))
