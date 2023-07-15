; Auto-generated. Do not edit!


(cl:in-package home_monitoring_pkg-msg)


;//! \htmlinclude PredictionMsg.msg.html

(cl:defclass <PredictionMsg> (roslisp-msg-protocol:ros-message)
  ((label_mask
    :reader label_mask
    :initarg :label_mask
    :type cl:string
    :initform "")
   (label_mask_prob
    :reader label_mask_prob
    :initarg :label_mask_prob
    :type cl:string
    :initform "")
   (x_start
    :reader x_start
    :initarg :x_start
    :type cl:integer
    :initform 0)
   (x_end
    :reader x_end
    :initarg :x_end
    :type cl:integer
    :initform 0)
   (y_start
    :reader y_start
    :initarg :y_start
    :type cl:integer
    :initform 0)
   (y_end
    :reader y_end
    :initarg :y_end
    :type cl:integer
    :initform 0)
   (label_pose
    :reader label_pose
    :initarg :label_pose
    :type cl:string
    :initform "")
   (label_pose_prob
    :reader label_pose_prob
    :initarg :label_pose_prob
    :type cl:string
    :initform "")
   (x_pose
    :reader x_pose
    :initarg :x_pose
    :type cl:float
    :initform 0.0)
   (y_pose
    :reader y_pose
    :initarg :y_pose
    :type cl:float
    :initform 0.0))
)

(cl:defclass PredictionMsg (<PredictionMsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PredictionMsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PredictionMsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name home_monitoring_pkg-msg:<PredictionMsg> is deprecated: use home_monitoring_pkg-msg:PredictionMsg instead.")))

(cl:ensure-generic-function 'label_mask-val :lambda-list '(m))
(cl:defmethod label_mask-val ((m <PredictionMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader home_monitoring_pkg-msg:label_mask-val is deprecated.  Use home_monitoring_pkg-msg:label_mask instead.")
  (label_mask m))

(cl:ensure-generic-function 'label_mask_prob-val :lambda-list '(m))
(cl:defmethod label_mask_prob-val ((m <PredictionMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader home_monitoring_pkg-msg:label_mask_prob-val is deprecated.  Use home_monitoring_pkg-msg:label_mask_prob instead.")
  (label_mask_prob m))

(cl:ensure-generic-function 'x_start-val :lambda-list '(m))
(cl:defmethod x_start-val ((m <PredictionMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader home_monitoring_pkg-msg:x_start-val is deprecated.  Use home_monitoring_pkg-msg:x_start instead.")
  (x_start m))

(cl:ensure-generic-function 'x_end-val :lambda-list '(m))
(cl:defmethod x_end-val ((m <PredictionMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader home_monitoring_pkg-msg:x_end-val is deprecated.  Use home_monitoring_pkg-msg:x_end instead.")
  (x_end m))

(cl:ensure-generic-function 'y_start-val :lambda-list '(m))
(cl:defmethod y_start-val ((m <PredictionMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader home_monitoring_pkg-msg:y_start-val is deprecated.  Use home_monitoring_pkg-msg:y_start instead.")
  (y_start m))

(cl:ensure-generic-function 'y_end-val :lambda-list '(m))
(cl:defmethod y_end-val ((m <PredictionMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader home_monitoring_pkg-msg:y_end-val is deprecated.  Use home_monitoring_pkg-msg:y_end instead.")
  (y_end m))

(cl:ensure-generic-function 'label_pose-val :lambda-list '(m))
(cl:defmethod label_pose-val ((m <PredictionMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader home_monitoring_pkg-msg:label_pose-val is deprecated.  Use home_monitoring_pkg-msg:label_pose instead.")
  (label_pose m))

(cl:ensure-generic-function 'label_pose_prob-val :lambda-list '(m))
(cl:defmethod label_pose_prob-val ((m <PredictionMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader home_monitoring_pkg-msg:label_pose_prob-val is deprecated.  Use home_monitoring_pkg-msg:label_pose_prob instead.")
  (label_pose_prob m))

(cl:ensure-generic-function 'x_pose-val :lambda-list '(m))
(cl:defmethod x_pose-val ((m <PredictionMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader home_monitoring_pkg-msg:x_pose-val is deprecated.  Use home_monitoring_pkg-msg:x_pose instead.")
  (x_pose m))

(cl:ensure-generic-function 'y_pose-val :lambda-list '(m))
(cl:defmethod y_pose-val ((m <PredictionMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader home_monitoring_pkg-msg:y_pose-val is deprecated.  Use home_monitoring_pkg-msg:y_pose instead.")
  (y_pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PredictionMsg>) ostream)
  "Serializes a message object of type '<PredictionMsg>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'label_mask))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'label_mask))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'label_mask_prob))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'label_mask_prob))
  (cl:let* ((signed (cl:slot-value msg 'x_start)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'x_end)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'y_start)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'y_end)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'label_pose))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'label_pose))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'label_pose_prob))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'label_pose_prob))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'x_pose))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y_pose))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PredictionMsg>) istream)
  "Deserializes a message object of type '<PredictionMsg>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'label_mask) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'label_mask) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'label_mask_prob) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'label_mask_prob) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'x_start) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'x_end) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'y_start) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'y_end) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'label_pose) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'label_pose) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'label_pose_prob) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'label_pose_prob) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x_pose) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y_pose) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PredictionMsg>)))
  "Returns string type for a message object of type '<PredictionMsg>"
  "home_monitoring_pkg/PredictionMsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PredictionMsg)))
  "Returns string type for a message object of type 'PredictionMsg"
  "home_monitoring_pkg/PredictionMsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PredictionMsg>)))
  "Returns md5sum for a message object of type '<PredictionMsg>"
  "715dc63a1702758b9d710539c966074b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PredictionMsg)))
  "Returns md5sum for a message object of type 'PredictionMsg"
  "715dc63a1702758b9d710539c966074b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PredictionMsg>)))
  "Returns full string definition for message of type '<PredictionMsg>"
  (cl:format cl:nil "string label_mask~%string label_mask_prob~%int64 x_start~%int64 x_end~%int64 y_start~%int64 y_end~%string label_pose~%string label_pose_prob~%float32 x_pose~%float32 y_pose~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PredictionMsg)))
  "Returns full string definition for message of type 'PredictionMsg"
  (cl:format cl:nil "string label_mask~%string label_mask_prob~%int64 x_start~%int64 x_end~%int64 y_start~%int64 y_end~%string label_pose~%string label_pose_prob~%float32 x_pose~%float32 y_pose~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PredictionMsg>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'label_mask))
     4 (cl:length (cl:slot-value msg 'label_mask_prob))
     8
     8
     8
     8
     4 (cl:length (cl:slot-value msg 'label_pose))
     4 (cl:length (cl:slot-value msg 'label_pose_prob))
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PredictionMsg>))
  "Converts a ROS message object to a list"
  (cl:list 'PredictionMsg
    (cl:cons ':label_mask (label_mask msg))
    (cl:cons ':label_mask_prob (label_mask_prob msg))
    (cl:cons ':x_start (x_start msg))
    (cl:cons ':x_end (x_end msg))
    (cl:cons ':y_start (y_start msg))
    (cl:cons ':y_end (y_end msg))
    (cl:cons ':label_pose (label_pose msg))
    (cl:cons ':label_pose_prob (label_pose_prob msg))
    (cl:cons ':x_pose (x_pose msg))
    (cl:cons ':y_pose (y_pose msg))
))
