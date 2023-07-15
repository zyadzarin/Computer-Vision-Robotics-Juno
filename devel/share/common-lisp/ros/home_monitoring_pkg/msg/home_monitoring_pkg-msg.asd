
(cl:in-package :asdf)

(defsystem "home_monitoring_pkg-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "PredictionMsg" :depends-on ("_package_PredictionMsg"))
    (:file "_package_PredictionMsg" :depends-on ("_package"))
  ))