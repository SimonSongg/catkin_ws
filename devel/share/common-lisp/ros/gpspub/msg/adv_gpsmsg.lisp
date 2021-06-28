; Auto-generated. Do not edit!


(cl:in-package gpspub-msg)


;//! \htmlinclude adv_gpsmsg.msg.html

(cl:defclass <adv_gpsmsg> (roslisp-msg-protocol:ros-message)
  ((Flag
    :reader Flag
    :initarg :Flag
    :type cl:fixnum
    :initform 0)
   (Latitude
    :reader Latitude
    :initarg :Latitude
    :type cl:float
    :initform 0.0)
   (Longitude
    :reader Longitude
    :initarg :Longitude
    :type cl:float
    :initform 0.0)
   (Accuracy
    :reader Accuracy
    :initarg :Accuracy
    :type cl:float
    :initform 0.0)
   (Speed
    :reader Speed
    :initarg :Speed
    :type cl:float
    :initform 0.0))
)

(cl:defclass adv_gpsmsg (<adv_gpsmsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <adv_gpsmsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'adv_gpsmsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name gpspub-msg:<adv_gpsmsg> is deprecated: use gpspub-msg:adv_gpsmsg instead.")))

(cl:ensure-generic-function 'Flag-val :lambda-list '(m))
(cl:defmethod Flag-val ((m <adv_gpsmsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gpspub-msg:Flag-val is deprecated.  Use gpspub-msg:Flag instead.")
  (Flag m))

(cl:ensure-generic-function 'Latitude-val :lambda-list '(m))
(cl:defmethod Latitude-val ((m <adv_gpsmsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gpspub-msg:Latitude-val is deprecated.  Use gpspub-msg:Latitude instead.")
  (Latitude m))

(cl:ensure-generic-function 'Longitude-val :lambda-list '(m))
(cl:defmethod Longitude-val ((m <adv_gpsmsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gpspub-msg:Longitude-val is deprecated.  Use gpspub-msg:Longitude instead.")
  (Longitude m))

(cl:ensure-generic-function 'Accuracy-val :lambda-list '(m))
(cl:defmethod Accuracy-val ((m <adv_gpsmsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gpspub-msg:Accuracy-val is deprecated.  Use gpspub-msg:Accuracy instead.")
  (Accuracy m))

(cl:ensure-generic-function 'Speed-val :lambda-list '(m))
(cl:defmethod Speed-val ((m <adv_gpsmsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gpspub-msg:Speed-val is deprecated.  Use gpspub-msg:Speed instead.")
  (Speed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <adv_gpsmsg>) ostream)
  "Serializes a message object of type '<adv_gpsmsg>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Flag)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Latitude))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Longitude))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Accuracy))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <adv_gpsmsg>) istream)
  "Deserializes a message object of type '<adv_gpsmsg>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'Flag)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Latitude) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Longitude) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Accuracy) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Speed) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<adv_gpsmsg>)))
  "Returns string type for a message object of type '<adv_gpsmsg>"
  "gpspub/adv_gpsmsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'adv_gpsmsg)))
  "Returns string type for a message object of type 'adv_gpsmsg"
  "gpspub/adv_gpsmsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<adv_gpsmsg>)))
  "Returns md5sum for a message object of type '<adv_gpsmsg>"
  "7044bd9f13e700cf1742e5c8e5794818")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'adv_gpsmsg)))
  "Returns md5sum for a message object of type 'adv_gpsmsg"
  "7044bd9f13e700cf1742e5c8e5794818")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<adv_gpsmsg>)))
  "Returns full string definition for message of type '<adv_gpsmsg>"
  (cl:format cl:nil "uint8 Flag~%float32 Latitude~%float32 Longitude~%float32 Accuracy~%float32 Speed~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'adv_gpsmsg)))
  "Returns full string definition for message of type 'adv_gpsmsg"
  (cl:format cl:nil "uint8 Flag~%float32 Latitude~%float32 Longitude~%float32 Accuracy~%float32 Speed~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <adv_gpsmsg>))
  (cl:+ 0
     1
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <adv_gpsmsg>))
  "Converts a ROS message object to a list"
  (cl:list 'adv_gpsmsg
    (cl:cons ':Flag (Flag msg))
    (cl:cons ':Latitude (Latitude msg))
    (cl:cons ':Longitude (Longitude msg))
    (cl:cons ':Accuracy (Accuracy msg))
    (cl:cons ':Speed (Speed msg))
))
