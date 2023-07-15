;; Auto-generated. Do not edit!


(when (boundp 'home_monitoring_pkg::PredictionMsg)
  (if (not (find-package "HOME_MONITORING_PKG"))
    (make-package "HOME_MONITORING_PKG"))
  (shadow 'PredictionMsg (find-package "HOME_MONITORING_PKG")))
(unless (find-package "HOME_MONITORING_PKG::PREDICTIONMSG")
  (make-package "HOME_MONITORING_PKG::PREDICTIONMSG"))

(in-package "ROS")
;;//! \htmlinclude PredictionMsg.msg.html


(defclass home_monitoring_pkg::PredictionMsg
  :super ros::object
  :slots (_label_mask _label_mask_prob _x_start _x_end _y_start _y_end _label_pose _label_pose_prob _x_pose _y_pose ))

(defmethod home_monitoring_pkg::PredictionMsg
  (:init
   (&key
    ((:label_mask __label_mask) "")
    ((:label_mask_prob __label_mask_prob) "")
    ((:x_start __x_start) 0)
    ((:x_end __x_end) 0)
    ((:y_start __y_start) 0)
    ((:y_end __y_end) 0)
    ((:label_pose __label_pose) "")
    ((:label_pose_prob __label_pose_prob) "")
    ((:x_pose __x_pose) 0.0)
    ((:y_pose __y_pose) 0.0)
    )
   (send-super :init)
   (setq _label_mask (string __label_mask))
   (setq _label_mask_prob (string __label_mask_prob))
   (setq _x_start (round __x_start))
   (setq _x_end (round __x_end))
   (setq _y_start (round __y_start))
   (setq _y_end (round __y_end))
   (setq _label_pose (string __label_pose))
   (setq _label_pose_prob (string __label_pose_prob))
   (setq _x_pose (float __x_pose))
   (setq _y_pose (float __y_pose))
   self)
  (:label_mask
   (&optional __label_mask)
   (if __label_mask (setq _label_mask __label_mask)) _label_mask)
  (:label_mask_prob
   (&optional __label_mask_prob)
   (if __label_mask_prob (setq _label_mask_prob __label_mask_prob)) _label_mask_prob)
  (:x_start
   (&optional __x_start)
   (if __x_start (setq _x_start __x_start)) _x_start)
  (:x_end
   (&optional __x_end)
   (if __x_end (setq _x_end __x_end)) _x_end)
  (:y_start
   (&optional __y_start)
   (if __y_start (setq _y_start __y_start)) _y_start)
  (:y_end
   (&optional __y_end)
   (if __y_end (setq _y_end __y_end)) _y_end)
  (:label_pose
   (&optional __label_pose)
   (if __label_pose (setq _label_pose __label_pose)) _label_pose)
  (:label_pose_prob
   (&optional __label_pose_prob)
   (if __label_pose_prob (setq _label_pose_prob __label_pose_prob)) _label_pose_prob)
  (:x_pose
   (&optional __x_pose)
   (if __x_pose (setq _x_pose __x_pose)) _x_pose)
  (:y_pose
   (&optional __y_pose)
   (if __y_pose (setq _y_pose __y_pose)) _y_pose)
  (:serialization-length
   ()
   (+
    ;; string _label_mask
    4 (length _label_mask)
    ;; string _label_mask_prob
    4 (length _label_mask_prob)
    ;; int64 _x_start
    8
    ;; int64 _x_end
    8
    ;; int64 _y_start
    8
    ;; int64 _y_end
    8
    ;; string _label_pose
    4 (length _label_pose)
    ;; string _label_pose_prob
    4 (length _label_pose_prob)
    ;; float32 _x_pose
    4
    ;; float32 _y_pose
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _label_mask
       (write-long (length _label_mask) s) (princ _label_mask s)
     ;; string _label_mask_prob
       (write-long (length _label_mask_prob) s) (princ _label_mask_prob s)
     ;; int64 _x_start
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _x_start (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _x_start) (= (length (_x_start . bv)) 2)) ;; bignum
              (write-long (ash (elt (_x_start . bv) 0) 0) s)
              (write-long (ash (elt (_x_start . bv) 1) -1) s))
             ((and (class _x_start) (= (length (_x_start . bv)) 1)) ;; big1
              (write-long (elt (_x_start . bv) 0) s)
              (write-long (if (>= _x_start 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _x_start s)(write-long (if (>= _x_start 0) 0 #xffffffff) s)))
     ;; int64 _x_end
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _x_end (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _x_end) (= (length (_x_end . bv)) 2)) ;; bignum
              (write-long (ash (elt (_x_end . bv) 0) 0) s)
              (write-long (ash (elt (_x_end . bv) 1) -1) s))
             ((and (class _x_end) (= (length (_x_end . bv)) 1)) ;; big1
              (write-long (elt (_x_end . bv) 0) s)
              (write-long (if (>= _x_end 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _x_end s)(write-long (if (>= _x_end 0) 0 #xffffffff) s)))
     ;; int64 _y_start
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _y_start (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _y_start) (= (length (_y_start . bv)) 2)) ;; bignum
              (write-long (ash (elt (_y_start . bv) 0) 0) s)
              (write-long (ash (elt (_y_start . bv) 1) -1) s))
             ((and (class _y_start) (= (length (_y_start . bv)) 1)) ;; big1
              (write-long (elt (_y_start . bv) 0) s)
              (write-long (if (>= _y_start 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _y_start s)(write-long (if (>= _y_start 0) 0 #xffffffff) s)))
     ;; int64 _y_end
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _y_end (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _y_end) (= (length (_y_end . bv)) 2)) ;; bignum
              (write-long (ash (elt (_y_end . bv) 0) 0) s)
              (write-long (ash (elt (_y_end . bv) 1) -1) s))
             ((and (class _y_end) (= (length (_y_end . bv)) 1)) ;; big1
              (write-long (elt (_y_end . bv) 0) s)
              (write-long (if (>= _y_end 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _y_end s)(write-long (if (>= _y_end 0) 0 #xffffffff) s)))
     ;; string _label_pose
       (write-long (length _label_pose) s) (princ _label_pose s)
     ;; string _label_pose_prob
       (write-long (length _label_pose_prob) s) (princ _label_pose_prob s)
     ;; float32 _x_pose
       (sys::poke _x_pose (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y_pose
       (sys::poke _y_pose (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _label_mask
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _label_mask (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _label_mask_prob
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _label_mask_prob (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int64 _x_start
#+(or :alpha :irix6 :x86_64)
      (setf _x_start (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _x_start (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _x_end
#+(or :alpha :irix6 :x86_64)
      (setf _x_end (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _x_end (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _y_start
#+(or :alpha :irix6 :x86_64)
      (setf _y_start (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _y_start (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _y_end
#+(or :alpha :irix6 :x86_64)
      (setf _y_end (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _y_end (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; string _label_pose
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _label_pose (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _label_pose_prob
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _label_pose_prob (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _x_pose
     (setq _x_pose (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y_pose
     (setq _y_pose (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get home_monitoring_pkg::PredictionMsg :md5sum-) "715dc63a1702758b9d710539c966074b")
(setf (get home_monitoring_pkg::PredictionMsg :datatype-) "home_monitoring_pkg/PredictionMsg")
(setf (get home_monitoring_pkg::PredictionMsg :definition-)
      "string label_mask
string label_mask_prob
int64 x_start
int64 x_end
int64 y_start
int64 y_end
string label_pose
string label_pose_prob
float32 x_pose
float32 y_pose



")



(provide :home_monitoring_pkg/PredictionMsg "715dc63a1702758b9d710539c966074b")


