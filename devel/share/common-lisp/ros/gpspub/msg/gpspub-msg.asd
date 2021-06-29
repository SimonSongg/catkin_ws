
(cl:in-package :asdf)

(defsystem "gpspub-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "adv_gpsmsg" :depends-on ("_package_adv_gpsmsg"))
    (:file "_package_adv_gpsmsg" :depends-on ("_package"))
    (:file "radardata" :depends-on ("_package_radardata"))
    (:file "_package_radardata" :depends-on ("_package"))
  ))