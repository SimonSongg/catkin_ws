
(cl:in-package :asdf)

(defsystem "xf_mic_asr_offline-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Get_Awake_Angle_srv" :depends-on ("_package_Get_Awake_Angle_srv"))
    (:file "_package_Get_Awake_Angle_srv" :depends-on ("_package"))
    (:file "Get_Major_Mic_srv" :depends-on ("_package_Get_Major_Mic_srv"))
    (:file "_package_Get_Major_Mic_srv" :depends-on ("_package"))
    (:file "Get_Offline_Result_srv" :depends-on ("_package_Get_Offline_Result_srv"))
    (:file "_package_Get_Offline_Result_srv" :depends-on ("_package"))
    (:file "Set_Awake_Word_srv" :depends-on ("_package_Set_Awake_Word_srv"))
    (:file "_package_Set_Awake_Word_srv" :depends-on ("_package"))
    (:file "Set_Led_On_srv" :depends-on ("_package_Set_Led_On_srv"))
    (:file "_package_Set_Led_On_srv" :depends-on ("_package"))
    (:file "Set_Major_Mic_srv" :depends-on ("_package_Set_Major_Mic_srv"))
    (:file "_package_Set_Major_Mic_srv" :depends-on ("_package"))
    (:file "Start_Record_srv" :depends-on ("_package_Start_Record_srv"))
    (:file "_package_Start_Record_srv" :depends-on ("_package"))
  ))