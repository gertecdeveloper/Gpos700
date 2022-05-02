
unit JavaInterfaces;

interface

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.App,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Os,
  Androidapi.JNI.Util,
  Androidapi.JNI.Widget;

type
// ===== Forward declarations =====

  JAnimator = interface;//android.animation.Animator
  JAnimator_AnimatorListener = interface;//android.animation.Animator$AnimatorListener
  JAnimator_AnimatorPauseListener = interface;//android.animation.Animator$AnimatorPauseListener
  JKeyframe = interface;//android.animation.Keyframe
  JLayoutTransition = interface;//android.animation.LayoutTransition
  JLayoutTransition_TransitionListener = interface;//android.animation.LayoutTransition$TransitionListener
  JPropertyValuesHolder = interface;//android.animation.PropertyValuesHolder
  JStateListAnimator = interface;//android.animation.StateListAnimator
  JTimeInterpolator = interface;//android.animation.TimeInterpolator
  JTypeConverter = interface;//android.animation.TypeConverter
  JTypeEvaluator = interface;//android.animation.TypeEvaluator
  JValueAnimator = interface;//android.animation.ValueAnimator
  JValueAnimator_AnimatorUpdateListener = interface;//android.animation.ValueAnimator$AnimatorUpdateListener
  JPathMotion = interface;//android.transition.PathMotion
  JScene = interface;//android.transition.Scene
  JTransition = interface;//android.transition.Transition
  JTransition_EpicenterCallback = interface;//android.transition.Transition$EpicenterCallback
  JTransition_TransitionListener = interface;//android.transition.Transition$TransitionListener
  JTransitionManager = interface;//android.transition.TransitionManager
  JTransitionPropagation = interface;//android.transition.TransitionPropagation
  JTransitionValues = interface;//android.transition.TransitionValues
  JInterpolator = interface;//android.view.animation.Interpolator
  JToolbar_LayoutParams = interface;//android.widget.Toolbar$LayoutParams
  Jgertec_Logger = interface;//br.com.gertec.Logger
  Jgertec_a_a = interface;//br.com.gertec.a.a
  Jgertec_a_a_a = interface;//br.com.gertec.a.a$a
  Ja_a_a_a = interface;//br.com.gertec.a.a$a$a
  JIGEDI = interface;//br.com.gertec.gedi.interfaces.IGEDI
  JGEDI = interface;//br.com.gertec.gedi.GEDI
  JGEDI_1 = interface;//br.com.gertec.gedi.GEDI$1
  JGEDI_KMS_st_Control_Callbacks = interface;//br.com.gertec.gedi.structs.GEDI_KMS_st_Control$Callbacks
  JGediNative = interface;//br.com.gertec.gedi.GediNative
  JICL = interface;//br.com.gertec.gedi.interfaces.ICL
  Jgedi_a = interface;//br.com.gertec.gedi.a
  JIAUDIO = interface;//br.com.gertec.gedi.interfaces.IAUDIO
  Jgedi_a_a = interface;//br.com.gertec.gedi.a.a
  Jgedi_a_b = interface;//br.com.gertec.gedi.a.b
  JICLOCK = interface;//br.com.gertec.gedi.interfaces.ICLOCK
  Jgedi_b = interface;//br.com.gertec.gedi.b
  Jgedi_a_c = interface;//br.com.gertec.gedi.a.c
  JICRYPT = interface;//br.com.gertec.gedi.interfaces.ICRYPT
  Jgedi_c = interface;//br.com.gertec.gedi.c
  Jgedi_a_d = interface;//br.com.gertec.gedi.a.d
  Jgedi_a_e = interface;//br.com.gertec.gedi.a.e
  JIINFO = interface;//br.com.gertec.gedi.interfaces.IINFO
  Jgedi_d = interface;//br.com.gertec.gedi.d
  Ja_f = interface;//br.com.gertec.gedi.a.f
  Jf_1 = interface;//br.com.gertec.gedi.a.f$1
  JIKBD = interface;//br.com.gertec.gedi.interfaces.IKBD
  Jgedi_e = interface;//br.com.gertec.gedi.e
  Ja_g = interface;//br.com.gertec.gedi.a.g
  Jg_1 = interface;//br.com.gertec.gedi.a.g$1
  Jg_10 = interface;//br.com.gertec.gedi.a.g$10
  Jg_11 = interface;//br.com.gertec.gedi.a.g$11
  Jg_12 = interface;//br.com.gertec.gedi.a.g$12
  Jg_13 = interface;//br.com.gertec.gedi.a.g$13
  Jg_2 = interface;//br.com.gertec.gedi.a.g$2
  Jg_3 = interface;//br.com.gertec.gedi.a.g$3
  Jg_4 = interface;//br.com.gertec.gedi.a.g$4
  Jg_5 = interface;//br.com.gertec.gedi.a.g$5
  Jg_6 = interface;//br.com.gertec.gedi.a.g$6
  Jg_7 = interface;//br.com.gertec.gedi.a.g$7
  Jg_8 = interface;//br.com.gertec.gedi.a.g$8
  Jg_9 = interface;//br.com.gertec.gedi.a.g$9
  JIKMS = interface;//br.com.gertec.gedi.interfaces.IKMS
  Jgedi_g = interface;//br.com.gertec.gedi.g
  Ja_h = interface;//br.com.gertec.gedi.a.h
  Jc_a = interface;//wangpos.sdk4.a.c$a
  Jh_1 = interface;//br.com.gertec.gedi.a.h$1
  Jh_2 = interface;//br.com.gertec.gedi.a.h$2
  JIMSR = interface;//br.com.gertec.gedi.interfaces.IMSR
  Jgedi_i = interface;//br.com.gertec.gedi.i
  Ja_i = interface;//br.com.gertec.gedi.a.i
  Ji_1 = interface;//br.com.gertec.gedi.a.i$1
  JIPM = interface;//br.com.gertec.gedi.interfaces.IPM
  Jgedi_j = interface;//br.com.gertec.gedi.j
  Ja_j = interface;//br.com.gertec.gedi.a.j
  JIPRNTR = interface;//br.com.gertec.gedi.interfaces.IPRNTR
  Jgedi_k = interface;//br.com.gertec.gedi.k
  Ja_k = interface;//br.com.gertec.gedi.a.k
  Jk_1 = interface;//br.com.gertec.gedi.a.k$1
  JISMART = interface;//br.com.gertec.gedi.interfaces.ISMART
  Jgedi_l = interface;//br.com.gertec.gedi.l
  Ja_l = interface;//br.com.gertec.gedi.a.l
  Jl_1 = interface;//br.com.gertec.gedi.a.l$1
  Jl_2 = interface;//br.com.gertec.gedi.a.l$2
  Jl_3 = interface;//br.com.gertec.gedi.a.l$3
  JISYS = interface;//br.com.gertec.gedi.interfaces.ISYS
  Jgedi_m = interface;//br.com.gertec.gedi.m
  Ja_m = interface;//br.com.gertec.gedi.a.m
  Ja_n = interface;//br.com.gertec.gedi.a.n
  Ja_o = interface;//br.com.gertec.gedi.a.o
  Jo_1 = interface;//br.com.gertec.gedi.a.o$1
  JGEDI_CL_e_ISO_Level = interface;//br.com.gertec.gedi.enums.GEDI_CL_e_ISO_Level
  JGEDI_CL_e_ISO_Type = interface;//br.com.gertec.gedi.enums.GEDI_CL_e_ISO_Type
  JGEDI_CL_e_MF_KeyType = interface;//br.com.gertec.gedi.enums.GEDI_CL_e_MF_KeyType
  JGEDI_CL_e_MF_Type = interface;//br.com.gertec.gedi.enums.GEDI_CL_e_MF_Type
  JGEDI_CRYPT_e_Op = interface;//br.com.gertec.gedi.enums.GEDI_CRYPT_e_Op
  JGEDI_FS_e_Storage = interface;//br.com.gertec.gedi.enums.GEDI_FS_e_Storage
  JGEDI_INFO_e_ControlNumber = interface;//br.com.gertec.gedi.enums.GEDI_INFO_e_ControlNumber
  JGEDI_INFO_e_Test = interface;//br.com.gertec.gedi.enums.GEDI_INFO_e_Test
  JGEDI_KBD_e_Key = interface;//br.com.gertec.gedi.enums.GEDI_KBD_e_Key
  JGEDI_KBD_e_PowerKeyMode = interface;//br.com.gertec.gedi.enums.GEDI_KBD_e_PowerKeyMode
  JGEDI_KMS_e_BLOCKTYPE = interface;//br.com.gertec.gedi.enums.GEDI_KMS_e_BLOCKTYPE
  JGEDI_KMS_e_EncMode = interface;//br.com.gertec.gedi.enums.GEDI_KMS_e_EncMode
  JGEDI_KMS_e_KEYPURPOSE = interface;//br.com.gertec.gedi.enums.GEDI_KMS_e_KEYPURPOSE
  JGEDI_KMS_e_KEYTYPE = interface;//br.com.gertec.gedi.enums.GEDI_KMS_e_KEYTYPE
  JGEDI_KMS_e_KEYTYPE_LENGTH = interface;//br.com.gertec.gedi.enums.GEDI_KMS_e_KEYTYPE_LENGTH
  JGEDI_KMS_e_OP = interface;//br.com.gertec.gedi.enums.GEDI_KMS_e_OP
  JGEDI_LED_e_Id = interface;//br.com.gertec.gedi.enums.GEDI_LED_e_Id
  JGEDI_MSR_e_Status = interface;//br.com.gertec.gedi.enums.GEDI_MSR_e_Status
  JGEDI_PRNTR_e_Alignment = interface;//br.com.gertec.gedi.enums.GEDI_PRNTR_e_Alignment
  JGEDI_PRNTR_e_BarCodeType = interface;//br.com.gertec.gedi.enums.GEDI_PRNTR_e_BarCodeType
  JGEDI_PRNTR_e_Status = interface;//br.com.gertec.gedi.enums.GEDI_PRNTR_e_Status
  JGEDI_SMART_e_MemoryCardType = interface;//br.com.gertec.gedi.enums.GEDI_SMART_e_MemoryCardType
  JGEDI_SMART_e_Slot = interface;//br.com.gertec.gedi.enums.GEDI_SMART_e_Slot
  JGEDI_SMART_e_Status = interface;//br.com.gertec.gedi.enums.GEDI_SMART_e_Status
  JGEDI_SMART_e_Type = interface;//br.com.gertec.gedi.enums.GEDI_SMART_e_Type
  JGEDI_SMART_e_Voltage = interface;//br.com.gertec.gedi.enums.GEDI_SMART_e_Voltage
  JGEDI_SYS_e_SecuritySetup = interface;//br.com.gertec.gedi.enums.GEDI_SYS_e_SecuritySetup
  JGEDI_e_Ret = interface;//br.com.gertec.gedi.enums.GEDI_e_Ret
  JGediException = interface;//br.com.gertec.gedi.exceptions.GediException
  Jgedi_f = interface;//br.com.gertec.gedi.f
  JILED = interface;//br.com.gertec.gedi.interfaces.ILED
  Jgedi_h = interface;//br.com.gertec.gedi.h
  JIEnums = interface;//br.com.gertec.gedi.interfaces.IEnums
  JGEDI_AUTH_st_Data = interface;//br.com.gertec.gedi.structs.GEDI_AUTH_st_Data
  JGEDI_CLOCK_st_RTC = interface;//br.com.gertec.gedi.structs.GEDI_CLOCK_st_RTC
  JGEDI_CL_st_ISO_PollingInfo = interface;//br.com.gertec.gedi.structs.GEDI_CL_st_ISO_PollingInfo
  JGEDI_CL_st_MF_ActivateInfo = interface;//br.com.gertec.gedi.structs.GEDI_CL_st_MF_ActivateInfo
  JGEDI_CL_st_MF_Key = interface;//br.com.gertec.gedi.structs.GEDI_CL_st_MF_Key
  JGEDI_CL_st_ResetEMVInfo = interface;//br.com.gertec.gedi.structs.GEDI_CL_st_ResetEMVInfo
  JGEDI_CRYPT_st_RSAKeyGen = interface;//br.com.gertec.gedi.structs.GEDI_CRYPT_st_RSAKeyGen
  JGEDI_KBD_st_Info = interface;//br.com.gertec.gedi.structs.GEDI_KBD_st_Info
  JGEDI_KMS_st_CapturePINBlockInfo = interface;//br.com.gertec.gedi.structs.GEDI_KMS_st_CapturePINBlockInfo
  JGEDI_KMS_st_Control = interface;//br.com.gertec.gedi.structs.GEDI_KMS_st_Control
  JGEDI_KMS_st_Data = interface;//br.com.gertec.gedi.structs.GEDI_KMS_st_Data
  JGEDI_KMS_st_KB = interface;//br.com.gertec.gedi.structs.GEDI_KMS_st_KB
  JGEDI_KMS_st_PINBlock = interface;//br.com.gertec.gedi.structs.GEDI_KMS_st_PINBlock
  JGEDI_KMS_st_SaveKey = interface;//br.com.gertec.gedi.structs.GEDI_KMS_st_SaveKey
  JGEDI_MSR_st_LastErrors = interface;//br.com.gertec.gedi.structs.GEDI_MSR_st_LastErrors
  JGEDI_MSR_st_Tracks = interface;//br.com.gertec.gedi.structs.GEDI_MSR_st_Tracks
  JGEDI_PRNTR_st_BarCodeConfig = interface;//br.com.gertec.gedi.structs.GEDI_PRNTR_st_BarCodeConfig
  JGEDI_PRNTR_st_PictureConfig = interface;//br.com.gertec.gedi.structs.GEDI_PRNTR_st_PictureConfig
  JGEDI_PRNTR_st_StringConfig = interface;//br.com.gertec.gedi.structs.GEDI_PRNTR_st_StringConfig
  JGEDI_SMART_st_ResetInfo = interface;//br.com.gertec.gedi.structs.GEDI_SMART_st_ResetInfo
  Jsdk4_a_a = interface;//wangpos.sdk4.a.a
  Jsdk4_a_a_a = interface;//wangpos.sdk4.a.a$a
  Ja_a_a = interface;//wangpos.sdk4.a.a$a$a
  Ja_b = interface;//wangpos.sdk4.a.b
  Jb_a = interface;//wangpos.sdk4.a.b$a
  Jb_a_a = interface;//wangpos.sdk4.a.b$a$a
  Ja_c = interface;//wangpos.sdk4.a.c
  Jc_a_a = interface;//wangpos.sdk4.a.c$a$a
  Ja_d = interface;//wangpos.sdk4.a.d
  Jd_a = interface;//wangpos.sdk4.a.d$a
  Jd_a_a = interface;//wangpos.sdk4.a.d$a$a
  Ja_e = interface;//wangpos.sdk4.a.e
  Je_a = interface;//wangpos.sdk4.a.e$a
  Je_a_a = interface;//wangpos.sdk4.a.e$a$a
  Jsdk4_b_a = interface;//wangpos.sdk4.b.a
  Jsdk4_b_a_a = interface;//wangpos.sdk4.b.a$a
  Jb_a_a_a = interface;//wangpos.sdk4.b.a$a$a
  Jb_b = interface;//wangpos.sdk4.b.b
  Jb_b_a = interface;//wangpos.sdk4.b.b$a
  Jb_b_a_a = interface;//wangpos.sdk4.b.b$a$a
  Jsdk4_c_a = interface;//wangpos.sdk4.c.a
  Jsdk4_c_a_a = interface;//wangpos.sdk4.c.a$a
  Jc_a_b = interface;//wangpos.sdk4.c.a$b
  Jc_b = interface;//wangpos.sdk4.c.b
  Jlibbasebinder_a = interface;//wangpos.sdk4.libbasebinder.a
  JBankCard = interface;//wangpos.sdk4.libbasebinder.BankCard
  JCore = interface;//wangpos.sdk4.libbasebinder.Core
  Jlibbasebinder_Printer = interface;//wangpos.sdk4.libbasebinder.Printer
  JPrinter_Align = interface;//wangpos.sdk4.libbasebinder.Printer$Align
  JPrinter_BarcodeType = interface;//wangpos.sdk4.libbasebinder.Printer$BarcodeType
  JPrinter_BarcodeWidth = interface;//wangpos.sdk4.libbasebinder.Printer$BarcodeWidth
  JPrinter_Font = interface;//wangpos.sdk4.libbasebinder.Printer$Font
  JRspCode = interface;//wangpos.sdk4.libbasebinder.RspCode
  Ja_1 = interface;//wangpos.sdk4.libbasebinder.a$1
  Ja_2 = interface;//wangpos.sdk4.libbasebinder.a$2
  Jlibbasebinder_a_a = interface;//wangpos.sdk4.libbasebinder.a.a
  Jlibbasebinder_b = interface;//wangpos.sdk4.libbasebinder.b

// ===== Interface declarations =====

  JAnimatorClass = interface(JObjectClass)
    ['{3F76A5DF-389E-4BD3-9861-04C5B00CEADE}']
    {class} function init: JAnimator; cdecl;
    {class} function clone: JAnimator; cdecl;
    {class} procedure &end; cdecl;
    {class} function getDuration: Int64; cdecl;
    {class} function isPaused: Boolean; cdecl;//Deprecated
    {class} function isRunning: Boolean; cdecl;//Deprecated
    {class} function isStarted: Boolean; cdecl;//Deprecated
    {class} procedure removePauseListener(listener: JAnimator_AnimatorPauseListener); cdecl;//Deprecated
    {class} procedure resume; cdecl;//Deprecated
    {class} function setDuration(duration: Int64): JAnimator; cdecl;//Deprecated
    {class} procedure setupEndValues; cdecl;//Deprecated
    {class} procedure setupStartValues; cdecl;//Deprecated
  end;

  [JavaSignature('android/animation/Animator')]
  JAnimator = interface(JObject)
    ['{FA13E56D-1B6D-4A3D-8327-9E5BA785CF21}']
    procedure addListener(listener: JAnimator_AnimatorListener); cdecl;
    procedure addPauseListener(listener: JAnimator_AnimatorPauseListener); cdecl;
    procedure cancel; cdecl;
    function getInterpolator: JTimeInterpolator; cdecl;//Deprecated
    function getListeners: JArrayList; cdecl;//Deprecated
    function getStartDelay: Int64; cdecl;//Deprecated
    procedure pause; cdecl;//Deprecated
    procedure removeAllListeners; cdecl;//Deprecated
    procedure removeListener(listener: JAnimator_AnimatorListener); cdecl;//Deprecated
    procedure setInterpolator(value: JTimeInterpolator); cdecl;//Deprecated
    procedure setStartDelay(startDelay: Int64); cdecl;//Deprecated
    procedure setTarget(target: JObject); cdecl;//Deprecated
    procedure start; cdecl;//Deprecated
  end;
  TJAnimator = class(TJavaGenericImport<JAnimatorClass, JAnimator>) end;

  JAnimator_AnimatorListenerClass = interface(IJavaClass)
    ['{5ED6075A-B997-469C-B8D9-0AA8FB7E4798}']
    {class} procedure onAnimationStart(animation: JAnimator); cdecl;//Deprecated
  end;

  [JavaSignature('android/animation/Animator$AnimatorListener')]
  JAnimator_AnimatorListener = interface(IJavaInstance)
    ['{E2DE8DD6-628B-4D84-AA46-8A1E3F00FF13}']
    procedure onAnimationCancel(animation: JAnimator); cdecl;//Deprecated
    procedure onAnimationEnd(animation: JAnimator); cdecl;//Deprecated
    procedure onAnimationRepeat(animation: JAnimator); cdecl;//Deprecated
  end;
  TJAnimator_AnimatorListener = class(TJavaGenericImport<JAnimator_AnimatorListenerClass, JAnimator_AnimatorListener>) end;

  JAnimator_AnimatorPauseListenerClass = interface(IJavaClass)
    ['{CB0DC3F0-63BC-4284-ADD0-2ED367AE11E5}']
    {class} procedure onAnimationResume(animation: JAnimator); cdecl;//Deprecated
  end;

  [JavaSignature('android/animation/Animator$AnimatorPauseListener')]
  JAnimator_AnimatorPauseListener = interface(IJavaInstance)
    ['{43C9C106-65EA-4A7D-A958-FAB9E43FA4A6}']
    procedure onAnimationPause(animation: JAnimator); cdecl;//Deprecated
  end;
  TJAnimator_AnimatorPauseListener = class(TJavaGenericImport<JAnimator_AnimatorPauseListenerClass, JAnimator_AnimatorPauseListener>) end;

  JKeyframeClass = interface(JObjectClass)
    ['{D383116E-5CCF-48D8-9EA1-B26FBF24BA39}']
    {class} function init: JKeyframe; cdecl;
    {class} function getInterpolator: JTimeInterpolator; cdecl;
    {class} function getType: Jlang_Class; cdecl;
    {class} function getValue: JObject; cdecl;
    {class} function ofFloat(fraction: Single; value: Single): JKeyframe; cdecl; overload;
    {class} function ofFloat(fraction: Single): JKeyframe; cdecl; overload;
    {class} function ofInt(fraction: Single; value: Integer): JKeyframe; cdecl; overload;
    {class} function ofInt(fraction: Single): JKeyframe; cdecl; overload;
    {class} function ofObject(fraction: Single; value: JObject): JKeyframe; cdecl; overload;
    {class} function ofObject(fraction: Single): JKeyframe; cdecl; overload;
    {class} procedure setValue(value: JObject); cdecl;
  end;

  [JavaSignature('android/animation/Keyframe')]
  JKeyframe = interface(JObject)
    ['{9D0687A4-669E-440F-8290-154739405019}']
    function clone: JKeyframe; cdecl;
    function getFraction: Single; cdecl;
    function hasValue: Boolean; cdecl;
    procedure setFraction(fraction: Single); cdecl;
    procedure setInterpolator(interpolator: JTimeInterpolator); cdecl;
  end;
  TJKeyframe = class(TJavaGenericImport<JKeyframeClass, JKeyframe>) end;

  JLayoutTransitionClass = interface(JObjectClass)
    ['{433C5359-0A96-4796-AD7B-8084EF7EF7C4}']
    {class} function _GetAPPEARING: Integer; cdecl;
    {class} function _GetCHANGE_APPEARING: Integer; cdecl;
    {class} function _GetCHANGE_DISAPPEARING: Integer; cdecl;
    {class} function _GetCHANGING: Integer; cdecl;
    {class} function _GetDISAPPEARING: Integer; cdecl;
    {class} function init: JLayoutTransition; cdecl;
    {class} procedure enableTransitionType(transitionType: Integer); cdecl;//Deprecated
    {class} function getAnimator(transitionType: Integer): JAnimator; cdecl;//Deprecated
    {class} function getDuration(transitionType: Integer): Int64; cdecl;//Deprecated
    {class} function getTransitionListeners: JList; cdecl;
    {class} procedure hideChild(parent: JViewGroup; child: JView); cdecl; overload;//Deprecated
    {class} procedure hideChild(parent: JViewGroup; child: JView; newVisibility: Integer); cdecl; overload;
    {class} procedure removeChild(parent: JViewGroup; child: JView); cdecl;
    {class} procedure removeTransitionListener(listener: JLayoutTransition_TransitionListener); cdecl;
    {class} procedure setAnimateParentHierarchy(animateParentHierarchy: Boolean); cdecl;
    {class} procedure setDuration(transitionType: Integer; duration: Int64); cdecl; overload;
    {class} procedure setInterpolator(transitionType: Integer; interpolator: JTimeInterpolator); cdecl;
    {class} procedure setStagger(transitionType: Integer; duration: Int64); cdecl;
    {class} property APPEARING: Integer read _GetAPPEARING;
    {class} property CHANGE_APPEARING: Integer read _GetCHANGE_APPEARING;
    {class} property CHANGE_DISAPPEARING: Integer read _GetCHANGE_DISAPPEARING;
    {class} property CHANGING: Integer read _GetCHANGING;
    {class} property DISAPPEARING: Integer read _GetDISAPPEARING;
  end;

  [JavaSignature('android/animation/LayoutTransition')]
  JLayoutTransition = interface(JObject)
    ['{42450BEE-EBF2-4954-B9B7-F8DAE7DF0EC1}']
    procedure addChild(parent: JViewGroup; child: JView); cdecl;//Deprecated
    procedure addTransitionListener(listener: JLayoutTransition_TransitionListener); cdecl;//Deprecated
    procedure disableTransitionType(transitionType: Integer); cdecl;//Deprecated
    function getInterpolator(transitionType: Integer): JTimeInterpolator; cdecl;
    function getStagger(transitionType: Integer): Int64; cdecl;
    function getStartDelay(transitionType: Integer): Int64; cdecl;
    function isChangingLayout: Boolean; cdecl;
    function isRunning: Boolean; cdecl;
    function isTransitionTypeEnabled(transitionType: Integer): Boolean; cdecl;
    procedure setAnimator(transitionType: Integer; animator: JAnimator); cdecl;
    procedure setDuration(duration: Int64); cdecl; overload;
    procedure setStartDelay(transitionType: Integer; delay: Int64); cdecl;
    procedure showChild(parent: JViewGroup; child: JView); cdecl; overload;//Deprecated
    procedure showChild(parent: JViewGroup; child: JView; oldVisibility: Integer); cdecl; overload;
  end;
  TJLayoutTransition = class(TJavaGenericImport<JLayoutTransitionClass, JLayoutTransition>) end;

  JLayoutTransition_TransitionListenerClass = interface(IJavaClass)
    ['{9FA6F1EC-8EDB-4A05-AF58-B55A525AE114}']
  end;

  [JavaSignature('android/animation/LayoutTransition$TransitionListener')]
  JLayoutTransition_TransitionListener = interface(IJavaInstance)
    ['{0FBE048F-FCDA-4692-B6F1-DE0F07FAE885}']
    procedure endTransition(transition: JLayoutTransition; container: JViewGroup; view: JView; transitionType: Integer); cdecl;
    procedure startTransition(transition: JLayoutTransition; container: JViewGroup; view: JView; transitionType: Integer); cdecl;
  end;
  TJLayoutTransition_TransitionListener = class(TJavaGenericImport<JLayoutTransition_TransitionListenerClass, JLayoutTransition_TransitionListener>) end;

  JPropertyValuesHolderClass = interface(JObjectClass)
    ['{36C77AFF-9C3F-42B6-88F3-320FE8CF9B25}']
    {class} function ofMultiFloat(propertyName: JString; values: TJavaBiArray<Single>): JPropertyValuesHolder; cdecl; overload;//Deprecated
    {class} function ofMultiFloat(propertyName: JString; path: JPath): JPropertyValuesHolder; cdecl; overload;//Deprecated
    {class} function ofMultiInt(propertyName: JString; values: TJavaBiArray<Integer>): JPropertyValuesHolder; cdecl; overload;//Deprecated
    {class} function ofMultiInt(propertyName: JString; path: JPath): JPropertyValuesHolder; cdecl; overload;//Deprecated
    {class} function ofObject(propertyName: JString; converter: JTypeConverter; path: JPath): JPropertyValuesHolder; cdecl; overload;
    {class} function ofObject(property_: JProperty; converter: JTypeConverter; path: JPath): JPropertyValuesHolder; cdecl; overload;
    {class} procedure setConverter(converter: JTypeConverter); cdecl;
    {class} procedure setProperty(property_: JProperty); cdecl;
  end;

  [JavaSignature('android/animation/PropertyValuesHolder')]
  JPropertyValuesHolder = interface(JObject)
    ['{12B4ABFD-CBCA-4636-AF2D-C386EF895DC3}']
    function clone: JPropertyValuesHolder; cdecl;//Deprecated
    function getPropertyName: JString; cdecl;//Deprecated
    procedure setEvaluator(evaluator: JTypeEvaluator); cdecl;
    procedure setPropertyName(propertyName: JString); cdecl;
    function toString: JString; cdecl;
  end;
  TJPropertyValuesHolder = class(TJavaGenericImport<JPropertyValuesHolderClass, JPropertyValuesHolder>) end;

  JStateListAnimatorClass = interface(JObjectClass)
    ['{109E4067-E218-47B1-93EB-65B8916A98D8}']
    {class} function init: JStateListAnimator; cdecl;
    {class} function clone: JStateListAnimator; cdecl;//Deprecated
    {class} procedure jumpToCurrentState; cdecl;//Deprecated
  end;

  [JavaSignature('android/animation/StateListAnimator')]
  JStateListAnimator = interface(JObject)
    ['{CA2A9587-26AA-4DC2-8DFF-A1305A37608F}']
    procedure addState(specs: TJavaArray<Integer>; animator: JAnimator); cdecl;//Deprecated
  end;
  TJStateListAnimator = class(TJavaGenericImport<JStateListAnimatorClass, JStateListAnimator>) end;

  JTimeInterpolatorClass = interface(IJavaClass)
    ['{1E682A1C-9102-461D-A3CA-5596683F1D66}']
  end;

  [JavaSignature('android/animation/TimeInterpolator')]
  JTimeInterpolator = interface(IJavaInstance)
    ['{639F8A83-7D9B-49AF-A19E-96B27E46D2AB}']
    function getInterpolation(input: Single): Single; cdecl;
  end;
  TJTimeInterpolator = class(TJavaGenericImport<JTimeInterpolatorClass, JTimeInterpolator>) end;

  JTypeConverterClass = interface(JObjectClass)
    ['{BE2DD177-6D79-4B0C-B4F5-4E4CD9D7436D}']
    {class} function init(fromClass: Jlang_Class; toClass: Jlang_Class): JTypeConverter; cdecl;
    {class} function convert(value: JObject): JObject; cdecl;
  end;

  [JavaSignature('android/animation/TypeConverter')]
  JTypeConverter = interface(JObject)
    ['{BFEA4116-0766-4AD9-AA8F-4C15A583EB2E}']
  end;
  TJTypeConverter = class(TJavaGenericImport<JTypeConverterClass, JTypeConverter>) end;

  JTypeEvaluatorClass = interface(IJavaClass)
    ['{15B67CAF-6F50-4AA3-A88F-C5AF78D62FD4}']
  end;

  [JavaSignature('android/animation/TypeEvaluator')]
  JTypeEvaluator = interface(IJavaInstance)
    ['{F436383D-6F44-40D8-ACDD-9057777691FC}']
    function evaluate(fraction: Single; startValue: JObject; endValue: JObject): JObject; cdecl;
  end;
  TJTypeEvaluator = class(TJavaGenericImport<JTypeEvaluatorClass, JTypeEvaluator>) end;

  JValueAnimatorClass = interface(JAnimatorClass)
    ['{FF3B71ED-5A33-45B0-8500-7672B0B98E2C}']
    {class} function _GetINFINITE: Integer; cdecl;
    {class} function _GetRESTART: Integer; cdecl;
    {class} function _GetREVERSE: Integer; cdecl;
    {class} function init: JValueAnimator; cdecl;
    {class} function clone: JValueAnimator; cdecl;
    {class} procedure &end; cdecl;
    {class} function getAnimatedFraction: Single; cdecl;
    {class} function getDuration: Int64; cdecl;//Deprecated
    {class} function getFrameDelay: Int64; cdecl;//Deprecated
    {class} function getInterpolator: JTimeInterpolator; cdecl;//Deprecated
    {class} function getStartDelay: Int64; cdecl;//Deprecated
    {class} function getValues: TJavaObjectArray<JPropertyValuesHolder>; cdecl;//Deprecated
    {class} function isRunning: Boolean; cdecl;//Deprecated
    {class} procedure resume; cdecl;//Deprecated
    {class} procedure reverse; cdecl;//Deprecated
    {class} procedure setCurrentFraction(fraction: Single); cdecl;//Deprecated
    {class} procedure setFrameDelay(frameDelay: Int64); cdecl;
    {class} procedure setRepeatMode(value: Integer); cdecl;
    {class} procedure setStartDelay(startDelay: Int64); cdecl;
    {class} property INFINITE: Integer read _GetINFINITE;
    {class} property RESTART: Integer read _GetRESTART;

    // Alterado por Geovani
    // {class} property REVERSE_1: Integer read _GetREVERSE;
    {class} property REVERSE_1: Integer read _GetREVERSE;
  end;

  [JavaSignature('android/animation/ValueAnimator')]
  JValueAnimator = interface(JAnimator)
    ['{70F92B14-EFD4-4DC7-91DE-6617417AE194}']
    procedure addUpdateListener(listener: JValueAnimator_AnimatorUpdateListener); cdecl;
    procedure cancel; cdecl;
    function getAnimatedValue: JObject; cdecl; overload;//Deprecated
    function getAnimatedValue(propertyName: JString): JObject; cdecl; overload;//Deprecated
    function getCurrentPlayTime: Int64; cdecl;//Deprecated
    function getRepeatCount: Integer; cdecl;//Deprecated
    function getRepeatMode: Integer; cdecl;//Deprecated
    function isStarted: Boolean; cdecl;//Deprecated
    procedure pause; cdecl;//Deprecated
    procedure removeAllUpdateListeners; cdecl;//Deprecated
    procedure removeUpdateListener(listener: JValueAnimator_AnimatorUpdateListener); cdecl;//Deprecated
    procedure setCurrentPlayTime(playTime: Int64); cdecl;
    function setDuration(duration: Int64): JValueAnimator; cdecl;
    procedure setEvaluator(value: JTypeEvaluator); cdecl;
    procedure setInterpolator(value: JTimeInterpolator); cdecl;
    procedure setRepeatCount(value: Integer); cdecl;
    procedure start; cdecl;
    function toString: JString; cdecl;
  end;
  TJValueAnimator = class(TJavaGenericImport<JValueAnimatorClass, JValueAnimator>) end;

  JValueAnimator_AnimatorUpdateListenerClass = interface(IJavaClass)
    ['{9CA50CBF-4462-4445-82CD-13CE985E2DE4}']
  end;

  [JavaSignature('android/animation/ValueAnimator$AnimatorUpdateListener')]
  JValueAnimator_AnimatorUpdateListener = interface(IJavaInstance)
    ['{0F883491-52EF-4A40-B7D2-FC23E11E46FE}']
    procedure onAnimationUpdate(animation: JValueAnimator); cdecl;//Deprecated
  end;
  TJValueAnimator_AnimatorUpdateListener = class(TJavaGenericImport<JValueAnimator_AnimatorUpdateListenerClass, JValueAnimator_AnimatorUpdateListener>) end;

  JPathMotionClass = interface(JObjectClass)
    ['{E1CD1A94-115C-492C-A490-37F0E72956EB}']
    {class} function init: JPathMotion; cdecl; overload;
    {class} function init(context: JContext; attrs: JAttributeSet): JPathMotion; cdecl; overload;
    {class} function getPath(startX: Single; startY: Single; endX: Single; endY: Single): JPath; cdecl;
  end;

  [JavaSignature('android/transition/PathMotion')]
  JPathMotion = interface(JObject)
    ['{BDC08353-C9FB-42D7-97CC-C35837D2F536}']
  end;
  TJPathMotion = class(TJavaGenericImport<JPathMotionClass, JPathMotion>) end;

  JSceneClass = interface(JObjectClass)
    ['{8B9120CA-AEEA-4DE3-BDC9-15CFD23A7B07}']
    {class} function init(sceneRoot: JViewGroup): JScene; cdecl; overload;
    {class} function init(sceneRoot: JViewGroup; layout: JView): JScene; cdecl; overload;
    {class} function init(sceneRoot: JViewGroup; layout: JViewGroup): JScene; cdecl; overload;//Deprecated
    {class} procedure enter; cdecl;//Deprecated
    {class} function getSceneForLayout(sceneRoot: JViewGroup; layoutId: Integer; context: JContext): JScene; cdecl;//Deprecated
    {class} procedure setEnterAction(action: JRunnable); cdecl;//Deprecated
    {class} procedure setExitAction(action: JRunnable); cdecl;//Deprecated
  end;

  [JavaSignature('android/transition/Scene')]
  JScene = interface(JObject)
    ['{85A60B99-5837-4F1F-A344-C627DD586B82}']
    procedure exit; cdecl;//Deprecated
    function getSceneRoot: JViewGroup; cdecl;//Deprecated
  end;
  TJScene = class(TJavaGenericImport<JSceneClass, JScene>) end;

  JTransitionClass = interface(JObjectClass)
    ['{60EC06BC-8F7A-4416-A04B-5B57987EB18E}']
    {class} function _GetMATCH_ID: Integer; cdecl;
    {class} function _GetMATCH_INSTANCE: Integer; cdecl;
    {class} function _GetMATCH_ITEM_ID: Integer; cdecl;
    {class} function _GetMATCH_NAME: Integer; cdecl;
    {class} function init: JTransition; cdecl; overload;
    {class} function init(context: JContext; attrs: JAttributeSet): JTransition; cdecl; overload;
    {class} function addTarget(targetType: Jlang_Class): JTransition; cdecl; overload;//Deprecated
    {class} function addTarget(target: JView): JTransition; cdecl; overload;//Deprecated
    {class} function canRemoveViews: Boolean; cdecl;//Deprecated
    {class} function createAnimator(sceneRoot: JViewGroup; startValues: JTransitionValues; endValues: JTransitionValues): JAnimator; cdecl;//Deprecated
    {class} function excludeChildren(targetId: Integer; exclude: Boolean): JTransition; cdecl; overload;//Deprecated
    {class} function excludeChildren(target: JView; exclude: Boolean): JTransition; cdecl; overload;//Deprecated
    {class} function excludeTarget(target: JView; exclude: Boolean): JTransition; cdecl; overload;//Deprecated
    {class} function excludeTarget(type_: Jlang_Class; exclude: Boolean): JTransition; cdecl; overload;//Deprecated
    {class} function getDuration: Int64; cdecl;//Deprecated
    {class} function getName: JString; cdecl;
    {class} function getPathMotion: JPathMotion; cdecl;
    {class} function getTargetNames: JList; cdecl;
    {class} function getTargetTypes: JList; cdecl;
    {class} function getTargets: JList; cdecl;
    {class} function removeListener(listener: JTransition_TransitionListener): JTransition; cdecl;
    {class} function removeTarget(targetId: Integer): JTransition; cdecl; overload;
    {class} function removeTarget(targetName: JString): JTransition; cdecl; overload;
    {class} procedure setEpicenterCallback(epicenterCallback: JTransition_EpicenterCallback); cdecl;
    {class} function setInterpolator(interpolator: JTimeInterpolator): JTransition; cdecl;
    {class} function toString: JString; cdecl;//Deprecated
    {class} property MATCH_ID: Integer read _GetMATCH_ID;
    {class} property MATCH_INSTANCE: Integer read _GetMATCH_INSTANCE;
    {class} property MATCH_ITEM_ID: Integer read _GetMATCH_ITEM_ID;
    {class} property MATCH_NAME: Integer read _GetMATCH_NAME;
  end;

  [JavaSignature('android/transition/Transition')]
  JTransition = interface(JObject)
    ['{C2F8200F-1C83-40AE-8C5B-C0C8BFF17F88}']
    function addListener(listener: JTransition_TransitionListener): JTransition; cdecl;//Deprecated
    function addTarget(targetId: Integer): JTransition; cdecl; overload;//Deprecated
    function addTarget(targetName: JString): JTransition; cdecl; overload;//Deprecated
    procedure captureEndValues(transitionValues: JTransitionValues); cdecl;//Deprecated
    procedure captureStartValues(transitionValues: JTransitionValues); cdecl;//Deprecated
    function clone: JTransition; cdecl;//Deprecated
    function excludeChildren(type_: Jlang_Class; exclude: Boolean): JTransition; cdecl; overload;//Deprecated
    function excludeTarget(targetId: Integer; exclude: Boolean): JTransition; cdecl; overload;//Deprecated
    function excludeTarget(targetName: JString; exclude: Boolean): JTransition; cdecl; overload;//Deprecated
    function getEpicenter: JRect; cdecl;
    function getEpicenterCallback: JTransition_EpicenterCallback; cdecl;
    function getInterpolator: JTimeInterpolator; cdecl;
    function getPropagation: JTransitionPropagation; cdecl;
    function getStartDelay: Int64; cdecl;
    function getTargetIds: JList; cdecl;
    function getTransitionProperties: TJavaObjectArray<JString>; cdecl;
    function getTransitionValues(view: JView; start: Boolean): JTransitionValues; cdecl;
    function isTransitionRequired(startValues: JTransitionValues; endValues: JTransitionValues): Boolean; cdecl;
    function removeTarget(target: JView): JTransition; cdecl; overload;
    function removeTarget(target: Jlang_Class): JTransition; cdecl; overload;
    function setDuration(duration: Int64): JTransition; cdecl;
    procedure setPathMotion(pathMotion: JPathMotion); cdecl;//Deprecated
    procedure setPropagation(transitionPropagation: JTransitionPropagation); cdecl;//Deprecated
    function setStartDelay(startDelay: Int64): JTransition; cdecl;//Deprecated
  end;
  TJTransition = class(TJavaGenericImport<JTransitionClass, JTransition>) end;

  JTransition_EpicenterCallbackClass = interface(JObjectClass)
    ['{8141257A-130B-466C-A08D-AA3A00946F4C}']
    {class} function init: JTransition_EpicenterCallback; cdecl;
  end;

  [JavaSignature('android/transition/Transition$EpicenterCallback')]
  JTransition_EpicenterCallback = interface(JObject)
    ['{CE004917-266F-4076-8913-F23184824FBA}']
    function onGetEpicenter(transition: JTransition): JRect; cdecl;//Deprecated
  end;
  TJTransition_EpicenterCallback = class(TJavaGenericImport<JTransition_EpicenterCallbackClass, JTransition_EpicenterCallback>) end;

  JTransition_TransitionListenerClass = interface(IJavaClass)
    ['{D5083752-E8A6-46DF-BE40-AE11073C387E}']
    {class} procedure onTransitionCancel(transition: JTransition); cdecl;//Deprecated
    {class} procedure onTransitionEnd(transition: JTransition); cdecl;//Deprecated
  end;

  [JavaSignature('android/transition/Transition$TransitionListener')]
  JTransition_TransitionListener = interface(IJavaInstance)
    ['{C32BE107-6E05-4898-AF0A-FAD970D66E29}']
    procedure onTransitionPause(transition: JTransition); cdecl;//Deprecated
    procedure onTransitionResume(transition: JTransition); cdecl;//Deprecated
    procedure onTransitionStart(transition: JTransition); cdecl;//Deprecated
  end;
  TJTransition_TransitionListener = class(TJavaGenericImport<JTransition_TransitionListenerClass, JTransition_TransitionListener>) end;

  JTransitionManagerClass = interface(JObjectClass)
    ['{4160EFA0-3499-4964-817E-46497BB5B957}']
    {class} function init: JTransitionManager; cdecl;
    {class} procedure beginDelayedTransition(sceneRoot: JViewGroup); cdecl; overload;
    {class} procedure beginDelayedTransition(sceneRoot: JViewGroup; transition: JTransition); cdecl; overload;
    {class} procedure endTransitions(sceneRoot: JViewGroup); cdecl;
    {class} procedure go(scene: JScene); cdecl; overload;
    {class} procedure go(scene: JScene; transition: JTransition); cdecl; overload;//Deprecated
    {class} procedure transitionTo(scene: JScene); cdecl;//Deprecated
  end;

  [JavaSignature('android/transition/TransitionManager')]
  JTransitionManager = interface(JObject)
    ['{FF5E1210-1F04-4F81-9CAC-3D7A5C4E972B}']
    procedure setTransition(scene: JScene; transition: JTransition); cdecl; overload;//Deprecated
    procedure setTransition(fromScene: JScene; toScene: JScene; transition: JTransition); cdecl; overload;//Deprecated
  end;
  TJTransitionManager = class(TJavaGenericImport<JTransitionManagerClass, JTransitionManager>) end;

  JTransitionPropagationClass = interface(JObjectClass)
    ['{A881388A-C877-4DD9-9BAD-1BA4F56133EE}']
    {class} function init: JTransitionPropagation; cdecl;
    {class} function getStartDelay(sceneRoot: JViewGroup; transition: JTransition; startValues: JTransitionValues; endValues: JTransitionValues): Int64; cdecl;//Deprecated
  end;

  [JavaSignature('android/transition/TransitionPropagation')]
  JTransitionPropagation = interface(JObject)
    ['{7595B7EF-6BCE-4281-BC67-335E2FB6C091}']
    procedure captureValues(transitionValues: JTransitionValues); cdecl;//Deprecated
    function getPropagationProperties: TJavaObjectArray<JString>; cdecl;//Deprecated
  end;
  TJTransitionPropagation = class(TJavaGenericImport<JTransitionPropagationClass, JTransitionPropagation>) end;

  JTransitionValuesClass = interface(JObjectClass)
    ['{3BF98CFA-6A4D-4815-8D42-15E97C916D91}']
    {class} function _Getview: JView; cdecl;
    {class} procedure _Setview(Value: JView); cdecl;
    {class} function init: JTransitionValues; cdecl;
    {class} function equals(other: JObject): Boolean; cdecl;//Deprecated
    {class} property view: JView read _Getview write _Setview;
  end;

  [JavaSignature('android/transition/TransitionValues')]
  JTransitionValues = interface(JObject)
    ['{178E09E6-D32C-48A9-ADCF-8CCEA804052A}']
    function _Getvalues: JMap; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    property values: JMap read _Getvalues;
  end;
  TJTransitionValues = class(TJavaGenericImport<JTransitionValuesClass, JTransitionValues>) end;

  JInterpolatorClass = interface(JTimeInterpolatorClass)
    ['{A575B46A-E489-409C-807A-1B8F2BE092E8}']
  end;

  [JavaSignature('android/view/animation/Interpolator')]
  JInterpolator = interface(JTimeInterpolator)
    ['{F1082403-52DA-4AF0-B017-DAB334325FC7}']
  end;
  TJInterpolator = class(TJavaGenericImport<JInterpolatorClass, JInterpolator>) end;

  JToolbar_LayoutParamsClass = interface(JActionBar_LayoutParamsClass)
    ['{6D43796C-C163-4084-BB30-6FE68AFD7ABB}']
    {class} function init(c: JContext; attrs: JAttributeSet): JToolbar_LayoutParams; cdecl; overload;
    {class} function init(width: Integer; height: Integer): JToolbar_LayoutParams; cdecl; overload;
    {class} function init(width: Integer; height: Integer; gravity: Integer): JToolbar_LayoutParams; cdecl; overload;
    {class} function init(gravity: Integer): JToolbar_LayoutParams; cdecl; overload;
    {class} function init(source: JToolbar_LayoutParams): JToolbar_LayoutParams; cdecl; overload;
    {class} function init(source: JActionBar_LayoutParams): JToolbar_LayoutParams; cdecl; overload;
    {class} function init(source: JViewGroup_MarginLayoutParams): JToolbar_LayoutParams; cdecl; overload;
    {class} function init(source: JViewGroup_LayoutParams): JToolbar_LayoutParams; cdecl; overload;
  end;

  [JavaSignature('android/widget/Toolbar$LayoutParams')]
  JToolbar_LayoutParams = interface(JActionBar_LayoutParams)
    ['{BCD101F9-B7B7-4B2F-9460-056B3EA7B9F0}']
  end;
  TJToolbar_LayoutParams = class(TJavaGenericImport<JToolbar_LayoutParamsClass, JToolbar_LayoutParams>) end;

  Jgertec_LoggerClass = interface(JObjectClass)
    ['{6C475F05-227D-47E4-9B6F-3F71B8909DCB}']
    {class} procedure debug(P1: JString); cdecl; overload;//Deprecated
    {class} procedure error(P1: JString); cdecl; overload;//Deprecated
    {class} procedure error(P1: JString; P2: JThrowable); cdecl; overload;//Deprecated
    {class} function getLogger(P1: JString): Jgertec_Logger; cdecl;//Deprecated
    {class} procedure info(P1: JString); cdecl; overload;//Deprecated
    {class} procedure log(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>); cdecl; overload;//Deprecated
    {class} procedure log(P1: Integer; P2: JString; P3: JString); cdecl; overload;//Deprecated
    {class} procedure warn(P1: JString); cdecl; overload;//Deprecated
  end;

  [JavaSignature('br/com/gertec/Logger')]
  Jgertec_Logger = interface(JObject)
    ['{26F65F41-BAA4-4287-9BF9-F9621732A49C}']
  end;
  TJgertec_Logger = class(TJavaGenericImport<Jgertec_LoggerClass, Jgertec_Logger>) end;

  Jgertec_a_aClass = interface(JIInterfaceClass)
    ['{DF2BF3FD-F001-47FE-A2BA-0223DD197C1D}']
    {class} function a(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: Boolean; P7: Integer; P8: TJavaArray<Byte>; P9: JString; P10: Integer): Integer; cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/a/a')]
  Jgertec_a_a = interface(JIInterface)
    ['{F1C795C2-F482-46FA-AA76-1CC55A5CD6BB}']
  end;
  TJgertec_a_a = class(TJavaGenericImport<Jgertec_a_aClass, Jgertec_a_a>) end;

  Jgertec_a_a_aClass = interface(JBinderClass)
    ['{411CCD9E-B314-428B-BC26-070A76A7793B}']
    {class} function a(P1: JIBinder): Jgertec_a_a; cdecl;//Deprecated
    {class} function onTransact(P1: Integer; P2: JParcel; P3: JParcel; P4: Integer): Boolean; cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/a/a$a')]
  Jgertec_a_a_a = interface(JBinder)
    ['{2F51FD01-0F0A-4620-A583-C75C27E8B3CC}']
  end;
  TJgertec_a_a_a = class(TJavaGenericImport<Jgertec_a_a_aClass, Jgertec_a_a_a>) end;

  Ja_a_a_aClass = interface(Jgertec_a_aClass)
    ['{5582A8FE-3155-4EE6-A9EF-546EA8CC8A8B}']
    {class} function a(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: Boolean; P7: Integer; P8: TJavaArray<Byte>; P9: JString; P10: Integer): Integer; cdecl;//Deprecated
    {class} function asBinder: JIBinder; cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/a/a$a$a')]
  Ja_a_a_a = interface(Jgertec_a_a)
    ['{F15F92D2-524D-42B8-BFD3-4F85FBC1E0EF}']
  end;
  TJa_a_a_a = class(TJavaGenericImport<Ja_a_a_aClass, Ja_a_a_a>) end;

  JIGEDIClass = interface(IJavaClass)
    ['{9B5B5CB7-68B5-47C4-A4C5-D0A6225B863E}']
    {class} procedure EnterEng(P1: JString); cdecl;//Deprecated
    {class} function VersionGet: JString; cdecl;//Deprecated
    {class} function getAUDIO: JIAUDIO; cdecl;//Deprecated
    {class} function getCL: JICL; cdecl;//Deprecated
    {class} function getCLOCK: JICLOCK; cdecl;//Deprecated
    {class} function getCRYPT: JICRYPT; cdecl;//Deprecated
    {class} function getINFO: JIINFO; cdecl;//Deprecated
    {class} function getKBD: JIKBD; cdecl;//Deprecated
    {class} function getKMS: JIKMS; cdecl;//Deprecated
    {class} function getLED: JILED; cdecl;//Deprecated
    {class} function getMSR: JIMSR; cdecl;//Deprecated
    {class} function getPM: JIPM; cdecl;//Deprecated
    {class} function getPRNTR: JIPRNTR; cdecl;//Deprecated
    {class} function getSMART: JISMART; cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/interfaces/IGEDI')]
  JIGEDI = interface(IJavaInstance)
    ['{ACD4DF25-C0C2-4751-B328-A507D1DE998E}']
    // Foi adicionado pelo Geovani
    {class} procedure EnterEng(P1: JString); cdecl;//Deprecated
    {class} function VersionGet: JString; cdecl;//Deprecated
    {class} function getAUDIO: JIAUDIO; cdecl;//Deprecated
    {class} function getCL: JICL; cdecl;//Deprecated
    {class} function getCLOCK: JICLOCK; cdecl;//Deprecated
    {class} function getCRYPT: JICRYPT; cdecl;//Deprecated
    {class} function getINFO: JIINFO; cdecl;//Deprecated
    {class} function getKBD: JIKBD; cdecl;//Deprecated
    {class} function getKMS: JIKMS; cdecl;//Deprecated
    {class} function getLED: JILED; cdecl;//Deprecated
    {class} function getMSR: JIMSR; cdecl;//Deprecated
    {class} function getPM: JIPM; cdecl;//Deprecated
    {class} function getPRNTR: JIPRNTR; cdecl;//Deprecated
    {class} function getSMART: JISMART; cdecl;//Deprecated
    // Foi adicionado pelo Geovani
  end;
  TJIGEDI = class(TJavaGenericImport<JIGEDIClass, JIGEDI>) end;

  JGEDIClass = interface(JIGEDIClass)
    ['{8CCC5291-45A9-4FF1-A6FF-C3163FCBEC6D}']
    {class} function getInstance: JIGEDI; cdecl; overload;//Deprecated
    {class} function getInstance(P1: JContext): JIGEDI; cdecl; overload;//Deprecated
    // {class} procedure init(P1: JContext); cdecl;      // Adicionado por Geovani
  end;

  [JavaSignature('br/com/gertec/gedi/GEDI')]
  JGEDI = interface(JIGEDI)
    ['{72AF5A51-3393-4FE2-8D6F-8819A051060F}']
    // {class} procedure init(P1: JContext); cdecl;     // Adicionado por Geovani
  end;
  TJGEDI = class(TJavaGenericImport<JGEDIClass, JGEDI>) end;

  JGEDI_1Class = interface(JThreadClass)
    ['{A5A7B5CE-15B5-4980-B4C3-73A7BFE9EB63}']
    {class} function init(P1: JContext): JGEDI_1; cdecl;//Deprecated
    {class} procedure run; cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/GEDI$1')]
  JGEDI_1 = interface(JThread)
    ['{F0AC275B-0241-4624-A47A-2C65BDDAFEE5}']
  end;
  TJGEDI_1 = class(TJavaGenericImport<JGEDI_1Class, JGEDI_1>) end;

  JGEDI_KMS_st_Control_CallbacksClass = interface(IJavaClass)
    ['{96A541B8-DA70-4733-8DEC-8333439B25AA}']
    {class} procedure onKeyPress(P1: JGEDI_KBD_e_Key); cdecl;//Deprecated
    {class} function testCancel: Boolean; cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/structs/GEDI_KMS_st_Control$Callbacks')]
  JGEDI_KMS_st_Control_Callbacks = interface(IJavaInstance)
    ['{1EA7305A-382F-4127-AFE3-93BAAB517D0F}']
  end;
  TJGEDI_KMS_st_Control_Callbacks = class(TJavaGenericImport<JGEDI_KMS_st_Control_CallbacksClass, JGEDI_KMS_st_Control_Callbacks>) end;

  JGediNativeClass = interface(JGEDI_KMS_st_Control_CallbacksClass)
    ['{8CB82446-FFFC-4DB9-945A-20BAB371D42B}']
    {class} function CLOCK_RTCGet(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>; P7: TJavaArray<Byte>): Integer; cdecl;//Deprecated
    {class} function CLOCK_RTCSet(P1: Byte; P2: Byte; P3: Byte; P4: Byte; P5: Byte; P6: Byte; P7: Byte): Integer; cdecl;//Deprecated
    {class} function CL_ISOPolling(P1: Integer): Integer; cdecl;//Deprecated
    {class} function CL_PowerOff: Integer; cdecl;//Deprecated
    {class} function CL_PowerOn: Integer; cdecl;//Deprecated
    {class} function CL_ResetEMV(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function CL_SendAPDU(P1: TJavaArray<Byte>; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function CRYPT_DES(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>): Integer; cdecl;//Deprecated
    {class} function CRYPT_RNG(P1: TJavaArray<Byte>): Integer; cdecl;//Deprecated
    {class} function CRYPT_RSA(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>): Integer; cdecl;//Deprecated
    {class} function CRYPT_SHA1(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>): Integer; cdecl;//Deprecated
    {class} function INFO_ControlNumberGet(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl;//Deprecated
    {class} function INFO_ControlNumberSet(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl;//Deprecated
    {class} function INFO_FirmwareVersionGet(P1: TJavaArray<Byte>): Integer; cdecl;//Deprecated
    {class} function KBD_Get(P1: TJavaArray<Integer>; P2: Integer; P3: Boolean): Integer; cdecl;//Deprecated
    {class} function KMS_CapturePIN(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Boolean; P6: Boolean; P7: TJavaArray<Byte>; P8: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function KMS_DUKPTKSNGet(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>): Integer; cdecl;//Deprecated
    {class} function KMS_EncryptData(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>; P7: TJavaArray<Byte>; P8: TJavaArray<Byte>; P9: TJavaArray<Integer>; P10: TJavaArray<Byte>): Integer; cdecl;//Deprecated
    {class} function KMS_GetPINBlock(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: Integer; P5: JString; P6: TJavaArray<Byte>; P7: TJavaArray<Byte>): Integer; cdecl;//Deprecated
    {class} function KMS_KeyPresenceTest(P1: Integer; P2: Integer; P3: Integer): Integer; cdecl;//Deprecated
    {class} function KMS_Reset: Integer; cdecl;//Deprecated
    {class} function KMS_SavePlainKey(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>): Integer; cdecl;//Deprecated
    {class} function LED_Set(P1: Integer; P2: Byte): Integer; cdecl;//Deprecated
    {class} function MSR_LastErrorGet(P1: TJavaArray<Integer>; P2: TJavaArray<Integer>; P3: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function MSR_Read(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>; P5: TJavaArray<Byte>; P6: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function SMART_PowerOff(P1: Integer): Integer; cdecl;//Deprecated
    {class} function SMART_ResetEMV(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>; P5: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function SMART_SendAPDU(P1: Integer; P2: TJavaArray<Byte>; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function SMART_Status(P1: Integer; P2: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function SMART_WarmResetEMV(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>; P5: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function VersionGet(P1: TJavaArray<Integer>; P2: TJavaArray<Integer>; P3: TJavaArray<Integer>; P4: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function VersionGet(P1: TJavaArray<Integer>; P2: TJavaArray<Integer>; P3: TJavaArray<Integer>; P4: TJavaArray<Int64>): Integer; cdecl; overload;//Deprecated
    {class} function getInstance(P1: Jgedi_a_e): JGediNative; cdecl;//Deprecated
    {class} function init(P1: Jgedi_a_e): JGediNative; cdecl; overload;//Deprecated
    {class} procedure onKeyPress(P1: Integer); cdecl; overload;//Deprecated
    {class} procedure onKeyPress(P1: JGEDI_KBD_e_Key); cdecl; overload;//Deprecated
    {class} procedure setPrivateDir(P1: JString); cdecl;//Deprecated
    {class} function testCancel: Boolean; cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/GediNative')]
  JGediNative = interface(JGEDI_KMS_st_Control_Callbacks)
    ['{2BB0AA52-C493-4CDD-8E86-DFC08B034877}']
  end;
  TJGediNative = class(TJavaGenericImport<JGediNativeClass, JGediNative>) end;

  JICLClass = interface(IJavaClass)
    ['{02B393A2-EF64-497B-BF83-24BD7DB7421D}']
    {class} function ISO_Polling(P1: Integer): JGEDI_CL_st_ISO_PollingInfo; cdecl;//Deprecated
    {class} procedure MF_Authentication(P1: Integer; P2: JGEDI_CL_st_MF_Key; P3: TJavaArray<Byte>); cdecl;//Deprecated
    {class} function MF_BlockRead(P1: Integer): TJavaArray<Byte>; cdecl;//Deprecated
    {class} procedure MF_BlockWrite(P1: Integer; P2: TJavaArray<Byte>); cdecl;//Deprecated
    {class} function MF_SignatureGet(P1: Integer): TJavaArray<Byte>; cdecl;//Deprecated
    {class} procedure PowerOff; cdecl;//Deprecated
    {class} procedure PowerOn; cdecl;//Deprecated
    {class} function ResetEMV: JGEDI_CL_st_ResetEMVInfo; cdecl;//Deprecated
    {class} function SendAPDU(P1: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/interfaces/ICL')]
  JICL = interface(IJavaInstance)
    ['{43F35D2C-7ACC-4491-91BA-949ED31FF219}']
    // Foi adicionado pelo Geovani
    {class} function ISO_Polling(P1: Integer): JGEDI_CL_st_ISO_PollingInfo; cdecl;//Deprecated
    {class} procedure MF_Authentication(P1: Integer; P2: JGEDI_CL_st_MF_Key; P3: TJavaArray<Byte>); cdecl;//Deprecated
    {class} function MF_BlockRead(P1: Integer): TJavaArray<Byte>; cdecl;//Deprecated
    {class} procedure MF_BlockWrite(P1: Integer; P2: TJavaArray<Byte>); cdecl;//Deprecated
    {class} function MF_SignatureGet(P1: Integer): TJavaArray<Byte>; cdecl;//Deprecated
    {class} procedure PowerOff; cdecl;//Deprecated
    {class} procedure PowerOn; cdecl;//Deprecated
    {class} function ResetEMV: JGEDI_CL_st_ResetEMVInfo; cdecl;//Deprecated
    {class} function SendAPDU(P1: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;//Deprecated
    // Foi adicionado pelo Geovani
  end;
  TJICL = class(TJavaGenericImport<JICLClass, JICL>) end;

  Jgedi_aClass = interface(JICLClass)
    ['{0AEC2280-9C78-4041-853D-C5365400FADD}']
    {class} function ISO_Polling(P1: Integer): JGEDI_CL_st_ISO_PollingInfo; cdecl;//Deprecated
    {class} procedure PowerOff; cdecl;//Deprecated
    {class} procedure PowerOn; cdecl;//Deprecated
    {class} function a(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: TJavaArray<Byte>; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function init: Jgedi_a; cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/a')]
  Jgedi_a = interface(JICL)
    ['{40C01D48-7711-4F15-91A7-50219366CD55}']
  end;
  TJgedi_a = class(TJavaGenericImport<Jgedi_aClass, Jgedi_a>) end;

  JIAUDIOClass = interface(IJavaClass)
    ['{0DBE4F2B-5376-4C75-954D-8138BF503F22}']
    {class} procedure Beep; cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/interfaces/IAUDIO')]
  JIAUDIO = interface(IJavaInstance)
    ['{7F648624-D444-4153-B017-188C818146DC}']
  end;
  TJIAUDIO = class(TJavaGenericImport<JIAUDIOClass, JIAUDIO>) end;

  Jgedi_a_aClass = interface(JIAUDIOClass)
    ['{08AAABE3-3ABF-4F8D-B6F4-319A86E76E02}']
    {class} procedure Beep; cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/a/a')]
  Jgedi_a_a = interface(JIAUDIO)
    ['{DFE55EDE-FC8B-4939-AF43-44F27BFBE70B}']
  end;
  TJgedi_a_a = class(TJavaGenericImport<Jgedi_a_aClass, Jgedi_a_a>) end;

  Jgedi_a_bClass = interface(Jgedi_aClass)
    ['{5D27E9E5-82CF-4772-9A09-E636E407FBE9}']
    {class} function ISO_Polling(P1: Integer): JGEDI_CL_st_ISO_PollingInfo; cdecl;//Deprecated
    {class} procedure MF_Authentication(P1: Integer; P2: JGEDI_CL_st_MF_Key; P3: TJavaArray<Byte>); cdecl;//Deprecated
    {class} function MF_BlockRead(P1: Integer): TJavaArray<Byte>; cdecl;//Deprecated
    {class} procedure MF_BlockWrite(P1: Integer; P2: TJavaArray<Byte>); cdecl;//Deprecated
    {class} function MF_SignatureGet(P1: Integer): TJavaArray<Byte>; cdecl;//Deprecated
    {class} procedure PowerOff; cdecl;//Deprecated
    {class} procedure PowerOn; cdecl;//Deprecated
    {class} function ResetEMV: JGEDI_CL_st_ResetEMVInfo; cdecl;//Deprecated
    {class} function SendAPDU(P1: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;//Deprecated
    {class} function a(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function init(P1: Ja_o): Jgedi_a_b; cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/a/b')]
  Jgedi_a_b = interface(Jgedi_a)
    ['{B0166C8D-7FDE-4AD5-A82A-48F275EA94B0}']
  end;
  TJgedi_a_b = class(TJavaGenericImport<Jgedi_a_bClass, Jgedi_a_b>) end;

  JICLOCKClass = interface(IJavaClass)
    ['{618ACA7D-3879-4182-87B0-6986EA825B65}']
    {class} function RTCFGet: JGEDI_CLOCK_st_RTC; cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/interfaces/ICLOCK')]
  JICLOCK = interface(IJavaInstance)
    ['{DE4A5D3C-3A24-415F-81D8-5474B11DD446}']
  end;
  TJICLOCK = class(TJavaGenericImport<JICLOCKClass, JICLOCK>) end;

  Jgedi_bClass = interface(JICLOCKClass)
    ['{1A474385-AE32-4C0F-A4AA-71A71062A290}']
    {class} function RTCFGet: JGEDI_CLOCK_st_RTC; cdecl;//Deprecated
    {class} function a: JGEDI_CLOCK_st_RTC; cdecl; overload;//Deprecated
    {class} procedure a(P1: JGEDI_CLOCK_st_RTC); cdecl; overload;//Deprecated
    {class} function a(P1: Byte; P2: Byte; P3: Byte; P4: Byte; P5: Byte; P6: Byte; P7: Byte): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>; P7: TJavaArray<Byte>): Integer; cdecl; overload;//Deprecated
    {class} function init: Jgedi_b; cdecl; overload;//Deprecated
    {class} function init(P1: JContext): Jgedi_b; cdecl; overload;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/b')]
  Jgedi_b = interface(JICLOCK)
    ['{102F81D0-C9F3-4E69-A425-781C570E9CD7}']
  end;
  TJgedi_b = class(TJavaGenericImport<Jgedi_bClass, Jgedi_b>) end;

  Jgedi_a_cClass = interface(Jgedi_bClass)
    ['{C5F6E196-A3F2-4D1C-858E-ADC70C634A3F}']
    {class} function RTCFGet: JGEDI_CLOCK_st_RTC; cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/a/c')]
  Jgedi_a_c = interface(Jgedi_b)
    ['{72D3FC3E-4FBB-44E3-A69F-B26B086E5426}']
  end;
  TJgedi_a_c = class(TJavaGenericImport<Jgedi_a_cClass, Jgedi_a_c>) end;

  JICRYPTClass = interface(IJavaClass)
    ['{6F136252-BFA1-4F96-98AD-9BDB45F4E324}']
    {class} function RNG(P1: Integer): TJavaArray<Byte>; cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/interfaces/ICRYPT')]
  JICRYPT = interface(IJavaInstance)
    ['{B90BB939-E2F3-4626-9853-3BB1BA5942D8}']
  end;
  TJICRYPT = class(TJavaGenericImport<JICRYPTClass, JICRYPT>) end;

  Jgedi_cClass = interface(JICRYPTClass)
    ['{F46F14BA-3811-4ABF-AA12-108010DD17E9}']
    {class} function RNG(P1: Integer): TJavaArray<Byte>; cdecl;//Deprecated
    {class} function a(P1: TJavaArray<Byte>): TJavaArray<Byte>; cdecl; overload;//Deprecated
    {class} function a(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: JGEDI_CRYPT_e_Op; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>): TJavaArray<Byte>; cdecl; overload;//Deprecated
    {class} function a(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>): TJavaArray<Byte>; cdecl; overload;//Deprecated
    {class} function a(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: JGEDI_CRYPT_e_Op; P2: TJavaArray<Byte>; P3: Integer; P4: Integer; P5: TJavaArray<Byte>; P6: Integer; P7: Integer; P8: TJavaArray<Byte>): Integer; cdecl; overload;//Deprecated
    {class} function b(P1: TJavaArray<Byte>): Integer; cdecl; overload;//Deprecated
    {class} function b(P1: JGEDI_CRYPT_e_Op; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>): TJavaArray<Byte>; cdecl; overload;//Deprecated
    {class} function init: Jgedi_c; cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/c')]
  Jgedi_c = interface(JICRYPT)
    ['{06F1147E-89F8-469A-AC29-B953B69E2AA5}']
  end;
  TJgedi_c = class(TJavaGenericImport<Jgedi_cClass, Jgedi_c>) end;

  Jgedi_a_dClass = interface(Jgedi_cClass)
    ['{60DA5540-A0C9-4775-AED9-843A539697CC}']
    {class} function RNG(P1: Integer): TJavaArray<Byte>; cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/a/d')]
  Jgedi_a_d = interface(Jgedi_c)
    ['{E9814AF1-D9DD-436F-8D7D-2FBA50231D21}']
  end;
  TJgedi_a_d = class(TJavaGenericImport<Jgedi_a_dClass, Jgedi_a_d>) end;

  Jgedi_a_eClass = interface(JGEDIClass)
    ['{EF2AFD8C-9A7C-4410-9FDA-7D63421E23A8}']
    {class} procedure EnterEng(P1: JString); cdecl;//Deprecated
    {class} function VersionGet: JString; cdecl;//Deprecated
    {class} function b: Jgedi_d; cdecl;//Deprecated
    {class} function c: Jgedi_c; cdecl;//Deprecated
    {class} function d: Jgedi_e; cdecl;//Deprecated
    {class} function e: Jgedi_g; cdecl;//Deprecated
    {class} function f: Jgedi_l; cdecl;//Deprecated
    {class} function g: Jgedi_i; cdecl;//Deprecated
    {class} function getAUDIO: JIAUDIO; cdecl;//Deprecated
    {class} function getCL: JICL; cdecl;//Deprecated
    {class} function getCLOCK: JICLOCK; cdecl;//Deprecated
    {class} function getCRYPT: JICRYPT; cdecl;//Deprecated
    {class} function getINFO: JIINFO; cdecl;//Deprecated
    {class} function getKBD: JIKBD; cdecl;//Deprecated
    {class} function getKMS: JIKMS; cdecl;//Deprecated
    {class} function getLED: JILED; cdecl;//Deprecated
    {class} function getMSR: JIMSR; cdecl;//Deprecated
    {class} function getPM: JIPM; cdecl;//Deprecated
    {class} function getPRNTR: JIPRNTR; cdecl;//Deprecated
    {class} function getSMART: JISMART; cdecl;//Deprecated
    {class} function h: Jgedi_a; cdecl;//Deprecated
    {class} function i: Jgedi_b; cdecl;//Deprecated
    {class} function init(P1: JContext): Jgedi_a_e; cdecl;//Deprecated
    {class} function j: Jgedi_h; cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/a/e')]
  Jgedi_a_e = interface(JGEDI)
    ['{947F3A6D-2B74-4D00-9A0D-BFCA294049B0}']
  end;
  TJgedi_a_e = class(TJavaGenericImport<Jgedi_a_eClass, Jgedi_a_e>) end;

  JIINFOClass = interface(IJavaClass)
    ['{8CF0648C-7391-4199-869A-9C754698CD2B}']
    {class} function ControlNumberGet(P1: JGEDI_INFO_e_ControlNumber): JString; cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/interfaces/IINFO')]
  JIINFO = interface(IJavaInstance)
    ['{148F9975-3B73-4F00-A905-0387F502FD0C}']
  end;
  TJIINFO = class(TJavaGenericImport<JIINFOClass, JIINFO>) end;

  Jgedi_dClass = interface(JIINFOClass)
    ['{F49B6122-EE89-4B1D-8325-5839B4151604}']
    {class} function ControlNumberGet(P1: JGEDI_INFO_e_ControlNumber): JString; cdecl;//Deprecated
    {class} function a: JString; cdecl; overload;//Deprecated
    {class} function a(P1: TJavaArray<Byte>): Integer; cdecl; overload;//Deprecated
    {class} procedure a(P1: JGEDI_INFO_e_ControlNumber; P2: JString); cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl; overload;//Deprecated
    {class} function b(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl;//Deprecated
    {class} function init: Jgedi_d; cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/d')]
  Jgedi_d = interface(JIINFO)
    ['{4D1EFA13-3AFD-4985-AC2E-8C6738C1E94C}']
  end;
  TJgedi_d = class(TJavaGenericImport<Jgedi_dClass, Jgedi_d>) end;

  Ja_fClass = interface(Jgedi_dClass)
    ['{B7F8C02A-9975-4493-9D9D-B9BCE432041F}']
    {class} function ControlNumberGet(P1: JGEDI_INFO_e_ControlNumber): JString; cdecl;//Deprecated
    {class} function a: JString; cdecl; overload;//Deprecated
    {class} procedure a(P1: JGEDI_INFO_e_ControlNumber; P2: JString); cdecl; overload;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/a/f')]
  Ja_f = interface(Jgedi_d)
    ['{616DC397-B462-4851-AB50-5C681EEEB22E}']
  end;
  TJa_f = class(TJavaGenericImport<Ja_fClass, Ja_f>) end;

  Jf_1Class = interface(JObjectClass)
    ['{8C669E1B-1B68-4B42-8643-9F8A7A266802}']
  end;

  [JavaSignature('br/com/gertec/gedi/a/f$1')]
  Jf_1 = interface(JObject)
    ['{6B5E308B-9945-4966-848C-AB26A1A628A1}']
  end;
  TJf_1 = class(TJavaGenericImport<Jf_1Class, Jf_1>) end;

  JIKBDClass = interface(IJavaClass)
    ['{478F6FE4-6199-44EC-9888-8B3A2017E393}']
    {class} procedure &Set(P1: JGEDI_KBD_st_Info); cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/interfaces/IKBD')]
  JIKBD = interface(IJavaInstance)
    ['{5463C681-865D-4205-A3B5-A7D6E6CDB33F}']
  end;
  TJIKBD = class(TJavaGenericImport<JIKBDClass, JIKBD>) end;

  Jgedi_eClass = interface(JIKBDClass)
    ['{68F62087-3C97-4772-8605-72370257A651}']
    {class} function _Geta: Integer; cdecl;
    {class} function _Getb: Integer; cdecl;
    {class} procedure _Setb(Value: Integer); cdecl;
    {class} function _Getc: Integer; cdecl;
    {class} procedure _Setc(Value: Integer); cdecl;
    {class} function _Getd: Integer; cdecl;
    {class} procedure _Setd(Value: Integer); cdecl;
    {class} function _Gete: Integer; cdecl;
    {class} procedure _Sete(Value: Integer); cdecl;
    {class} function _Getf: Integer; cdecl;
    {class} procedure _Setf(Value: Integer); cdecl;
    {class} function _Getg: Integer; cdecl;
    {class} procedure _Setg(Value: Integer); cdecl;
    {class} function _Geth: Integer; cdecl;
    {class} procedure _Seth(Value: Integer); cdecl;
    {class} function _Geti: Integer; cdecl;
    {class} procedure _Seti(Value: Integer); cdecl;
    {class} function _Getj: Integer; cdecl;
    {class} procedure _Setj(Value: Integer); cdecl;
    {class} function _Getk: Integer; cdecl;
    {class} procedure _Setk(Value: Integer); cdecl;
    {class} function _Getl: Integer; cdecl;
    {class} procedure _Setl(Value: Integer); cdecl;
    {class} function _Getm: Integer; cdecl;
    {class} procedure _Setm(Value: Integer); cdecl;
    {class} function _Getn: Integer; cdecl;
    {class} procedure _Setn(Value: Integer); cdecl;
    {class} function _Geto: Integer; cdecl;
    {class} procedure _Seto(Value: Integer); cdecl;
    {class} function _Getp: Integer; cdecl;
    {class} procedure _Setp(Value: Integer); cdecl;
    {class} function _Getq: Integer; cdecl;
    {class} procedure _Setq(Value: Integer); cdecl;
    {class} function _Getr: Integer; cdecl;
    {class} procedure _Setr(Value: Integer); cdecl;
    {class} function _Gets: Integer; cdecl;
    {class} procedure _Sets(Value: Integer); cdecl;
    {class} function _Gett: Integer; cdecl;
    {class} procedure _Sett(Value: Integer); cdecl;
    {class} function _Getu: Integer; cdecl;
    {class} procedure _Setu(Value: Integer); cdecl;
    {class} function _Getv: Integer; cdecl;
    {class} procedure _Setv(Value: Integer); cdecl;
    {class} function _Getw: Integer; cdecl;
    {class} procedure _Setw(Value: Integer); cdecl;
    {class} function _Getx: Integer; cdecl;
    {class} procedure _Setx(Value: Integer); cdecl;
    {class} function _Gety: Integer; cdecl;
    {class} procedure _Sety(Value: Integer); cdecl;
    {class} function _Getz: Integer; cdecl;
    {class} procedure _Setz(Value: Integer); cdecl;
    {class} function a(P1: Integer; P2: Boolean): JGEDI_KBD_e_Key; cdecl; overload;//Deprecated
    {class} function a(P1: TJavaArray<Integer>; P2: Integer; P3: Boolean): Integer; cdecl; overload;//Deprecated
    {class} function init: Jgedi_e; cdecl;//Deprecated

    // Alterado por Geovani
    // {class} property a: Integer read _Geta;
    {class} property a_1: Integer read _Geta;

    {class} property b: Integer read _Getb write _Setb;
    {class} property c: Integer read _Getc write _Setc;
    {class} property d: Integer read _Getd write _Setd;
    {class} property e: Integer read _Gete write _Sete;
    {class} property f: Integer read _Getf write _Setf;
    {class} property g: Integer read _Getg write _Setg;
    {class} property h: Integer read _Geth write _Seth;
    {class} property i: Integer read _Geti write _Seti;
    {class} property j: Integer read _Getj write _Setj;
    {class} property k: Integer read _Getk write _Setk;
    {class} property l: Integer read _Getl write _Setl;
    {class} property m: Integer read _Getm write _Setm;
    {class} property n: Integer read _Getn write _Setn;
    {class} property o: Integer read _Geto write _Seto;
    {class} property p: Integer read _Getp write _Setp;
    {class} property q: Integer read _Getq write _Setq;
    {class} property r: Integer read _Getr write _Setr;
    {class} property s: Integer read _Gets write _Sets;
    {class} property t: Integer read _Gett write _Sett;
    {class} property u: Integer read _Getu write _Setu;
    {class} property v: Integer read _Getv write _Setv;
    {class} property w: Integer read _Getw write _Setw;
    {class} property x: Integer read _Getx write _Setx;
    {class} property y: Integer read _Gety write _Sety;
    {class} property z: Integer read _Getz write _Setz;
  end;

  [JavaSignature('br/com/gertec/gedi/e')]
  Jgedi_e = interface(JIKBD)
    ['{E6C66E2F-8086-4F88-ADB7-2A720A7F148A}']
  end;
  TJgedi_e = class(TJavaGenericImport<Jgedi_eClass, Jgedi_e>) end;

  Ja_gClass = interface(Jgedi_eClass)
    ['{8D9FCF62-0590-4C2C-9CB5-F2C13314BCAA}']
    {class} procedure &Set(P1: JGEDI_KBD_st_Info); cdecl;//Deprecated
    {class} function a(P1: Integer; P2: Boolean): JGEDI_KBD_e_Key; cdecl; overload;//Deprecated
    {class} function b: Jgedi_f; cdecl;//Deprecated
    {class} function init(P1: Ja_o): Ja_g; cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/a/g')]
  Ja_g = interface(Jgedi_e)
    ['{6D02B715-2C52-4B7B-9637-DBC6A47E6AAD}']
  end;
  TJa_g = class(TJavaGenericImport<Ja_gClass, Ja_g>) end;

  Jg_1Class = interface(JView_OnClickListenerClass)
    ['{3369BC96-F3ED-4401-ABE6-BE1B1DCD3FC7}']
    {class} function init(P1: Ja_g): Jg_1; cdecl;//Deprecated
    {class} procedure onClick(P1: JView); cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/a/g$1')]
  Jg_1 = interface(JView_OnClickListener)
    ['{809C0D14-094F-4725-889A-772C57126D97}']
  end;
  TJg_1 = class(TJavaGenericImport<Jg_1Class, Jg_1>) end;

  Jg_10Class = interface(JView_OnClickListenerClass)
    ['{C0A1A43F-C707-4946-8FB2-D85A540E5714}']
    {class} function init(P1: Ja_g): Jg_10; cdecl;//Deprecated
    {class} procedure onClick(P1: JView); cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/a/g$10')]
  Jg_10 = interface(JView_OnClickListener)
    ['{72A64514-4F80-45D4-A5BE-99063B0B395D}']
  end;
  TJg_10 = class(TJavaGenericImport<Jg_10Class, Jg_10>) end;

  Jg_11Class = interface(JView_OnClickListenerClass)
    ['{4E856DA0-8B2E-4374-9A25-A597F1CCB5AA}']
    {class} function init(P1: Ja_g): Jg_11; cdecl;//Deprecated
    {class} procedure onClick(P1: JView); cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/a/g$11')]
  Jg_11 = interface(JView_OnClickListener)
    ['{59F9ACA8-0226-4574-A942-E3080542FB49}']
  end;
  TJg_11 = class(TJavaGenericImport<Jg_11Class, Jg_11>) end;

  Jg_12Class = interface(JView_OnClickListenerClass)
    ['{4D3BFEE7-E850-422C-B5E6-8EFC5BDB8CE1}']
    {class} function init(P1: Ja_g): Jg_12; cdecl;//Deprecated
    {class} procedure onClick(P1: JView); cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/a/g$12')]
  Jg_12 = interface(JView_OnClickListener)
    ['{2324A98E-0BD9-4B97-83FA-D9C5EFF252EB}']
  end;
  TJg_12 = class(TJavaGenericImport<Jg_12Class, Jg_12>) end;

  Jg_13Class = interface(JView_OnClickListenerClass)
    ['{8F04A7D2-4466-4DEC-BB18-82AF4FEF60B7}']
    {class} function init(P1: Ja_g): Jg_13; cdecl;//Deprecated
    {class} procedure onClick(P1: JView); cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/a/g$13')]
  Jg_13 = interface(JView_OnClickListener)
    ['{A79AB92C-65E2-499D-B976-4F4C939F0F23}']
  end;
  TJg_13 = class(TJavaGenericImport<Jg_13Class, Jg_13>) end;

  Jg_2Class = interface(JView_OnClickListenerClass)
    ['{8F53969D-0506-40EA-B84C-AD02DB500B6A}']
    {class} function init(P1: Ja_g): Jg_2; cdecl;//Deprecated
    {class} procedure onClick(P1: JView); cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/a/g$2')]
  Jg_2 = interface(JView_OnClickListener)
    ['{DA3CF5E9-AF41-4D32-9E9A-F3CCA07B22D2}']
  end;
  TJg_2 = class(TJavaGenericImport<Jg_2Class, Jg_2>) end;

  Jg_3Class = interface(JView_OnClickListenerClass)
    ['{FC69E3B1-8F11-4BCB-A28D-98237DE8C189}']
    {class} function init(P1: Ja_g): Jg_3; cdecl;//Deprecated
    {class} procedure onClick(P1: JView); cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/a/g$3')]
  Jg_3 = interface(JView_OnClickListener)
    ['{33F14E0C-8D27-4BF6-A3D4-E6FE83FF771D}']
  end;
  TJg_3 = class(TJavaGenericImport<Jg_3Class, Jg_3>) end;

  Jg_4Class = interface(JView_OnClickListenerClass)
    ['{894AAEE4-97A0-47A2-835D-D5EFC0E10332}']
    {class} function init(P1: Ja_g): Jg_4; cdecl;//Deprecated
    {class} procedure onClick(P1: JView); cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/a/g$4')]
  Jg_4 = interface(JView_OnClickListener)
    ['{CECAC6C1-CBF4-4F80-87A1-4AE382D8C0DA}']
  end;
  TJg_4 = class(TJavaGenericImport<Jg_4Class, Jg_4>) end;

  Jg_5Class = interface(JView_OnClickListenerClass)
    ['{75543C29-77D1-4369-9B96-7460DAF9A593}']
    {class} function init(P1: Ja_g): Jg_5; cdecl;//Deprecated
    {class} procedure onClick(P1: JView); cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/a/g$5')]
  Jg_5 = interface(JView_OnClickListener)
    ['{16CD0DD9-63EF-4405-8DEC-FC9FEB9F733E}']
  end;
  TJg_5 = class(TJavaGenericImport<Jg_5Class, Jg_5>) end;

  Jg_6Class = interface(JView_OnClickListenerClass)
    ['{72187126-5124-42EC-AD39-0946392D8EFC}']
    {class} function init(P1: Ja_g): Jg_6; cdecl;//Deprecated
    {class} procedure onClick(P1: JView); cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/a/g$6')]
  Jg_6 = interface(JView_OnClickListener)
    ['{328E2845-EF14-4E31-B60A-D51F131A8E26}']
  end;
  TJg_6 = class(TJavaGenericImport<Jg_6Class, Jg_6>) end;

  Jg_7Class = interface(JView_OnClickListenerClass)
    ['{0F18D820-8432-46C2-BBFA-68C4E722EB38}']
    {class} function init(P1: Ja_g): Jg_7; cdecl;//Deprecated
    {class} procedure onClick(P1: JView); cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/a/g$7')]
  Jg_7 = interface(JView_OnClickListener)
    ['{05E77DDB-D8CC-4C53-88B1-72A8CFCA2CBF}']
  end;
  TJg_7 = class(TJavaGenericImport<Jg_7Class, Jg_7>) end;

  Jg_8Class = interface(JView_OnClickListenerClass)
    ['{E07DD17D-88D2-4967-BBB5-4B897CCDBB6B}']
    {class} function init(P1: Ja_g): Jg_8; cdecl;//Deprecated
    {class} procedure onClick(P1: JView); cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/a/g$8')]
  Jg_8 = interface(JView_OnClickListener)
    ['{1A8B3C04-C24A-47CB-AACA-42A0F8100E6E}']
  end;
  TJg_8 = class(TJavaGenericImport<Jg_8Class, Jg_8>) end;

  Jg_9Class = interface(JView_OnClickListenerClass)
    ['{E901BC64-4DB3-4FBC-9FBF-207079322B75}']
    {class} function init(P1: Ja_g): Jg_9; cdecl;//Deprecated
    {class} procedure onClick(P1: JView); cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/a/g$9')]
  Jg_9 = interface(JView_OnClickListener)
    ['{0459F3CC-DCB9-4B8B-8EA5-54D041F63134}']
  end;
  TJg_9 = class(TJavaGenericImport<Jg_9Class, Jg_9>) end;

  JIKMSClass = interface(IJavaClass)
    ['{2D656FF3-8528-4AB1-9530-C6BC71FC4A72}']
    {class} function CapturePINBlock(P1: JGEDI_KMS_st_Control; P2: Boolean; P3: JGEDI_KMS_st_Data; P4: JList): JGEDI_KMS_st_CapturePINBlockInfo; cdecl;//Deprecated
    {class} function DUKPTKSNGet(P1: JGEDI_KMS_e_KEYTYPE; P2: JGEDI_KMS_e_KEYPURPOSE; P3: Integer): TJavaArray<Byte>; cdecl;//Deprecated
    {class} function EncryptData(P1: JGEDI_KMS_st_Data): JGEDI_KMS_st_Data; cdecl;//Deprecated
    {class} function KCVGet(P1: JGEDI_KMS_e_KEYTYPE; P2: JGEDI_KMS_e_KEYPURPOSE; P3: Integer): TJavaArray<Byte>; cdecl;//Deprecated
    {class} function KeyPresenceTest(P1: JGEDI_KMS_e_KEYTYPE; P2: JGEDI_KMS_e_KEYPURPOSE; P3: Integer): Boolean; cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/interfaces/IKMS')]
  JIKMS = interface(IJavaInstance)
    ['{B1915D1B-CCF7-4C61-B926-AD9192D3EE3B}']
  end;
  TJIKMS = class(TJavaGenericImport<JIKMSClass, JIKMS>) end;

  Jgedi_gClass = interface(JIKMSClass)
    ['{C88A6E8F-DA5E-4842-BF50-F584A0A6C847}']
    {class} function CapturePINBlock(P1: JGEDI_KMS_st_Control; P2: Boolean; P3: JGEDI_KMS_st_Data; P4: JList): JGEDI_KMS_st_CapturePINBlockInfo; cdecl;//Deprecated
    {class} function DUKPTKSNGet(P1: JGEDI_KMS_e_KEYTYPE; P2: JGEDI_KMS_e_KEYPURPOSE; P3: Integer): TJavaArray<Byte>; cdecl;//Deprecated
    {class} function EncryptData(P1: JGEDI_KMS_st_Data): JGEDI_KMS_st_Data; cdecl;//Deprecated
    {class} function KCVGet(P1: JGEDI_KMS_e_KEYTYPE; P2: JGEDI_KMS_e_KEYPURPOSE; P3: Integer): TJavaArray<Byte>; cdecl;//Deprecated
    {class} function KeyPresenceTest(P1: JGEDI_KMS_e_KEYTYPE; P2: JGEDI_KMS_e_KEYPURPOSE; P3: Integer): Boolean; cdecl;//Deprecated
    {class} procedure a; cdecl; overload;//Deprecated
    {class} procedure a(P1: JGEDI_KMS_st_SaveKey); cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: Integer): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: Integer; P5: JString; P6: TJavaArray<Byte>; P7: TJavaArray<Byte>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Boolean; P6: JGEDI_KMS_st_Control_Callbacks; P7: Boolean; P8: TJavaArray<Byte>; P9: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>; P7: TJavaArray<Byte>; P8: TJavaArray<Byte>; P9: TJavaArray<Integer>; P10: TJavaArray<Byte>): Integer; cdecl; overload;//Deprecated
    {class} function init: Jgedi_g; cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/g')]
  Jgedi_g = interface(JIKMS)
    ['{44C2F5EA-BE10-4838-ABBD-5F18E1956DE2}']
  end;
  TJgedi_g = class(TJavaGenericImport<Jgedi_gClass, Jgedi_g>) end;

  Ja_hClass = interface(Jgedi_gClass)
    ['{1773F0B1-BAAB-4ABA-A8DA-E53FCDD64349}']
    {class} function CapturePINBlock(P1: JGEDI_KMS_st_Control; P2: Boolean; P3: JGEDI_KMS_st_Data; P4: JList): JGEDI_KMS_st_CapturePINBlockInfo; cdecl;//Deprecated
    {class} function DUKPTKSNGet(P1: JGEDI_KMS_e_KEYTYPE; P2: JGEDI_KMS_e_KEYPURPOSE; P3: Integer): TJavaArray<Byte>; cdecl;//Deprecated
    {class} function EncryptData(P1: JGEDI_KMS_st_Data): JGEDI_KMS_st_Data; cdecl;//Deprecated
    {class} function KCVGet(P1: JGEDI_KMS_e_KEYTYPE; P2: JGEDI_KMS_e_KEYPURPOSE; P3: Integer): TJavaArray<Byte>; cdecl;//Deprecated
    {class} function KeyPresenceTest(P1: JGEDI_KMS_e_KEYTYPE; P2: JGEDI_KMS_e_KEYPURPOSE; P3: Integer): Boolean; cdecl;//Deprecated
    {class} procedure a; cdecl; overload;//Deprecated
    {class} procedure a(P1: JGEDI_KMS_st_SaveKey); cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: Integer; P5: JString; P6: TJavaArray<Byte>; P7: TJavaArray<Byte>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Boolean; P6: JGEDI_KMS_st_Control_Callbacks; P7: Boolean; P8: TJavaArray<Byte>; P9: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/a/h')]
  Ja_h = interface(Jgedi_g)
    ['{FD4B07F8-D77D-4F57-B32A-89B277271478}']
  end;
  TJa_h = class(TJavaGenericImport<Ja_hClass, Ja_h>) end;

  Jc_aClass = interface(JBinderClass)
    ['{E9AE2E04-0C8B-4C25-926A-420FF19AD8CF}']
    {class} function a(P1: JIBinder): Ja_c; cdecl;//Deprecated
    {class} function asBinder: JIBinder; cdecl;//Deprecated
    {class} function init: Jc_a; cdecl;//Deprecated
    {class} function onTransact(P1: Integer; P2: JParcel; P3: JParcel; P4: Integer): Boolean; cdecl;//Deprecated
  end;

  [JavaSignature('wangpos/sdk4/a/c$a')]
  Jc_a = interface(JBinder)
    ['{16226183-FAA5-41AE-8966-3E72B7F25AFC}']
  end;
  TJc_a = class(TJavaGenericImport<Jc_aClass, Jc_a>) end;

  Jh_1Class = interface(Jc_aClass)
    ['{49949287-4CFA-4DE2-B82F-ACC9B97A9AD9}']
    {class} function a(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function init(P1: Ja_h): Jh_1; cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/a/h$1')]
  Jh_1 = interface(Jc_a)
    ['{B313FACB-DBAA-410A-997C-669552795306}']
  end;
  TJh_1 = class(TJavaGenericImport<Jh_1Class, Jh_1>) end;

  Jh_2Class = interface(JObjectClass)
    ['{5905A8A5-39CB-4446-AA23-C99ED57CF045}']
    {class} function _Getb: TJavaArray<Integer>; cdecl;
    {class} property b: TJavaArray<Integer> read _Getb;
  end;

  [JavaSignature('br/com/gertec/gedi/a/h$2')]
  Jh_2 = interface(JObject)
    ['{72E35C63-82DE-4D23-9878-2CD0909A5075}']
  end;
  TJh_2 = class(TJavaGenericImport<Jh_2Class, Jh_2>) end;

  JIMSRClass = interface(IJavaClass)
    ['{538DDAD3-5114-49FA-B946-EB7363BD615F}']
    {class} function LastErrorGet: JGEDI_MSR_st_LastErrors; cdecl;//Deprecated
    {class} function Read: JGEDI_MSR_st_Tracks; cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/interfaces/IMSR')]
  JIMSR = interface(IJavaInstance)
    ['{41FF2DE9-A428-451C-974A-FF5C71865271}']
  end;
  TJIMSR = class(TJavaGenericImport<JIMSRClass, JIMSR>) end;

  Jgedi_iClass = interface(JIMSRClass)
    ['{F0412BF8-6541-45F7-8201-F50528779086}']
    {class} function LastErrorGet: JGEDI_MSR_st_LastErrors; cdecl;//Deprecated
    {class} function Read: JGEDI_MSR_st_Tracks; cdecl;//Deprecated
    {class} function a(P1: TJavaArray<Integer>; P2: TJavaArray<Integer>; P3: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>; P5: TJavaArray<Byte>; P6: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function init: Jgedi_i; cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/i')]
  Jgedi_i = interface(JIMSR)
    ['{78E34E3C-2F1D-4DC4-AADD-57C0CCA4BC05}']
  end;
  TJgedi_i = class(TJavaGenericImport<Jgedi_iClass, Jgedi_i>) end;

  Ja_iClass = interface(Jgedi_iClass)
    ['{D5AF9A0E-39B5-4AF4-8CDB-4AAE6366AF6B}']
    {class} function LastErrorGet: JGEDI_MSR_st_LastErrors; cdecl;//Deprecated
    {class} function Read: JGEDI_MSR_st_Tracks; cdecl;//Deprecated
    {class} function a: Jgertec_Logger; cdecl; overload;//Deprecated
    {class} function a(P1: Ja_i): JObject; cdecl; overload;//Deprecated
    {class} function a(P1: Ja_i; P2: JGEDI_MSR_e_Status): JGEDI_MSR_e_Status; cdecl; overload;//Deprecated
    {class} function a(P1: Ja_i; P2: JGEDI_MSR_st_Tracks): JGEDI_MSR_st_Tracks; cdecl; overload;//Deprecated
    {class} function b(P1: Ja_i): JGEDI_MSR_st_Tracks; cdecl;//Deprecated
    {class} function init(P1: Ja_o; P2: JContext): Ja_i; cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/a/i')]
  Ja_i = interface(Jgedi_i)
    ['{0F43C8CE-4FC7-4BD0-AAC9-0247BFB40449}']
  end;
  TJa_i = class(TJavaGenericImport<Ja_iClass, Ja_i>) end;

  Ji_1Class = interface(JBroadcastReceiverClass)
    ['{6A178640-059D-4459-A415-528D56AFFB8B}']
    {class} function init(P1: Ja_i): Ji_1; cdecl;//Deprecated
    {class} procedure onReceive(P1: JContext; P2: JIntent); cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/a/i$1')]
  Ji_1 = interface(JBroadcastReceiver)
    ['{98B9EFF2-309D-46BA-898A-0C29797B9CC2}']
  end;
  TJi_1 = class(TJavaGenericImport<Ji_1Class, Ji_1>) end;

  JIPMClass = interface(IJavaClass)
    ['{117C3810-2419-49DC-9B46-1A2EC1405BA8}']
    {class} procedure ApDefaultSet(P1: JString); cdecl;//Deprecated
    {class} procedure ApDelete(P1: JString); cdecl;//Deprecated
    {class} procedure UpdateFromFile(P1: JString; P2: JGEDI_FS_e_Storage); cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/interfaces/IPM')]
  JIPM = interface(IJavaInstance)
    ['{72DDCA4A-FE4C-4A6D-BA6E-52A14E474E68}']
  end;
  TJIPM = class(TJavaGenericImport<JIPMClass, JIPM>) end;

  Jgedi_jClass = interface(JIPMClass)
    ['{19824F1B-7058-48BA-8B70-9665DEDDFE51}']
    {class} procedure ApDefaultSet(P1: JString); cdecl;//Deprecated
    {class} procedure ApDelete(P1: JString); cdecl;//Deprecated
    {class} procedure UpdateFromFile(P1: JString; P2: JGEDI_FS_e_Storage); cdecl;//Deprecated
    {class} function init: Jgedi_j; cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/j')]
  Jgedi_j = interface(JIPM)
    ['{E55F6D11-9AD1-4945-83AD-3365F0BD78A0}']
  end;
  TJgedi_j = class(TJavaGenericImport<Jgedi_jClass, Jgedi_j>) end;

  Ja_jClass = interface(Jgedi_jClass)
    ['{8706A0DB-142F-4F93-A095-D64D83F49FCD}']
    {class} procedure ApDefaultSet(P1: JString); cdecl;//Deprecated
    {class} procedure ApDelete(P1: JString); cdecl;//Deprecated
    {class} procedure UpdateFromFile(P1: JString; P2: JGEDI_FS_e_Storage); cdecl;//Deprecated
    {class} function init(P1: Ja_o): Ja_j; cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/a/j')]
  Ja_j = interface(Jgedi_j)
    ['{A3FDCC07-009C-48D3-A04F-D1998BDEF15D}']
  end;
  TJa_j = class(TJavaGenericImport<Ja_jClass, Ja_j>) end;

  JIPRNTRClass = interface(IJavaClass)
    ['{E2975769-6C90-4F84-A55A-1C48BE273F51}']
    {class} procedure DrawBarCode(P1: JGEDI_PRNTR_st_BarCodeConfig; P2: JString); cdecl;//Deprecated
    {class} procedure DrawBlankLine(P1: Integer); cdecl;//Deprecated
    {class} procedure DrawPictureExt(P1: JGEDI_PRNTR_st_PictureConfig; P2: JBitmap); cdecl;//Deprecated
    {class} procedure DrawStringExt(P1: JGEDI_PRNTR_st_StringConfig; P2: JString); cdecl;//Deprecated
    {class} function GetPaperUsage: Integer; cdecl;//Deprecated
    {class} procedure Init; cdecl;//Deprecated
    {class} procedure Output; cdecl;//Deprecated
    {class} procedure ResetPaperUsage; cdecl;//Deprecated
    {class} function Status: JGEDI_PRNTR_e_Status; cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/interfaces/IPRNTR')]
  JIPRNTR = interface(IJavaInstance)
    ['{A11D1599-124D-42D8-998F-F4308CC479CA}']
  end;
  TJIPRNTR = class(TJavaGenericImport<JIPRNTRClass, JIPRNTR>) end;

  Jgedi_kClass = interface(JIPRNTRClass)
    ['{26F45BB7-0DA9-4020-BECB-9B28396BAB33}']
    {class} procedure DrawBarCode(P1: JGEDI_PRNTR_st_BarCodeConfig; P2: JString); cdecl;//Deprecated
    {class} procedure DrawBlankLine(P1: Integer); cdecl;//Deprecated
    {class} procedure DrawPictureExt(P1: JGEDI_PRNTR_st_PictureConfig; P2: JBitmap); cdecl;//Deprecated
    {class} procedure DrawStringExt(P1: JGEDI_PRNTR_st_StringConfig; P2: JString); cdecl;//Deprecated
    {class} function GetPaperUsage: Integer; cdecl;//Deprecated
    {class} procedure Init; cdecl;//Deprecated
    {class} procedure Output; cdecl;//Deprecated
    {class} procedure ResetPaperUsage; cdecl;//Deprecated
    {class} function Status: JGEDI_PRNTR_e_Status; cdecl;//Deprecated
    // {class} function init: Jgedi_k; cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/k')]
  Jgedi_k = interface(JIPRNTR)
    ['{1B1A2298-8B65-4A0A-B088-5B3590573237}']
  end;
  TJgedi_k = class(TJavaGenericImport<Jgedi_kClass, Jgedi_k>) end;

  Ja_kClass = interface(Jgedi_kClass)
    ['{B459C9A0-5595-4624-9695-25F3C1A540F8}']
    {class} procedure DrawBarCode(P1: JGEDI_PRNTR_st_BarCodeConfig; P2: JString); cdecl;//Deprecated
    {class} procedure DrawBlankLine(P1: Integer); cdecl;//Deprecated
    {class} procedure DrawPictureExt(P1: JGEDI_PRNTR_st_PictureConfig; P2: JBitmap); cdecl;//Deprecated
    {class} procedure DrawStringExt(P1: JGEDI_PRNTR_st_StringConfig; P2: JString); cdecl;//Deprecated
    {class} function GetPaperUsage: Integer; cdecl;//Deprecated
    {class} procedure Init; cdecl; overload;//Deprecated
    {class} procedure Output; cdecl;//Deprecated
    {class} procedure ResetPaperUsage; cdecl;//Deprecated
    {class} function Status: JGEDI_PRNTR_e_Status; cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/a/k')]
  Ja_k = interface(Jgedi_k)
    ['{DA91D846-C1D3-4B97-90F6-5FEDC31EEF02}']
  end;
  TJa_k = class(TJavaGenericImport<Ja_kClass, Ja_k>) end;

  Jk_1Class = interface(JObjectClass)
    ['{8BD78012-1BC4-4A25-95AF-EC67BDAA0E0C}']
    {class} function _Getb: TJavaArray<Integer>; cdecl;
    {class} function _Getc: TJavaArray<Integer>; cdecl;
    {class} property b: TJavaArray<Integer> read _Getb;
    {class} property c: TJavaArray<Integer> read _Getc;
  end;

  [JavaSignature('br/com/gertec/gedi/a/k$1')]
  Jk_1 = interface(JObject)
    ['{86157337-508F-4F49-8B26-1CF0980972A5}']
  end;
  TJk_1 = class(TJavaGenericImport<Jk_1Class, Jk_1>) end;

  JISMARTClass = interface(IJavaClass)
    ['{F34D4C1A-D636-4C67-B996-0F1B9796668E}']
    {class} procedure PowerOff(P1: JGEDI_SMART_e_Slot); cdecl;//Deprecated
    {class} function ResetEMV(P1: JGEDI_SMART_e_Slot; P2: JGEDI_SMART_e_Voltage): JGEDI_SMART_st_ResetInfo; cdecl;//Deprecated
    {class} function SendAPDU(P1: JGEDI_SMART_e_Slot; P2: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;//Deprecated
    {class} function Status(P1: JGEDI_SMART_e_Slot): JGEDI_SMART_e_Status; cdecl;//Deprecated
    {class} function WarmResetEMV(P1: JGEDI_SMART_e_Slot; P2: JGEDI_SMART_e_Voltage): JGEDI_SMART_st_ResetInfo; cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/interfaces/ISMART')]
  JISMART = interface(IJavaInstance)
    ['{1200CF5D-1338-4FE5-9FD3-7BEE328D382B}']
  end;
  TJISMART = class(TJavaGenericImport<JISMARTClass, JISMART>) end;

  Jgedi_lClass = interface(JISMARTClass)
    ['{3702E7CB-9517-4213-88AE-08EBC9E9BBC8}']
    {class} procedure PowerOff(P1: JGEDI_SMART_e_Slot); cdecl;//Deprecated
    {class} function ResetEMV(P1: JGEDI_SMART_e_Slot; P2: JGEDI_SMART_e_Voltage): JGEDI_SMART_st_ResetInfo; cdecl;//Deprecated
    {class} function SendAPDU(P1: JGEDI_SMART_e_Slot; P2: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;//Deprecated
    {class} function Status(P1: JGEDI_SMART_e_Slot): JGEDI_SMART_e_Status; cdecl;//Deprecated
    {class} function WarmResetEMV(P1: JGEDI_SMART_e_Slot; P2: JGEDI_SMART_e_Voltage): JGEDI_SMART_st_ResetInfo; cdecl;//Deprecated
    {class} function init: Jgedi_l; cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/l')]
  Jgedi_l = interface(JISMART)
    ['{EEC95F36-C931-4AD3-B53D-6C9F6F2A8387}']
  end;
  TJgedi_l = class(TJavaGenericImport<Jgedi_lClass, Jgedi_l>) end;

  Ja_lClass = interface(Jgedi_lClass)
    ['{391B69EA-E468-4107-B1FE-444A12BDF5A8}']
    {class} function _Getb: Integer; cdecl;
    {class} procedure _Setb(Value: Integer); cdecl;
    {class} function _Getc: JBroadcastReceiver; cdecl;
    {class} procedure _Setc(Value: JBroadcastReceiver); cdecl;
    {class} procedure PowerOff(P1: JGEDI_SMART_e_Slot); cdecl;//Deprecated
    {class} function ResetEMV(P1: JGEDI_SMART_e_Slot; P2: JGEDI_SMART_e_Voltage): JGEDI_SMART_st_ResetInfo; cdecl;//Deprecated
    {class} function SendAPDU(P1: JGEDI_SMART_e_Slot; P2: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;//Deprecated
    {class} function Status(P1: JGEDI_SMART_e_Slot): JGEDI_SMART_e_Status; cdecl;//Deprecated
    {class} function WarmResetEMV(P1: JGEDI_SMART_e_Slot; P2: JGEDI_SMART_e_Voltage): JGEDI_SMART_st_ResetInfo; cdecl;//Deprecated
    {class} procedure a; cdecl; overload;//Deprecated
    {class} function a(P1: Ja_l): Ja_o; cdecl; overload;//Deprecated
    {class} function b: Jgertec_Logger; cdecl;//Deprecated
    {class} function init(P1: Ja_o; P2: JContext): Ja_l; cdecl;//Deprecated

    // Alterado por Geovani
    // {class} property b: Integer read _Getb write _Setb;
    {class} property b_1: Integer read _Getb write _Setb;

    {class} property c: JBroadcastReceiver read _Getc write _Setc;
  end;

  [JavaSignature('br/com/gertec/gedi/a/l')]
  Ja_l = interface(Jgedi_l)
    ['{F0E9E73F-4861-43D6-A977-F9D9B4FC81BC}']
  end;
  TJa_l = class(TJavaGenericImport<Ja_lClass, Ja_l>) end;

  Jl_1Class = interface(JBroadcastReceiverClass)
    ['{CB4CBFC6-0AC8-430F-9882-B19DD55723F1}']
    {class} function init(P1: Ja_l): Jl_1; cdecl;//Deprecated
    {class} procedure onReceive(P1: JContext; P2: JIntent); cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/a/l$1')]
  Jl_1 = interface(JBroadcastReceiver)
    ['{ACB97511-7B54-439B-876F-89247081878F}']
  end;
  TJl_1 = class(TJavaGenericImport<Jl_1Class, Jl_1>) end;

  Jl_2Class = interface(JBroadcastReceiverClass)
    ['{D55E1A4B-6582-4A07-B10D-3E97D948284B}']
    {class} function init(P1: Ja_l): Jl_2; cdecl;//Deprecated
    {class} procedure onReceive(P1: JContext; P2: JIntent); cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/a/l$2')]
  Jl_2 = interface(JBroadcastReceiver)
    ['{E3A0B4CD-694F-4930-A108-4CE8B329848B}']
  end;
  TJl_2 = class(TJavaGenericImport<Jl_2Class, Jl_2>) end;

  Jl_3Class = interface(JThreadClass)
    ['{0E2A2528-67FD-4ACE-BEEA-CD761E5D63AD}']
    {class} function init(P1: Ja_l): Jl_3; cdecl;//Deprecated
    {class} procedure run; cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/a/l$3')]
  Jl_3 = interface(JThread)
    ['{61159288-9270-4A9B-8B5D-CB70056DC852}']
  end;
  TJl_3 = class(TJavaGenericImport<Jl_3Class, Jl_3>) end;

  JISYSClass = interface(IJavaClass)
    ['{730EA639-F8C9-46F5-9B6A-D10A9675E3EC}']
  end;

  [JavaSignature('br/com/gertec/gedi/interfaces/ISYS')]
  JISYS = interface(IJavaInstance)
    ['{36004BC1-E762-48F7-916E-46AB7D7E8D88}']
  end;
  TJISYS = class(TJavaGenericImport<JISYSClass, JISYS>) end;

  Jgedi_mClass = interface(JISYSClass)
    ['{EF7E2F72-74B9-463E-9EBE-A9317C4D7B96}']
    {class} function init: Jgedi_m; cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/m')]
  Jgedi_m = interface(JISYS)
    ['{0B5DC553-0F76-49A3-9AA0-B9D9C8C324F1}']
  end;
  TJgedi_m = class(TJavaGenericImport<Jgedi_mClass, Jgedi_m>) end;

  Ja_mClass = interface(Jgedi_mClass)
    ['{23580E3C-53EB-4C1D-BF30-0349068DF864}']
    {class} function init(P1: Ja_o): Ja_m; cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/a/m')]
  Ja_m = interface(Jgedi_m)
    ['{2B1BB5A9-14A2-4BA4-90D8-D3AA81FAAB4C}']
  end;
  TJa_m = class(TJavaGenericImport<Ja_mClass, Ja_m>) end;

  Ja_nClass = interface(JObjectClass)
    ['{F34A4928-3702-4E16-8734-DFF19217ECD6}']
    {class} function a(P1: TJavaArray<Byte>): JString; cdecl; overload;//Deprecated
    {class} function a(P1: JString): TJavaArray<Byte>; cdecl; overload;//Deprecated
    {class} function a(P1: TJavaArray<Byte>; P2: Integer): JString; cdecl; overload;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/a/n')]
  Ja_n = interface(JObject)
    ['{D6F8DCC8-D80B-4B7B-8A6E-C4E74DD2C81B}']
  end;
  TJa_n = class(TJavaGenericImport<Ja_nClass, Ja_n>) end;

  Ja_oClass = interface(JObjectClass)
    ['{4BA07C89-077D-412A-A85A-03E088F93ACB}']
    {class} function a(P1: JContext; P2: JIntent): JIntent; cdecl; overload;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/a/o')]
  Ja_o = interface(JObject)
    ['{1FBD3B79-9638-4B5B-A8F9-8EA6FDAE7B15}']
  end;
  TJa_o = class(TJavaGenericImport<Ja_oClass, Ja_o>) end;

  Jo_1Class = interface(JServiceConnectionClass)
    ['{D505BB8B-DFED-466D-8384-C3D7C171319A}']
    {class} function init(P1: Ja_o): Jo_1; cdecl;//Deprecated
    {class} procedure onServiceConnected(P1: JComponentName; P2: JIBinder); cdecl;//Deprecated
    {class} procedure onServiceDisconnected(P1: JComponentName); cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/a/o$1')]
  Jo_1 = interface(JServiceConnection)
    ['{4F7E2641-06E8-4D20-A2B8-017304FD3A1A}']
  end;
  TJo_1 = class(TJavaGenericImport<Jo_1Class, Jo_1>) end;

  JGEDI_CL_e_ISO_LevelClass = interface(JEnumClass)
    ['{8AC35B25-FCA8-430F-844D-BDA18917C8FC}']
    {class} function _GetLEVEL_14443_3: JGEDI_CL_e_ISO_Level; cdecl;
    {class} function _GetLEVEL_14443_4: JGEDI_CL_e_ISO_Level; cdecl;
    {class} function _GetLEVEL_INACTIVE: JGEDI_CL_e_ISO_Level; cdecl;
    {class} function getValue: Integer; cdecl;//Deprecated
    {class} function valueOf(P1: JString): JGEDI_CL_e_ISO_Level; cdecl;//Deprecated
    {class} function values: TJavaObjectArray<JGEDI_CL_e_ISO_Level>; cdecl;//Deprecated
    {class} property LEVEL_14443_3: JGEDI_CL_e_ISO_Level read _GetLEVEL_14443_3;
    {class} property LEVEL_14443_4: JGEDI_CL_e_ISO_Level read _GetLEVEL_14443_4;
    {class} property LEVEL_INACTIVE: JGEDI_CL_e_ISO_Level read _GetLEVEL_INACTIVE;
  end;

  [JavaSignature('br/com/gertec/gedi/enums/GEDI_CL_e_ISO_Level')]
  JGEDI_CL_e_ISO_Level = interface(JEnum)
    ['{4394B720-D5C4-4C56-9697-4083FCCDB4C3}']
  end;
  TJGEDI_CL_e_ISO_Level = class(TJavaGenericImport<JGEDI_CL_e_ISO_LevelClass, JGEDI_CL_e_ISO_Level>) end;

  JGEDI_CL_e_ISO_TypeClass = interface(JEnumClass)
    ['{9A26E575-06BA-4256-8AA8-B4FE8A7E8EF4}']
    {class} function _GetA_3: JGEDI_CL_e_ISO_Type; cdecl;
    {class} function _GetA_4: JGEDI_CL_e_ISO_Type; cdecl;
    {class} function _GetB: JGEDI_CL_e_ISO_Type; cdecl;
    {class} function _GetERR: JGEDI_CL_e_ISO_Type; cdecl;
    {class} function getValue: Integer; cdecl;//Deprecated
    {class} function valueOf(P1: Integer): JGEDI_CL_e_ISO_Type; cdecl; overload;//Deprecated
    {class} function valueOf(P1: JString): JGEDI_CL_e_ISO_Type; cdecl; overload;//Deprecated
    {class} function values: TJavaObjectArray<JGEDI_CL_e_ISO_Type>; cdecl;//Deprecated
    {class} property A_3: JGEDI_CL_e_ISO_Type read _GetA_3;
    {class} property A_4: JGEDI_CL_e_ISO_Type read _GetA_4;
    {class} property B: JGEDI_CL_e_ISO_Type read _GetB;
    {class} property ERR: JGEDI_CL_e_ISO_Type read _GetERR;
  end;

  [JavaSignature('br/com/gertec/gedi/enums/GEDI_CL_e_ISO_Type')]
  JGEDI_CL_e_ISO_Type = interface(JEnum)
    ['{928A9117-2E18-4D0B-A8C3-57BFF718BCF8}']
  end;
  TJGEDI_CL_e_ISO_Type = class(TJavaGenericImport<JGEDI_CL_e_ISO_TypeClass, JGEDI_CL_e_ISO_Type>) end;

  JGEDI_CL_e_MF_KeyTypeClass = interface(JEnumClass)
    ['{3C722397-9582-4A36-B71E-E290FC0CFA10}']
    {class} function _GetKEY_A: JGEDI_CL_e_MF_KeyType; cdecl;
    {class} function _GetKEY_B: JGEDI_CL_e_MF_KeyType; cdecl;
    {class} function getValue: Integer; cdecl;//Deprecated
    {class} function valueOf(P1: Integer): JGEDI_CL_e_MF_KeyType; cdecl; overload;//Deprecated
    {class} function valueOf(P1: JString): JGEDI_CL_e_MF_KeyType; cdecl; overload;//Deprecated
    {class} function values: TJavaObjectArray<JGEDI_CL_e_MF_KeyType>; cdecl;//Deprecated
    {class} property KEY_A: JGEDI_CL_e_MF_KeyType read _GetKEY_A;
    {class} property KEY_B: JGEDI_CL_e_MF_KeyType read _GetKEY_B;
  end;

  [JavaSignature('br/com/gertec/gedi/enums/GEDI_CL_e_MF_KeyType')]
  JGEDI_CL_e_MF_KeyType = interface(JEnum)
    ['{F9B254AB-EFD5-453C-9EFC-F5B694858581}']
  end;
  TJGEDI_CL_e_MF_KeyType = class(TJavaGenericImport<JGEDI_CL_e_MF_KeyTypeClass, JGEDI_CL_e_MF_KeyType>) end;

  JGEDI_CL_e_MF_TypeClass = interface(JEnumClass)
    ['{E9CFE533-11A1-4539-A899-BB4288105BBD}']
    {class} function _GetCLASSIC_1K: JGEDI_CL_e_MF_Type; cdecl;
    {class} function _GetCLASSIC_4K: JGEDI_CL_e_MF_Type; cdecl;
    {class} function _GetDESFIRE: JGEDI_CL_e_MF_Type; cdecl;
    {class} function _GetMINI: JGEDI_CL_e_MF_Type; cdecl;
    {class} function _GetPLUS: JGEDI_CL_e_MF_Type; cdecl;
    {class} function _GetULTRALIGHT: JGEDI_CL_e_MF_Type; cdecl;
    {class} function _GetULTRALIGHT_C: JGEDI_CL_e_MF_Type; cdecl;
    {class} function _GetULTRALIGHT_EV1: JGEDI_CL_e_MF_Type; cdecl;
    {class} function _GetUNKNOWN: JGEDI_CL_e_MF_Type; cdecl;
    {class} function getValue: Integer; cdecl;//Deprecated
    {class} function valueOf(P1: Integer): JGEDI_CL_e_MF_Type; cdecl; overload;//Deprecated
    {class} function valueOf(P1: JString): JGEDI_CL_e_MF_Type; cdecl; overload;//Deprecated
    {class} function values: TJavaObjectArray<JGEDI_CL_e_MF_Type>; cdecl;//Deprecated
    {class} property CLASSIC_1K: JGEDI_CL_e_MF_Type read _GetCLASSIC_1K;
    {class} property CLASSIC_4K: JGEDI_CL_e_MF_Type read _GetCLASSIC_4K;
    {class} property DESFIRE: JGEDI_CL_e_MF_Type read _GetDESFIRE;
    {class} property MINI: JGEDI_CL_e_MF_Type read _GetMINI;
    {class} property PLUS: JGEDI_CL_e_MF_Type read _GetPLUS;
    {class} property ULTRALIGHT: JGEDI_CL_e_MF_Type read _GetULTRALIGHT;
    {class} property ULTRALIGHT_C: JGEDI_CL_e_MF_Type read _GetULTRALIGHT_C;
    {class} property ULTRALIGHT_EV1: JGEDI_CL_e_MF_Type read _GetULTRALIGHT_EV1;
    {class} property UNKNOWN: JGEDI_CL_e_MF_Type read _GetUNKNOWN;
  end;

  [JavaSignature('br/com/gertec/gedi/enums/GEDI_CL_e_MF_Type')]
  JGEDI_CL_e_MF_Type = interface(JEnum)
    ['{51061CB1-3D88-4E7A-8495-25F55F56176C}']
  end;
  TJGEDI_CL_e_MF_Type = class(TJavaGenericImport<JGEDI_CL_e_MF_TypeClass, JGEDI_CL_e_MF_Type>) end;

  JGEDI_CRYPT_e_OpClass = interface(JEnumClass)
    ['{EA89151B-AC05-4508-BE21-B6A17328C833}']
    {class} function _GetDECRYPTION: JGEDI_CRYPT_e_Op; cdecl;
    {class} function _GetENCRYPTION: JGEDI_CRYPT_e_Op; cdecl;
    {class} function getValue: Integer; cdecl;//Deprecated
    {class} function valueOf(P1: Integer): JGEDI_CRYPT_e_Op; cdecl; overload;//Deprecated
    {class} function valueOf(P1: JString): JGEDI_CRYPT_e_Op; cdecl; overload;//Deprecated
    {class} function values: TJavaObjectArray<JGEDI_CRYPT_e_Op>; cdecl;//Deprecated
    {class} property DECRYPTION: JGEDI_CRYPT_e_Op read _GetDECRYPTION;
    {class} property ENCRYPTION: JGEDI_CRYPT_e_Op read _GetENCRYPTION;
  end;

  [JavaSignature('br/com/gertec/gedi/enums/GEDI_CRYPT_e_Op')]
  JGEDI_CRYPT_e_Op = interface(JEnum)
    ['{7C1598B4-66C8-47D2-BA96-DB1A6AB5684A}']
  end;
  TJGEDI_CRYPT_e_Op = class(TJavaGenericImport<JGEDI_CRYPT_e_OpClass, JGEDI_CRYPT_e_Op>) end;

  JGEDI_FS_e_StorageClass = interface(JEnumClass)
    ['{4CCE2E19-FB38-461B-86E1-03EA2A4FA725}']
    {class} function _GetPRIVATE: JGEDI_FS_e_Storage; cdecl;
    {class} function _GetPUBLIC: JGEDI_FS_e_Storage; cdecl;
    {class} function _GetSD_CARD: JGEDI_FS_e_Storage; cdecl;
    {class} function _GetUSB_DISK: JGEDI_FS_e_Storage; cdecl;
    {class} function getValue: Integer; cdecl;//Deprecated
    {class} function valueOf(P1: JString): JGEDI_FS_e_Storage; cdecl;//Deprecated
    {class} function values: TJavaObjectArray<JGEDI_FS_e_Storage>; cdecl;//Deprecated
    {class} property &PRIVATE: JGEDI_FS_e_Storage read _GetPRIVATE;
    {class} property &PUBLIC: JGEDI_FS_e_Storage read _GetPUBLIC;
    {class} property SD_CARD: JGEDI_FS_e_Storage read _GetSD_CARD;
    {class} property USB_DISK: JGEDI_FS_e_Storage read _GetUSB_DISK;
  end;

  [JavaSignature('br/com/gertec/gedi/enums/GEDI_FS_e_Storage')]
  JGEDI_FS_e_Storage = interface(JEnum)
    ['{B7A85D29-84DB-46C2-9F5A-B4A0DA50EF94}']
  end;
  TJGEDI_FS_e_Storage = class(TJavaGenericImport<JGEDI_FS_e_StorageClass, JGEDI_FS_e_Storage>) end;

  JGEDI_INFO_e_ControlNumberClass = interface(JEnumClass)
    ['{8EEDE4E8-ABBC-4B61-807D-3D2939F1473F}']
    {class} function _GetCHASSIS: JGEDI_INFO_e_ControlNumber; cdecl;
    {class} function _GetSEAL: JGEDI_INFO_e_ControlNumber; cdecl;
    {class} function _GetSN: JGEDI_INFO_e_ControlNumber; cdecl;
    {class} function getValue: Integer; cdecl;//Deprecated
    {class} function valueOf(P1: Integer): JGEDI_INFO_e_ControlNumber; cdecl; overload;//Deprecated
    {class} function valueOf(P1: JString): JGEDI_INFO_e_ControlNumber; cdecl; overload;//Deprecated
    {class} function values: TJavaObjectArray<JGEDI_INFO_e_ControlNumber>; cdecl;//Deprecated
    {class} property CHASSIS: JGEDI_INFO_e_ControlNumber read _GetCHASSIS;
    {class} property SEAL: JGEDI_INFO_e_ControlNumber read _GetSEAL;
    {class} property SN: JGEDI_INFO_e_ControlNumber read _GetSN;
  end;

  [JavaSignature('br/com/gertec/gedi/enums/GEDI_INFO_e_ControlNumber')]
  JGEDI_INFO_e_ControlNumber = interface(JEnum)
    ['{5F7CC04D-98D6-446B-8104-0875D53E9030}']
  end;
  TJGEDI_INFO_e_ControlNumber = class(TJavaGenericImport<JGEDI_INFO_e_ControlNumberClass, JGEDI_INFO_e_ControlNumber>) end;

  JGEDI_INFO_e_TestClass = interface(JEnumClass)
    ['{D69C549E-257D-4B10-9678-9E2F4BE9EB12}']
    {class} function _GetBACKLIGHT_EXISTS: JGEDI_INFO_e_Test; cdecl;
    {class} function _GetBATTERY_SUPPORT: JGEDI_INFO_e_Test; cdecl;
    {class} function _GetBLUETOOTH_EXISTS: JGEDI_INFO_e_Test; cdecl;
    {class} function _GetBUZZER_EXISTS: JGEDI_INFO_e_Test; cdecl;
    {class} function _GetCOLOR_DISPLAY: JGEDI_INFO_e_Test; cdecl;
    {class} function _GetCONTACTLESS_EXISTS: JGEDI_INFO_e_Test; cdecl;
    {class} function _GetCONTACTLESS_LED_EXISTS: JGEDI_INFO_e_Test; cdecl;
    {class} function _GetCRADLE_ATTACHED: JGEDI_INFO_e_Test; cdecl;
    {class} function _GetDIAL_EXISTS: JGEDI_INFO_e_Test; cdecl;
    {class} function _GetETHERNET_EXISTS: JGEDI_INFO_e_Test; cdecl;
    {class} function _GetGSM_EXISTS: JGEDI_INFO_e_Test; cdecl;
    {class} function _GetIACP_SUPPORT: JGEDI_INFO_e_Test; cdecl;
    {class} function _GetKBD_EXISTS: JGEDI_INFO_e_Test; cdecl;
    {class} function _GetLCD_EXISTS: JGEDI_INFO_e_Test; cdecl;
    {class} function _GetMSR_EXISTS: JGEDI_INFO_e_Test; cdecl;
    {class} function _GetPCM_SUPPORT: JGEDI_INFO_e_Test; cdecl;
    {class} function _GetPRINTER_EXISTS: JGEDI_INFO_e_Test; cdecl;
    {class} function _GetRS232_EXISTS: JGEDI_INFO_e_Test; cdecl;
    {class} function _GetSMART_EXISTS: JGEDI_INFO_e_Test; cdecl;
    {class} function _GetSRED_REQUIRED: JGEDI_INFO_e_Test; cdecl;
    {class} function _GetTTF_SUPPORT: JGEDI_INFO_e_Test; cdecl;
    {class} function _GetUSB_EXISTS: JGEDI_INFO_e_Test; cdecl;
    {class} function _GetWIFI_EXISTS: JGEDI_INFO_e_Test; cdecl;
    {class} function getValue: Integer; cdecl;//Deprecated
    {class} function valueOf(P1: JString): JGEDI_INFO_e_Test; cdecl;//Deprecated
    {class} function values: TJavaObjectArray<JGEDI_INFO_e_Test>; cdecl;//Deprecated
    {class} property BACKLIGHT_EXISTS: JGEDI_INFO_e_Test read _GetBACKLIGHT_EXISTS;
    {class} property BATTERY_SUPPORT: JGEDI_INFO_e_Test read _GetBATTERY_SUPPORT;
    {class} property BLUETOOTH_EXISTS: JGEDI_INFO_e_Test read _GetBLUETOOTH_EXISTS;
    {class} property BUZZER_EXISTS: JGEDI_INFO_e_Test read _GetBUZZER_EXISTS;
    {class} property COLOR_DISPLAY: JGEDI_INFO_e_Test read _GetCOLOR_DISPLAY;
    {class} property CONTACTLESS_EXISTS: JGEDI_INFO_e_Test read _GetCONTACTLESS_EXISTS;
    {class} property CONTACTLESS_LED_EXISTS: JGEDI_INFO_e_Test read _GetCONTACTLESS_LED_EXISTS;
    {class} property CRADLE_ATTACHED: JGEDI_INFO_e_Test read _GetCRADLE_ATTACHED;
    {class} property DIAL_EXISTS: JGEDI_INFO_e_Test read _GetDIAL_EXISTS;
    {class} property ETHERNET_EXISTS: JGEDI_INFO_e_Test read _GetETHERNET_EXISTS;
    {class} property GSM_EXISTS: JGEDI_INFO_e_Test read _GetGSM_EXISTS;
    {class} property IACP_SUPPORT: JGEDI_INFO_e_Test read _GetIACP_SUPPORT;
    {class} property KBD_EXISTS: JGEDI_INFO_e_Test read _GetKBD_EXISTS;
    {class} property LCD_EXISTS: JGEDI_INFO_e_Test read _GetLCD_EXISTS;
    {class} property MSR_EXISTS: JGEDI_INFO_e_Test read _GetMSR_EXISTS;
    {class} property PCM_SUPPORT: JGEDI_INFO_e_Test read _GetPCM_SUPPORT;
    {class} property PRINTER_EXISTS: JGEDI_INFO_e_Test read _GetPRINTER_EXISTS;
    {class} property RS232_EXISTS: JGEDI_INFO_e_Test read _GetRS232_EXISTS;
    {class} property SMART_EXISTS: JGEDI_INFO_e_Test read _GetSMART_EXISTS;
    {class} property SRED_REQUIRED: JGEDI_INFO_e_Test read _GetSRED_REQUIRED;
    {class} property TTF_SUPPORT: JGEDI_INFO_e_Test read _GetTTF_SUPPORT;
    {class} property USB_EXISTS: JGEDI_INFO_e_Test read _GetUSB_EXISTS;
    {class} property WIFI_EXISTS: JGEDI_INFO_e_Test read _GetWIFI_EXISTS;
  end;

  [JavaSignature('br/com/gertec/gedi/enums/GEDI_INFO_e_Test')]
  JGEDI_INFO_e_Test = interface(JEnum)
    ['{7E3BF059-1CFC-4ACB-B68C-31A4A064F23A}']
  end;
  TJGEDI_INFO_e_Test = class(TJavaGenericImport<JGEDI_INFO_e_TestClass, JGEDI_INFO_e_Test>) end;

  JGEDI_KBD_e_KeyClass = interface(JEnumClass)
    ['{C9E81979-E916-4336-89B4-3111AA367DCD}']
    {class} function _GetASTERISK: JGEDI_KBD_e_Key; cdecl;
    {class} function _GetCANCEL: JGEDI_KBD_e_Key; cdecl;
    {class} function _GetCLEAR: JGEDI_KBD_e_Key; cdecl;
    {class} function _GetDOT: JGEDI_KBD_e_Key; cdecl;
    {class} function _GetDOWN: JGEDI_KBD_e_Key; cdecl;
    {class} function _GetENTER: JGEDI_KBD_e_Key; cdecl;
    {class} function _GetF1: JGEDI_KBD_e_Key; cdecl;
    {class} function _GetF2: JGEDI_KBD_e_Key; cdecl;
    {class} function _GetF3: JGEDI_KBD_e_Key; cdecl;
    {class} function _GetF4: JGEDI_KBD_e_Key; cdecl;
    {class} function _GetINVALID: JGEDI_KBD_e_Key; cdecl;
    {class} function _GetNONE: JGEDI_KBD_e_Key; cdecl;
    {class} function _GetNUM0: JGEDI_KBD_e_Key; cdecl;
    {class} function _GetNUM1: JGEDI_KBD_e_Key; cdecl;
    {class} function _GetNUM2: JGEDI_KBD_e_Key; cdecl;
    {class} function _GetNUM3: JGEDI_KBD_e_Key; cdecl;
    {class} function _GetNUM4: JGEDI_KBD_e_Key; cdecl;
    {class} function _GetNUM5: JGEDI_KBD_e_Key; cdecl;
    {class} function _GetNUM6: JGEDI_KBD_e_Key; cdecl;
    {class} function _GetNUM7: JGEDI_KBD_e_Key; cdecl;
    {class} function _GetNUM8: JGEDI_KBD_e_Key; cdecl;
    {class} function _GetNUM9: JGEDI_KBD_e_Key; cdecl;
    {class} function _GetPOWER: JGEDI_KBD_e_Key; cdecl;
    {class} function _GetSHIFT: JGEDI_KBD_e_Key; cdecl;
    {class} function _GetUNKNOWN: JGEDI_KBD_e_Key; cdecl;
    {class} function _GetUP: JGEDI_KBD_e_Key; cdecl;
    {class} function getValue: Integer; cdecl;//Deprecated
    {class} procedure setValue(P1: Integer); cdecl;//Deprecated
    {class} function valueOf(P1: Integer): JGEDI_KBD_e_Key; cdecl; overload;//Deprecated
    {class} function valueOf(P1: JString): JGEDI_KBD_e_Key; cdecl; overload;//Deprecated
    {class} function values: TJavaObjectArray<JGEDI_KBD_e_Key>; cdecl;//Deprecated
    {class} property ASTERISK: JGEDI_KBD_e_Key read _GetASTERISK;
    {class} property CANCEL: JGEDI_KBD_e_Key read _GetCANCEL;
    {class} property CLEAR: JGEDI_KBD_e_Key read _GetCLEAR;
    {class} property DOT: JGEDI_KBD_e_Key read _GetDOT;
    {class} property DOWN: JGEDI_KBD_e_Key read _GetDOWN;
    {class} property ENTER: JGEDI_KBD_e_Key read _GetENTER;
    {class} property F1: JGEDI_KBD_e_Key read _GetF1;
    {class} property F2: JGEDI_KBD_e_Key read _GetF2;
    {class} property F3: JGEDI_KBD_e_Key read _GetF3;
    {class} property F4: JGEDI_KBD_e_Key read _GetF4;
    {class} property INVALID: JGEDI_KBD_e_Key read _GetINVALID;
    {class} property NONE: JGEDI_KBD_e_Key read _GetNONE;
    {class} property NUM0: JGEDI_KBD_e_Key read _GetNUM0;
    {class} property NUM1: JGEDI_KBD_e_Key read _GetNUM1;
    {class} property NUM2: JGEDI_KBD_e_Key read _GetNUM2;
    {class} property NUM3: JGEDI_KBD_e_Key read _GetNUM3;
    {class} property NUM4: JGEDI_KBD_e_Key read _GetNUM4;
    {class} property NUM5: JGEDI_KBD_e_Key read _GetNUM5;
    {class} property NUM6: JGEDI_KBD_e_Key read _GetNUM6;
    {class} property NUM7: JGEDI_KBD_e_Key read _GetNUM7;
    {class} property NUM8: JGEDI_KBD_e_Key read _GetNUM8;
    {class} property NUM9: JGEDI_KBD_e_Key read _GetNUM9;
    {class} property POWER: JGEDI_KBD_e_Key read _GetPOWER;
    {class} property SHIFT: JGEDI_KBD_e_Key read _GetSHIFT;
    {class} property UNKNOWN: JGEDI_KBD_e_Key read _GetUNKNOWN;
    {class} property UP: JGEDI_KBD_e_Key read _GetUP;
  end;

  [JavaSignature('br/com/gertec/gedi/enums/GEDI_KBD_e_Key')]
  JGEDI_KBD_e_Key = interface(JEnum)
    ['{B86917F1-389E-412A-9550-AA1E26E6D717}']
  end;
  TJGEDI_KBD_e_Key = class(TJavaGenericImport<JGEDI_KBD_e_KeyClass, JGEDI_KBD_e_Key>) end;

  JGEDI_KBD_e_PowerKeyModeClass = interface(JEnumClass)
    ['{8BC35256-A2F1-42F5-B4E2-D2A710780735}']
    {class} function _GetPOWEROFF: JGEDI_KBD_e_PowerKeyMode; cdecl;
    {class} function _GetRESET: JGEDI_KBD_e_PowerKeyMode; cdecl;
    {class} function getValue: Integer; cdecl;//Deprecated
    {class} function valueOf(P1: JString): JGEDI_KBD_e_PowerKeyMode; cdecl;//Deprecated
    {class} function values: TJavaObjectArray<JGEDI_KBD_e_PowerKeyMode>; cdecl;//Deprecated
    {class} property POWEROFF: JGEDI_KBD_e_PowerKeyMode read _GetPOWEROFF;
    {class} property RESET: JGEDI_KBD_e_PowerKeyMode read _GetRESET;
  end;

  [JavaSignature('br/com/gertec/gedi/enums/GEDI_KBD_e_PowerKeyMode')]
  JGEDI_KBD_e_PowerKeyMode = interface(JEnum)
    ['{A529BFD9-5B6D-4D65-8AE4-3F4427F2397A}']
  end;
  TJGEDI_KBD_e_PowerKeyMode = class(TJavaGenericImport<JGEDI_KBD_e_PowerKeyModeClass, JGEDI_KBD_e_PowerKeyMode>) end;

  JGEDI_KMS_e_BLOCKTYPEClass = interface(JEnumClass)
    ['{67583787-4242-4184-94AA-ADF530C437CE}']
    {class} function _GetANSI_0: JGEDI_KMS_e_BLOCKTYPE; cdecl;
    {class} function _GetANSI_1: JGEDI_KMS_e_BLOCKTYPE; cdecl;
    {class} function _GetAS2805_1: JGEDI_KMS_e_BLOCKTYPE; cdecl;
    {class} function _GetAS2805_8: JGEDI_KMS_e_BLOCKTYPE; cdecl;
    {class} function _GetBANKSYS: JGEDI_KMS_e_BLOCKTYPE; cdecl;
    {class} function _GetBBB_16: JGEDI_KMS_e_BLOCKTYPE; cdecl;
    {class} function _GetCEF_0: JGEDI_KMS_e_BLOCKTYPE; cdecl;
    {class} function _GetCEF_1: JGEDI_KMS_e_BLOCKTYPE; cdecl;
    {class} function _GetCEF_CID: JGEDI_KMS_e_BLOCKTYPE; cdecl;
    {class} function _GetCEF_PWR: JGEDI_KMS_e_BLOCKTYPE; cdecl;
    {class} function _GetDIEBOLD: JGEDI_KMS_e_BLOCKTYPE; cdecl;
    {class} function _GetDIEBOLD_CN: JGEDI_KMS_e_BLOCKTYPE; cdecl;
    {class} function _GetDOCUTEL: JGEDI_KMS_e_BLOCKTYPE; cdecl;
    {class} function _GetDOCUTEL_2: JGEDI_KMS_e_BLOCKTYPE; cdecl;
    {class} function _GetECI_1: JGEDI_KMS_e_BLOCKTYPE; cdecl;
    {class} function _GetECI_2: JGEDI_KMS_e_BLOCKTYPE; cdecl;
    {class} function _GetECI_3: JGEDI_KMS_e_BLOCKTYPE; cdecl;
    {class} function _GetECI_4: JGEDI_KMS_e_BLOCKTYPE; cdecl;
    {class} function _GetGERTEC_0: JGEDI_KMS_e_BLOCKTYPE; cdecl;
    {class} function _GetGERTEC_1: JGEDI_KMS_e_BLOCKTYPE; cdecl;
    {class} function _GetIBM_3621: JGEDI_KMS_e_BLOCKTYPE; cdecl;
    {class} function _GetIBM_3624: JGEDI_KMS_e_BLOCKTYPE; cdecl;
    {class} function _GetIBM_4704: JGEDI_KMS_e_BLOCKTYPE; cdecl;
    {class} function _GetIBM_5906: JGEDI_KMS_e_BLOCKTYPE; cdecl;
    {class} function _GetISO_0: JGEDI_KMS_e_BLOCKTYPE; cdecl;
    {class} function _GetISO_1: JGEDI_KMS_e_BLOCKTYPE; cdecl;
    {class} function _GetISO_2: JGEDI_KMS_e_BLOCKTYPE; cdecl;
    {class} function _GetISO_3: JGEDI_KMS_e_BLOCKTYPE; cdecl;
    {class} function _GetISO_4: JGEDI_KMS_e_BLOCKTYPE; cdecl;
    {class} function _GetNCR: JGEDI_KMS_e_BLOCKTYPE; cdecl;
    {class} function _GetOEM_1: JGEDI_KMS_e_BLOCKTYPE; cdecl;
    {class} function _GetVISA_1: JGEDI_KMS_e_BLOCKTYPE; cdecl;
    {class} function _GetVISA_2: JGEDI_KMS_e_BLOCKTYPE; cdecl;
    {class} function _GetVISA_3: JGEDI_KMS_e_BLOCKTYPE; cdecl;
    {class} function _GetVISA_4: JGEDI_KMS_e_BLOCKTYPE; cdecl;
    {class} function getValue: Integer; cdecl;//Deprecated
    {class} function valueOf(P1: Integer): JGEDI_KMS_e_BLOCKTYPE; cdecl; overload;//Deprecated
    {class} function valueOf(P1: JString): JGEDI_KMS_e_BLOCKTYPE; cdecl; overload;//Deprecated
    {class} function values: TJavaObjectArray<JGEDI_KMS_e_BLOCKTYPE>; cdecl;//Deprecated
    {class} property ANSI_0: JGEDI_KMS_e_BLOCKTYPE read _GetANSI_0;
    {class} property ANSI_1: JGEDI_KMS_e_BLOCKTYPE read _GetANSI_1;
    {class} property AS2805_1: JGEDI_KMS_e_BLOCKTYPE read _GetAS2805_1;
    {class} property AS2805_8: JGEDI_KMS_e_BLOCKTYPE read _GetAS2805_8;
    {class} property BANKSYS: JGEDI_KMS_e_BLOCKTYPE read _GetBANKSYS;
    {class} property BBB_16: JGEDI_KMS_e_BLOCKTYPE read _GetBBB_16;
    {class} property CEF_0: JGEDI_KMS_e_BLOCKTYPE read _GetCEF_0;
    {class} property CEF_1: JGEDI_KMS_e_BLOCKTYPE read _GetCEF_1;
    {class} property CEF_CID: JGEDI_KMS_e_BLOCKTYPE read _GetCEF_CID;
    {class} property CEF_PWR: JGEDI_KMS_e_BLOCKTYPE read _GetCEF_PWR;
    {class} property DIEBOLD: JGEDI_KMS_e_BLOCKTYPE read _GetDIEBOLD;
    {class} property DIEBOLD_CN: JGEDI_KMS_e_BLOCKTYPE read _GetDIEBOLD_CN;
    {class} property DOCUTEL: JGEDI_KMS_e_BLOCKTYPE read _GetDOCUTEL;
    {class} property DOCUTEL_2: JGEDI_KMS_e_BLOCKTYPE read _GetDOCUTEL_2;
    {class} property ECI_1: JGEDI_KMS_e_BLOCKTYPE read _GetECI_1;
    {class} property ECI_2: JGEDI_KMS_e_BLOCKTYPE read _GetECI_2;
    {class} property ECI_3: JGEDI_KMS_e_BLOCKTYPE read _GetECI_3;
    {class} property ECI_4: JGEDI_KMS_e_BLOCKTYPE read _GetECI_4;
    {class} property GERTEC_0: JGEDI_KMS_e_BLOCKTYPE read _GetGERTEC_0;
    {class} property GERTEC_1: JGEDI_KMS_e_BLOCKTYPE read _GetGERTEC_1;
    {class} property IBM_3621: JGEDI_KMS_e_BLOCKTYPE read _GetIBM_3621;
    {class} property IBM_3624: JGEDI_KMS_e_BLOCKTYPE read _GetIBM_3624;
    {class} property IBM_4704: JGEDI_KMS_e_BLOCKTYPE read _GetIBM_4704;
    {class} property IBM_5906: JGEDI_KMS_e_BLOCKTYPE read _GetIBM_5906;
    {class} property ISO_0: JGEDI_KMS_e_BLOCKTYPE read _GetISO_0;
    {class} property ISO_1: JGEDI_KMS_e_BLOCKTYPE read _GetISO_1;
    {class} property ISO_2: JGEDI_KMS_e_BLOCKTYPE read _GetISO_2;
    {class} property ISO_3: JGEDI_KMS_e_BLOCKTYPE read _GetISO_3;
    {class} property ISO_4: JGEDI_KMS_e_BLOCKTYPE read _GetISO_4;
    {class} property NCR: JGEDI_KMS_e_BLOCKTYPE read _GetNCR;
    {class} property OEM_1: JGEDI_KMS_e_BLOCKTYPE read _GetOEM_1;
    {class} property VISA_1: JGEDI_KMS_e_BLOCKTYPE read _GetVISA_1;
    {class} property VISA_2: JGEDI_KMS_e_BLOCKTYPE read _GetVISA_2;
    {class} property VISA_3: JGEDI_KMS_e_BLOCKTYPE read _GetVISA_3;
    {class} property VISA_4: JGEDI_KMS_e_BLOCKTYPE read _GetVISA_4;
  end;

  [JavaSignature('br/com/gertec/gedi/enums/GEDI_KMS_e_BLOCKTYPE')]
  JGEDI_KMS_e_BLOCKTYPE = interface(JEnum)
    ['{758C6556-91C7-4640-9C3E-7DD3B535AEAC}']
  end;
  TJGEDI_KMS_e_BLOCKTYPE = class(TJavaGenericImport<JGEDI_KMS_e_BLOCKTYPEClass, JGEDI_KMS_e_BLOCKTYPE>) end;

  JGEDI_KMS_e_EncModeClass = interface(JEnumClass)
    ['{6A6C436D-F4BC-4656-9533-78B28271D197}']
    {class} function _GetCBC: JGEDI_KMS_e_EncMode; cdecl;
    {class} function _GetCBC_3DUKPT_P1: JGEDI_KMS_e_EncMode; cdecl;
    {class} function _GetCBC_3DUKPT_P2: JGEDI_KMS_e_EncMode; cdecl;
    {class} function _GetCBC_3DUKPT_P3: JGEDI_KMS_e_EncMode; cdecl;
    {class} function _GetCBC_3DUKPT_P4: JGEDI_KMS_e_EncMode; cdecl;
    {class} function _GetCBC_3DUKPT_P5: JGEDI_KMS_e_EncMode; cdecl;
    {class} function _GetECB: JGEDI_KMS_e_EncMode; cdecl;
    {class} function _GetECB_3DUKPT_P1: JGEDI_KMS_e_EncMode; cdecl;
    {class} function _GetECB_3DUKPT_P2: JGEDI_KMS_e_EncMode; cdecl;
    {class} function _GetECB_3DUKPT_P3: JGEDI_KMS_e_EncMode; cdecl;
    {class} function _GetECB_3DUKPT_P4: JGEDI_KMS_e_EncMode; cdecl;
    {class} function _GetECB_3DUKPT_P5: JGEDI_KMS_e_EncMode; cdecl;
    {class} function getValue: Integer; cdecl;//Deprecated
    {class} function valueOf(P1: Integer): JGEDI_KMS_e_EncMode; cdecl; overload;//Deprecated
    {class} function valueOf(P1: JString): JGEDI_KMS_e_EncMode; cdecl; overload;//Deprecated
    {class} function values: TJavaObjectArray<JGEDI_KMS_e_EncMode>; cdecl;//Deprecated
    {class} property CBC: JGEDI_KMS_e_EncMode read _GetCBC;
    {class} property CBC_3DUKPT_P1: JGEDI_KMS_e_EncMode read _GetCBC_3DUKPT_P1;
    {class} property CBC_3DUKPT_P2: JGEDI_KMS_e_EncMode read _GetCBC_3DUKPT_P2;
    {class} property CBC_3DUKPT_P3: JGEDI_KMS_e_EncMode read _GetCBC_3DUKPT_P3;
    {class} property CBC_3DUKPT_P4: JGEDI_KMS_e_EncMode read _GetCBC_3DUKPT_P4;
    {class} property CBC_3DUKPT_P5: JGEDI_KMS_e_EncMode read _GetCBC_3DUKPT_P5;
    {class} property ECB: JGEDI_KMS_e_EncMode read _GetECB;
    {class} property ECB_3DUKPT_P1: JGEDI_KMS_e_EncMode read _GetECB_3DUKPT_P1;
    {class} property ECB_3DUKPT_P2: JGEDI_KMS_e_EncMode read _GetECB_3DUKPT_P2;
    {class} property ECB_3DUKPT_P3: JGEDI_KMS_e_EncMode read _GetECB_3DUKPT_P3;
    {class} property ECB_3DUKPT_P4: JGEDI_KMS_e_EncMode read _GetECB_3DUKPT_P4;
    {class} property ECB_3DUKPT_P5: JGEDI_KMS_e_EncMode read _GetECB_3DUKPT_P5;
  end;

  [JavaSignature('br/com/gertec/gedi/enums/GEDI_KMS_e_EncMode')]
  JGEDI_KMS_e_EncMode = interface(JEnum)
    ['{9099B278-AC55-4A96-BC2A-8CEB4A85BC2D}']
  end;
  TJGEDI_KMS_e_EncMode = class(TJavaGenericImport<JGEDI_KMS_e_EncModeClass, JGEDI_KMS_e_EncMode>) end;

  JGEDI_KMS_e_KEYPURPOSEClass = interface(JEnumClass)
    ['{F24B1414-6E6E-4A8A-A883-1FAFD015EA0D}']
    {class} function _GetAUTH: JGEDI_KMS_e_KEYPURPOSE; cdecl;
    {class} function _GetDATA: JGEDI_KMS_e_KEYPURPOSE; cdecl;
    {class} function _GetKEK: JGEDI_KMS_e_KEYPURPOSE; cdecl;
    {class} function _GetPIN: JGEDI_KMS_e_KEYPURPOSE; cdecl;
    {class} function _GetSRED: JGEDI_KMS_e_KEYPURPOSE; cdecl;
    {class} function getValue: Integer; cdecl;//Deprecated
    {class} function valueOf(P1: Integer): JGEDI_KMS_e_KEYPURPOSE; cdecl; overload;//Deprecated
    {class} function valueOf(P1: JString): JGEDI_KMS_e_KEYPURPOSE; cdecl; overload;//Deprecated
    {class} function values: TJavaObjectArray<JGEDI_KMS_e_KEYPURPOSE>; cdecl;//Deprecated
    {class} property AUTH: JGEDI_KMS_e_KEYPURPOSE read _GetAUTH;
    {class} property DATA: JGEDI_KMS_e_KEYPURPOSE read _GetDATA;
    {class} property KEK: JGEDI_KMS_e_KEYPURPOSE read _GetKEK;
    {class} property PIN: JGEDI_KMS_e_KEYPURPOSE read _GetPIN;
    {class} property SRED: JGEDI_KMS_e_KEYPURPOSE read _GetSRED;
  end;

  [JavaSignature('br/com/gertec/gedi/enums/GEDI_KMS_e_KEYPURPOSE')]
  JGEDI_KMS_e_KEYPURPOSE = interface(JEnum)
    ['{8A6A7441-9F92-4394-99AA-F0A685AF4DE9}']
  end;
  TJGEDI_KMS_e_KEYPURPOSE = class(TJavaGenericImport<JGEDI_KMS_e_KEYPURPOSEClass, JGEDI_KMS_e_KEYPURPOSE>) end;

  JGEDI_KMS_e_KEYTYPEClass = interface(JEnumClass)
    ['{507389E3-0DC6-4873-80BC-E8544D5AC7C0}']
    {class} function _GetAES: JGEDI_KMS_e_KEYTYPE; cdecl;
    {class} function _GetDES: JGEDI_KMS_e_KEYTYPE; cdecl;
    {class} function _GetDUKPT_DES: JGEDI_KMS_e_KEYTYPE; cdecl;
    {class} function _GetDUKPT_TDES: JGEDI_KMS_e_KEYTYPE; cdecl;
    {class} function _GetRSA: JGEDI_KMS_e_KEYTYPE; cdecl;
    {class} function _GetTDES: JGEDI_KMS_e_KEYTYPE; cdecl;
    {class} function getValue: Integer; cdecl;//Deprecated
    {class} function valueOf(P1: Integer): JGEDI_KMS_e_KEYTYPE; cdecl; overload;//Deprecated
    {class} function valueOf(P1: JString): JGEDI_KMS_e_KEYTYPE; cdecl; overload;//Deprecated
    {class} function values: TJavaObjectArray<JGEDI_KMS_e_KEYTYPE>; cdecl;//Deprecated
    {class} property AES: JGEDI_KMS_e_KEYTYPE read _GetAES;
    {class} property DES: JGEDI_KMS_e_KEYTYPE read _GetDES;
    {class} property DUKPT_DES: JGEDI_KMS_e_KEYTYPE read _GetDUKPT_DES;
    {class} property DUKPT_TDES: JGEDI_KMS_e_KEYTYPE read _GetDUKPT_TDES;
    {class} property RSA: JGEDI_KMS_e_KEYTYPE read _GetRSA;
    {class} property TDES: JGEDI_KMS_e_KEYTYPE read _GetTDES;
  end;

  [JavaSignature('br/com/gertec/gedi/enums/GEDI_KMS_e_KEYTYPE')]
  JGEDI_KMS_e_KEYTYPE = interface(JEnum)
    ['{32310040-82C9-4E8C-8037-DD4AEA42E50B}']
  end;
  TJGEDI_KMS_e_KEYTYPE = class(TJavaGenericImport<JGEDI_KMS_e_KEYTYPEClass, JGEDI_KMS_e_KEYTYPE>) end;

  JGEDI_KMS_e_KEYTYPE_LENGTHClass = interface(JEnumClass)
    ['{D8124171-646F-40A4-B072-1C53A5796251}']
    {class} function _GetAES16: JGEDI_KMS_e_KEYTYPE_LENGTH; cdecl;
    {class} function _GetAES32: JGEDI_KMS_e_KEYTYPE_LENGTH; cdecl;
    {class} function _GetDES: JGEDI_KMS_e_KEYTYPE_LENGTH; cdecl;
    {class} function _GetDUKPT3DES16: JGEDI_KMS_e_KEYTYPE_LENGTH; cdecl;
    {class} function _GetDUKPT3DES24: JGEDI_KMS_e_KEYTYPE_LENGTH; cdecl;
    {class} function _GetDUKPTDES8: JGEDI_KMS_e_KEYTYPE_LENGTH; cdecl;
    {class} function _GetTRIDES16: JGEDI_KMS_e_KEYTYPE_LENGTH; cdecl;
    {class} function _GetTRIDES24: JGEDI_KMS_e_KEYTYPE_LENGTH; cdecl;
    {class} function getValue: Integer; cdecl;//Deprecated
    {class} function valueOf(P1: JString): JGEDI_KMS_e_KEYTYPE_LENGTH; cdecl;//Deprecated
    {class} function values: TJavaObjectArray<JGEDI_KMS_e_KEYTYPE_LENGTH>; cdecl;//Deprecated
    {class} property AES16: JGEDI_KMS_e_KEYTYPE_LENGTH read _GetAES16;
    {class} property AES32: JGEDI_KMS_e_KEYTYPE_LENGTH read _GetAES32;
    {class} property DES: JGEDI_KMS_e_KEYTYPE_LENGTH read _GetDES;
    {class} property DUKPT3DES16: JGEDI_KMS_e_KEYTYPE_LENGTH read _GetDUKPT3DES16;
    {class} property DUKPT3DES24: JGEDI_KMS_e_KEYTYPE_LENGTH read _GetDUKPT3DES24;
    {class} property DUKPTDES8: JGEDI_KMS_e_KEYTYPE_LENGTH read _GetDUKPTDES8;
    {class} property TRIDES16: JGEDI_KMS_e_KEYTYPE_LENGTH read _GetTRIDES16;
    {class} property TRIDES24: JGEDI_KMS_e_KEYTYPE_LENGTH read _GetTRIDES24;
  end;

  [JavaSignature('br/com/gertec/gedi/enums/GEDI_KMS_e_KEYTYPE_LENGTH')]
  JGEDI_KMS_e_KEYTYPE_LENGTH = interface(JEnum)
    ['{57F257CE-5DC6-46AB-899E-1CA9371A40B8}']
  end;
  TJGEDI_KMS_e_KEYTYPE_LENGTH = class(TJavaGenericImport<JGEDI_KMS_e_KEYTYPE_LENGTHClass, JGEDI_KMS_e_KEYTYPE_LENGTH>) end;

  JGEDI_KMS_e_OPClass = interface(JEnumClass)
    ['{7E7827CC-256A-4292-90E7-5E5CFEF2CA67}']
    {class} function _GetDECRYPT: JGEDI_KMS_e_OP; cdecl;
    {class} function _GetENCRYPT: JGEDI_KMS_e_OP; cdecl;
    {class} function getValue: Integer; cdecl;//Deprecated
    {class} function valueOf(P1: Integer): JGEDI_KMS_e_OP; cdecl; overload;//Deprecated
    {class} function valueOf(P1: JString): JGEDI_KMS_e_OP; cdecl; overload;//Deprecated
    {class} function values: TJavaObjectArray<JGEDI_KMS_e_OP>; cdecl;//Deprecated
    {class} property DECRYPT: JGEDI_KMS_e_OP read _GetDECRYPT;
    {class} property ENCRYPT: JGEDI_KMS_e_OP read _GetENCRYPT;
  end;

  [JavaSignature('br/com/gertec/gedi/enums/GEDI_KMS_e_OP')]
  JGEDI_KMS_e_OP = interface(JEnum)
    ['{AC0D29E7-15B5-4A04-9889-E4993E96D194}']
  end;
  TJGEDI_KMS_e_OP = class(TJavaGenericImport<JGEDI_KMS_e_OPClass, JGEDI_KMS_e_OP>) end;

  JGEDI_LED_e_IdClass = interface(JEnumClass)
    ['{4D0D26AE-EE9E-4E9B-8120-5F6E0E1D4BBF}']
    {class} function _GetGEDI_LED_ID_1: JGEDI_LED_e_Id; cdecl;
    {class} function _GetGEDI_LED_ID_2: JGEDI_LED_e_Id; cdecl;
    {class} function _GetGEDI_LED_ID_3: JGEDI_LED_e_Id; cdecl;
    {class} function _GetGEDI_LED_ID_BACKLIGHT_1: JGEDI_LED_e_Id; cdecl;
    {class} function _GetGEDI_LED_ID_BACKLIGHT_2: JGEDI_LED_e_Id; cdecl;
    {class} function _GetGEDI_LED_ID_BACKLIGHT_DISPLAY: JGEDI_LED_e_Id; cdecl;
    {class} function _GetGEDI_LED_ID_BACKLIGHT_KEYBOARD: JGEDI_LED_e_Id; cdecl;
    {class} function _GetGEDI_LED_ID_BLUE: JGEDI_LED_e_Id; cdecl;
    {class} function _GetGEDI_LED_ID_CONTACTLESS_1: JGEDI_LED_e_Id; cdecl;
    {class} function _GetGEDI_LED_ID_CONTACTLESS_2: JGEDI_LED_e_Id; cdecl;
    {class} function _GetGEDI_LED_ID_CONTACTLESS_3: JGEDI_LED_e_Id; cdecl;
    {class} function _GetGEDI_LED_ID_CONTACTLESS_4: JGEDI_LED_e_Id; cdecl;
    {class} function _GetGEDI_LED_ID_CONTACTLESS_BLUE: JGEDI_LED_e_Id; cdecl;
    {class} function _GetGEDI_LED_ID_CONTACTLESS_GREEN: JGEDI_LED_e_Id; cdecl;
    {class} function _GetGEDI_LED_ID_CONTACTLESS_ORANGE: JGEDI_LED_e_Id; cdecl;
    {class} function _GetGEDI_LED_ID_CONTACTLESS_RED: JGEDI_LED_e_Id; cdecl;
    {class} function _GetGEDI_LED_ID_GREEN: JGEDI_LED_e_Id; cdecl;
    {class} function _GetGEDI_LED_ID_MAIN: JGEDI_LED_e_Id; cdecl;
    {class} function _GetGEDI_LED_ID_ORANGE: JGEDI_LED_e_Id; cdecl;
    {class} function _GetGEDI_LED_ID_RED: JGEDI_LED_e_Id; cdecl;
    {class} function getValue: Integer; cdecl;//Deprecated
    {class} function valueOf(P1: Integer): JGEDI_LED_e_Id; cdecl; overload;//Deprecated
    {class} function valueOf(P1: JString): JGEDI_LED_e_Id; cdecl; overload;//Deprecated
    {class} function values: TJavaObjectArray<JGEDI_LED_e_Id>; cdecl;//Deprecated
    {class} property GEDI_LED_ID_1: JGEDI_LED_e_Id read _GetGEDI_LED_ID_1;
    {class} property GEDI_LED_ID_2: JGEDI_LED_e_Id read _GetGEDI_LED_ID_2;
    {class} property GEDI_LED_ID_3: JGEDI_LED_e_Id read _GetGEDI_LED_ID_3;
    {class} property GEDI_LED_ID_BACKLIGHT_1: JGEDI_LED_e_Id read _GetGEDI_LED_ID_BACKLIGHT_1;
    {class} property GEDI_LED_ID_BACKLIGHT_2: JGEDI_LED_e_Id read _GetGEDI_LED_ID_BACKLIGHT_2;
    {class} property GEDI_LED_ID_BACKLIGHT_DISPLAY: JGEDI_LED_e_Id read _GetGEDI_LED_ID_BACKLIGHT_DISPLAY;
    {class} property GEDI_LED_ID_BACKLIGHT_KEYBOARD: JGEDI_LED_e_Id read _GetGEDI_LED_ID_BACKLIGHT_KEYBOARD;
    {class} property GEDI_LED_ID_BLUE: JGEDI_LED_e_Id read _GetGEDI_LED_ID_BLUE;
    {class} property GEDI_LED_ID_CONTACTLESS_1: JGEDI_LED_e_Id read _GetGEDI_LED_ID_CONTACTLESS_1;
    {class} property GEDI_LED_ID_CONTACTLESS_2: JGEDI_LED_e_Id read _GetGEDI_LED_ID_CONTACTLESS_2;
    {class} property GEDI_LED_ID_CONTACTLESS_3: JGEDI_LED_e_Id read _GetGEDI_LED_ID_CONTACTLESS_3;
    {class} property GEDI_LED_ID_CONTACTLESS_4: JGEDI_LED_e_Id read _GetGEDI_LED_ID_CONTACTLESS_4;
    {class} property GEDI_LED_ID_CONTACTLESS_BLUE: JGEDI_LED_e_Id read _GetGEDI_LED_ID_CONTACTLESS_BLUE;
    {class} property GEDI_LED_ID_CONTACTLESS_GREEN: JGEDI_LED_e_Id read _GetGEDI_LED_ID_CONTACTLESS_GREEN;
    {class} property GEDI_LED_ID_CONTACTLESS_ORANGE: JGEDI_LED_e_Id read _GetGEDI_LED_ID_CONTACTLESS_ORANGE;
    {class} property GEDI_LED_ID_CONTACTLESS_RED: JGEDI_LED_e_Id read _GetGEDI_LED_ID_CONTACTLESS_RED;
    {class} property GEDI_LED_ID_GREEN: JGEDI_LED_e_Id read _GetGEDI_LED_ID_GREEN;
    {class} property GEDI_LED_ID_MAIN: JGEDI_LED_e_Id read _GetGEDI_LED_ID_MAIN;
    {class} property GEDI_LED_ID_ORANGE: JGEDI_LED_e_Id read _GetGEDI_LED_ID_ORANGE;
    {class} property GEDI_LED_ID_RED: JGEDI_LED_e_Id read _GetGEDI_LED_ID_RED;
  end;

  [JavaSignature('br/com/gertec/gedi/enums/GEDI_LED_e_Id')]
  JGEDI_LED_e_Id = interface(JEnum)
    ['{67CA64B7-97D4-4173-977C-F369B51BDD93}']
  end;
  TJGEDI_LED_e_Id = class(TJavaGenericImport<JGEDI_LED_e_IdClass, JGEDI_LED_e_Id>) end;

  JGEDI_MSR_e_StatusClass = interface(JEnumClass)
    ['{F33B98AC-2456-4FD9-9143-4F8DC5F9EAA8}']
    {class} function _GetABSENT_TRACK: JGEDI_MSR_e_Status; cdecl;
    {class} function _GetBUF_OVERFLOW: JGEDI_MSR_e_Status; cdecl;
    {class} function _GetETX_NOT_FOUND: JGEDI_MSR_e_Status; cdecl;
    {class} function _GetLRC_ERR: JGEDI_MSR_e_Status; cdecl;
    {class} function _GetLRC_NOT_FOUND: JGEDI_MSR_e_Status; cdecl;
    {class} function _GetNO_DATA: JGEDI_MSR_e_Status; cdecl;
    {class} function _GetSTX_NOT_FOUND: JGEDI_MSR_e_Status; cdecl;
    {class} function _GetSUCCESS: JGEDI_MSR_e_Status; cdecl;
    {class} function _GetUNKNOWN_CHAR: JGEDI_MSR_e_Status; cdecl;
    {class} function getValue: Integer; cdecl;//Deprecated
    {class} function valueOf(P1: Integer): JGEDI_MSR_e_Status; cdecl; overload;//Deprecated
    {class} function valueOf(P1: JString): JGEDI_MSR_e_Status; cdecl; overload;//Deprecated
    {class} function values: TJavaObjectArray<JGEDI_MSR_e_Status>; cdecl;//Deprecated
    {class} property ABSENT_TRACK: JGEDI_MSR_e_Status read _GetABSENT_TRACK;
    {class} property BUF_OVERFLOW: JGEDI_MSR_e_Status read _GetBUF_OVERFLOW;
    {class} property ETX_NOT_FOUND: JGEDI_MSR_e_Status read _GetETX_NOT_FOUND;
    {class} property LRC_ERR: JGEDI_MSR_e_Status read _GetLRC_ERR;
    {class} property LRC_NOT_FOUND: JGEDI_MSR_e_Status read _GetLRC_NOT_FOUND;
    {class} property NO_DATA: JGEDI_MSR_e_Status read _GetNO_DATA;
    {class} property STX_NOT_FOUND: JGEDI_MSR_e_Status read _GetSTX_NOT_FOUND;
    {class} property SUCCESS: JGEDI_MSR_e_Status read _GetSUCCESS;
    {class} property UNKNOWN_CHAR: JGEDI_MSR_e_Status read _GetUNKNOWN_CHAR;
  end;

  [JavaSignature('br/com/gertec/gedi/enums/GEDI_MSR_e_Status')]
  JGEDI_MSR_e_Status = interface(JEnum)
    ['{2344350C-81BF-4C42-85AA-58FA193EEC50}']
  end;
  TJGEDI_MSR_e_Status = class(TJavaGenericImport<JGEDI_MSR_e_StatusClass, JGEDI_MSR_e_Status>) end;

  JGEDI_PRNTR_e_AlignmentClass = interface(JEnumClass)
    ['{19F5420C-DD9C-4011-BC48-5C4CCAB16948}']
    {class} function _GetCENTER: JGEDI_PRNTR_e_Alignment; cdecl;
    {class} function _GetLEFT: JGEDI_PRNTR_e_Alignment; cdecl;
    {class} function _GetRIGHT: JGEDI_PRNTR_e_Alignment; cdecl;
    {class} function getValue: Integer; cdecl;//Deprecated
    {class} function valueOf(P1: Integer): JGEDI_PRNTR_e_Alignment; cdecl; overload;//Deprecated
    {class} function valueOf(P1: JString): JGEDI_PRNTR_e_Alignment; cdecl; overload;//Deprecated
    {class} function values: TJavaObjectArray<JGEDI_PRNTR_e_Alignment>; cdecl;//Deprecated
    {class} property CENTER: JGEDI_PRNTR_e_Alignment read _GetCENTER;
    {class} property LEFT: JGEDI_PRNTR_e_Alignment read _GetLEFT;
    {class} property RIGHT: JGEDI_PRNTR_e_Alignment read _GetRIGHT;
  end;

  [JavaSignature('br/com/gertec/gedi/enums/GEDI_PRNTR_e_Alignment')]
  JGEDI_PRNTR_e_Alignment = interface(JEnum)
    ['{F6BBA063-B7D5-4A09-963D-CE95580A6F74}']
  end;
  TJGEDI_PRNTR_e_Alignment = class(TJavaGenericImport<JGEDI_PRNTR_e_AlignmentClass, JGEDI_PRNTR_e_Alignment>) end;

  JGEDI_PRNTR_e_BarCodeTypeClass = interface(JEnumClass)
    ['{647C2362-0C1D-4F71-8CFF-22DE8E2CE5A0}']
    {class} function _GetAZTEC: JGEDI_PRNTR_e_BarCodeType; cdecl;
    {class} function _GetCODABAR: JGEDI_PRNTR_e_BarCodeType; cdecl;
    {class} function _GetCODE_128: JGEDI_PRNTR_e_BarCodeType; cdecl;
    {class} function _GetCODE_39: JGEDI_PRNTR_e_BarCodeType; cdecl;
    {class} function _GetCODE_93: JGEDI_PRNTR_e_BarCodeType; cdecl;
    {class} function _GetDATA_MATRIX: JGEDI_PRNTR_e_BarCodeType; cdecl;
    {class} function _GetEAN_13: JGEDI_PRNTR_e_BarCodeType; cdecl;
    {class} function _GetEAN_8: JGEDI_PRNTR_e_BarCodeType; cdecl;
    {class} function _GetITF: JGEDI_PRNTR_e_BarCodeType; cdecl;
    {class} function _GetMAXICODE: JGEDI_PRNTR_e_BarCodeType; cdecl;
    {class} function _GetPDF_417: JGEDI_PRNTR_e_BarCodeType; cdecl;
    {class} function _GetQR_CODE: JGEDI_PRNTR_e_BarCodeType; cdecl;
    {class} function _GetRSS_14: JGEDI_PRNTR_e_BarCodeType; cdecl;
    {class} function _GetRSS_EXPANDED: JGEDI_PRNTR_e_BarCodeType; cdecl;
    {class} function _GetUPC_A: JGEDI_PRNTR_e_BarCodeType; cdecl;
    {class} function _GetUPC_E: JGEDI_PRNTR_e_BarCodeType; cdecl;
    {class} function _GetUPC_EAN_EXTENSION: JGEDI_PRNTR_e_BarCodeType; cdecl;
    {class} function getValue: Integer; cdecl;//Deprecated
    {class} function valueOf(P1: Integer): JGEDI_PRNTR_e_BarCodeType; cdecl; overload;//Deprecated
    {class} function valueOf(P1: JString): JGEDI_PRNTR_e_BarCodeType; cdecl; overload;//Deprecated
    {class} function values: TJavaObjectArray<JGEDI_PRNTR_e_BarCodeType>; cdecl;//Deprecated
    {class} property AZTEC: JGEDI_PRNTR_e_BarCodeType read _GetAZTEC;
    {class} property CODABAR: JGEDI_PRNTR_e_BarCodeType read _GetCODABAR;
    {class} property CODE_128: JGEDI_PRNTR_e_BarCodeType read _GetCODE_128;
    {class} property CODE_39: JGEDI_PRNTR_e_BarCodeType read _GetCODE_39;
    {class} property CODE_93: JGEDI_PRNTR_e_BarCodeType read _GetCODE_93;
    {class} property DATA_MATRIX: JGEDI_PRNTR_e_BarCodeType read _GetDATA_MATRIX;
    {class} property EAN_13: JGEDI_PRNTR_e_BarCodeType read _GetEAN_13;
    {class} property EAN_8: JGEDI_PRNTR_e_BarCodeType read _GetEAN_8;
    {class} property ITF: JGEDI_PRNTR_e_BarCodeType read _GetITF;
    {class} property MAXICODE: JGEDI_PRNTR_e_BarCodeType read _GetMAXICODE;
    {class} property PDF_417: JGEDI_PRNTR_e_BarCodeType read _GetPDF_417;
    {class} property QR_CODE: JGEDI_PRNTR_e_BarCodeType read _GetQR_CODE;
    {class} property RSS_14: JGEDI_PRNTR_e_BarCodeType read _GetRSS_14;
    {class} property RSS_EXPANDED: JGEDI_PRNTR_e_BarCodeType read _GetRSS_EXPANDED;
    {class} property UPC_A: JGEDI_PRNTR_e_BarCodeType read _GetUPC_A;
    {class} property UPC_E: JGEDI_PRNTR_e_BarCodeType read _GetUPC_E;
    {class} property UPC_EAN_EXTENSION: JGEDI_PRNTR_e_BarCodeType read _GetUPC_EAN_EXTENSION;
  end;

  [JavaSignature('br/com/gertec/gedi/enums/GEDI_PRNTR_e_BarCodeType')]
  JGEDI_PRNTR_e_BarCodeType = interface(JEnum)
    ['{8731CE36-24F1-41B6-8D08-F75004A0C901}']
  end;
  TJGEDI_PRNTR_e_BarCodeType = class(TJavaGenericImport<JGEDI_PRNTR_e_BarCodeTypeClass, JGEDI_PRNTR_e_BarCodeType>) end;

  JGEDI_PRNTR_e_StatusClass = interface(JEnumClass)
    ['{492A7CCD-D91F-4326-B7EF-49B622E3351C}']
    {class} function _GetOK: JGEDI_PRNTR_e_Status; cdecl;
    {class} function _GetOUT_OF_PAPER: JGEDI_PRNTR_e_Status; cdecl;
    {class} function _GetOVERHEAT: JGEDI_PRNTR_e_Status; cdecl;
    {class} function _GetUNKNOWN_ERROR: JGEDI_PRNTR_e_Status; cdecl;
    {class} function getValue: Integer; cdecl;//Deprecated
    {class} function valueOf(P1: Integer): JGEDI_PRNTR_e_Status; cdecl; overload;//Deprecated
    {class} function valueOf(P1: JString): JGEDI_PRNTR_e_Status; cdecl; overload;//Deprecated
    {class} function values: TJavaObjectArray<JGEDI_PRNTR_e_Status>; cdecl;//Deprecated
    {class} property OK: JGEDI_PRNTR_e_Status read _GetOK;
    {class} property OUT_OF_PAPER: JGEDI_PRNTR_e_Status read _GetOUT_OF_PAPER;
    {class} property OVERHEAT: JGEDI_PRNTR_e_Status read _GetOVERHEAT;
    {class} property UNKNOWN_ERROR: JGEDI_PRNTR_e_Status read _GetUNKNOWN_ERROR;
  end;

  [JavaSignature('br/com/gertec/gedi/enums/GEDI_PRNTR_e_Status')]
  JGEDI_PRNTR_e_Status = interface(JEnum)
    ['{8625B7F8-B465-4C40-A669-B648BBFFC0D2}']
  end;
  TJGEDI_PRNTR_e_Status = class(TJavaGenericImport<JGEDI_PRNTR_e_StatusClass, JGEDI_PRNTR_e_Status>) end;

  JGEDI_SMART_e_MemoryCardTypeClass = interface(JEnumClass)
    ['{F7A75EB7-86FB-4BB0-9009-603F1F0AB98B}']
    {class} function _GetTYPE_44x2: JGEDI_SMART_e_MemoryCardType; cdecl;
    {class} function _GetTYPE_44x6: JGEDI_SMART_e_MemoryCardType; cdecl;
    {class} function _GetTYPE_44x8: JGEDI_SMART_e_MemoryCardType; cdecl;
    {class} function getValue: Integer; cdecl;//Deprecated
    {class} function valueOf(P1: JString): JGEDI_SMART_e_MemoryCardType; cdecl;//Deprecated
    {class} function values: TJavaObjectArray<JGEDI_SMART_e_MemoryCardType>; cdecl;//Deprecated
    {class} property TYPE_44x2: JGEDI_SMART_e_MemoryCardType read _GetTYPE_44x2;
    {class} property TYPE_44x6: JGEDI_SMART_e_MemoryCardType read _GetTYPE_44x6;
    {class} property TYPE_44x8: JGEDI_SMART_e_MemoryCardType read _GetTYPE_44x8;
  end;

  [JavaSignature('br/com/gertec/gedi/enums/GEDI_SMART_e_MemoryCardType')]
  JGEDI_SMART_e_MemoryCardType = interface(JEnum)
    ['{E1C53728-8E37-4308-A6A9-B68478CECE9C}']
  end;
  TJGEDI_SMART_e_MemoryCardType = class(TJavaGenericImport<JGEDI_SMART_e_MemoryCardTypeClass, JGEDI_SMART_e_MemoryCardType>) end;

  JGEDI_SMART_e_SlotClass = interface(JEnumClass)
    ['{E093B9B6-35DE-456B-B07F-24026321342D}']
    {class} function _GetSAM_1: JGEDI_SMART_e_Slot; cdecl;
    {class} function _GetSAM_2: JGEDI_SMART_e_Slot; cdecl;
    {class} function _GetSAM_3: JGEDI_SMART_e_Slot; cdecl;
    {class} function _GetSAM_4: JGEDI_SMART_e_Slot; cdecl;
    {class} function _GetUSER: JGEDI_SMART_e_Slot; cdecl;
    {class} function getValue: Integer; cdecl;//Deprecated
    {class} function valueOf(P1: Integer): JGEDI_SMART_e_Slot; cdecl; overload;//Deprecated
    {class} function valueOf(P1: JString): JGEDI_SMART_e_Slot; cdecl; overload;//Deprecated
    {class} function values: TJavaObjectArray<JGEDI_SMART_e_Slot>; cdecl;//Deprecated
    {class} property SAM_1: JGEDI_SMART_e_Slot read _GetSAM_1;
    {class} property SAM_2: JGEDI_SMART_e_Slot read _GetSAM_2;
    {class} property SAM_3: JGEDI_SMART_e_Slot read _GetSAM_3;
    {class} property SAM_4: JGEDI_SMART_e_Slot read _GetSAM_4;
    {class} property USER: JGEDI_SMART_e_Slot read _GetUSER;
  end;

  [JavaSignature('br/com/gertec/gedi/enums/GEDI_SMART_e_Slot')]
  JGEDI_SMART_e_Slot = interface(JEnum)
    ['{B619775C-758F-479D-B7A5-EC15138E6B4F}']
  end;
  TJGEDI_SMART_e_Slot = class(TJavaGenericImport<JGEDI_SMART_e_SlotClass, JGEDI_SMART_e_Slot>) end;

  JGEDI_SMART_e_StatusClass = interface(JEnumClass)
    ['{3EE52F70-A954-40F0-819D-9DA3C8FA21C3}']
    {class} function _GetABSENT: JGEDI_SMART_e_Status; cdecl;
    {class} function _GetACTIVE: JGEDI_SMART_e_Status; cdecl;
    {class} function _GetPRESENT: JGEDI_SMART_e_Status; cdecl;
    {class} function getValue: Integer; cdecl;//Deprecated
    {class} function valueOf(P1: Integer): JGEDI_SMART_e_Status; cdecl; overload;//Deprecated
    {class} function valueOf(P1: JString): JGEDI_SMART_e_Status; cdecl; overload;//Deprecated
    {class} function values: TJavaObjectArray<JGEDI_SMART_e_Status>; cdecl;//Deprecated
    {class} property ABSENT: JGEDI_SMART_e_Status read _GetABSENT;
    {class} property ACTIVE: JGEDI_SMART_e_Status read _GetACTIVE;
    {class} property PRESENT: JGEDI_SMART_e_Status read _GetPRESENT;
  end;

  [JavaSignature('br/com/gertec/gedi/enums/GEDI_SMART_e_Status')]
  JGEDI_SMART_e_Status = interface(JEnum)
    ['{7BE5E6CB-933F-47C8-8443-FA06C0A02A33}']
  end;
  TJGEDI_SMART_e_Status = class(TJavaGenericImport<JGEDI_SMART_e_StatusClass, JGEDI_SMART_e_Status>) end;

  JGEDI_SMART_e_TypeClass = interface(JEnumClass)
    ['{A3EE0D34-B127-47C6-BF13-8E998CD0CDA7}']
    {class} function _GetI2C: JGEDI_SMART_e_Type; cdecl;
    {class} function _GetMEM: JGEDI_SMART_e_Type; cdecl;
    {class} function _GetT0: JGEDI_SMART_e_Type; cdecl;
    {class} function _GetT1: JGEDI_SMART_e_Type; cdecl;
    {class} function getValue: Integer; cdecl;//Deprecated
    {class} function valueOf(P1: Integer): JGEDI_SMART_e_Type; cdecl; overload;//Deprecated
    {class} function valueOf(P1: JString): JGEDI_SMART_e_Type; cdecl; overload;//Deprecated
    {class} function values: TJavaObjectArray<JGEDI_SMART_e_Type>; cdecl;//Deprecated
    {class} property I2C: JGEDI_SMART_e_Type read _GetI2C;
    {class} property MEM: JGEDI_SMART_e_Type read _GetMEM;
    {class} property T0: JGEDI_SMART_e_Type read _GetT0;
    {class} property T1: JGEDI_SMART_e_Type read _GetT1;
  end;

  [JavaSignature('br/com/gertec/gedi/enums/GEDI_SMART_e_Type')]
  JGEDI_SMART_e_Type = interface(JEnum)
    ['{AADEDACA-44BC-427F-ABE9-FDF22632AA3F}']
  end;
  TJGEDI_SMART_e_Type = class(TJavaGenericImport<JGEDI_SMART_e_TypeClass, JGEDI_SMART_e_Type>) end;

  JGEDI_SMART_e_VoltageClass = interface(JEnumClass)
    ['{5CDA98E3-2A0E-440F-9FBC-7684B8E60C72}']
    {class} function _GetVOLTAGE_1_8V: JGEDI_SMART_e_Voltage; cdecl;
    {class} function _GetVOLTAGE_3V: JGEDI_SMART_e_Voltage; cdecl;
    {class} function _GetVOLTAGE_5V: JGEDI_SMART_e_Voltage; cdecl;
    {class} function getValue: Integer; cdecl;//Deprecated
    {class} function valueOf(P1: Integer): JGEDI_SMART_e_Voltage; cdecl; overload;//Deprecated
    {class} function valueOf(P1: JString): JGEDI_SMART_e_Voltage; cdecl; overload;//Deprecated
    {class} function values: TJavaObjectArray<JGEDI_SMART_e_Voltage>; cdecl;//Deprecated
    {class} property VOLTAGE_1_8V: JGEDI_SMART_e_Voltage read _GetVOLTAGE_1_8V;
    {class} property VOLTAGE_3V: JGEDI_SMART_e_Voltage read _GetVOLTAGE_3V;
    {class} property VOLTAGE_5V: JGEDI_SMART_e_Voltage read _GetVOLTAGE_5V;
  end;

  [JavaSignature('br/com/gertec/gedi/enums/GEDI_SMART_e_Voltage')]
  JGEDI_SMART_e_Voltage = interface(JEnum)
    ['{0B54807D-6FFB-44FB-A610-C971458F4975}']
  end;
  TJGEDI_SMART_e_Voltage = class(TJavaGenericImport<JGEDI_SMART_e_VoltageClass, JGEDI_SMART_e_Voltage>) end;

  JGEDI_SYS_e_SecuritySetupClass = interface(JEnumClass)
    ['{907E3C09-18C6-4C81-80C6-5822CCD78D28}']
    {class} function _GetDISABLE_TRANSPORT_KEY_CHECK: JGEDI_SYS_e_SecuritySetup; cdecl;
    {class} function _GetKMS_DES: JGEDI_SYS_e_SecuritySetup; cdecl;
    {class} function _GetKMS_DUKPT_DES: JGEDI_SYS_e_SecuritySetup; cdecl;
    {class} function _GetKMS_DUPLICATES: JGEDI_SYS_e_SecuritySetup; cdecl;
    {class} function _GetKMS_PINBLOCK_DISABLE_ALGORITHM_CHECK: JGEDI_SYS_e_SecuritySetup; cdecl;
    {class} function _GetKMS_PINBLOCK_ENABLE_PLAINTEXT: JGEDI_SYS_e_SecuritySetup; cdecl;
    {class} function _GetKMS_PIN_MAX_EVENT_TIMEOUT: JGEDI_SYS_e_SecuritySetup; cdecl;
    {class} function _GetKMS_PIN_MAX_RATE: JGEDI_SYS_e_SecuritySetup; cdecl;
    {class} function _GetKMS_PIN_MAX_TIMEOUT: JGEDI_SYS_e_SecuritySetup; cdecl;
    {class} function _GetKMS_RSA_MIN: JGEDI_SYS_e_SecuritySetup; cdecl;
    {class} function _GetKMS_SHA1: JGEDI_SYS_e_SecuritySetup; cdecl;
    {class} function _GetRESTORE_DEFAULT: JGEDI_SYS_e_SecuritySetup; cdecl;
    {class} function _GetWIFI_OPEN: JGEDI_SYS_e_SecuritySetup; cdecl;
    {class} function _GetWIFI_WEP: JGEDI_SYS_e_SecuritySetup; cdecl;
    {class} function getValue: Integer; cdecl;//Deprecated
    {class} function valueOf(P1: JString): JGEDI_SYS_e_SecuritySetup; cdecl;//Deprecated
    {class} function values: TJavaObjectArray<JGEDI_SYS_e_SecuritySetup>; cdecl;//Deprecated
    {class} property DISABLE_TRANSPORT_KEY_CHECK: JGEDI_SYS_e_SecuritySetup read _GetDISABLE_TRANSPORT_KEY_CHECK;
    {class} property KMS_DES: JGEDI_SYS_e_SecuritySetup read _GetKMS_DES;
    {class} property KMS_DUKPT_DES: JGEDI_SYS_e_SecuritySetup read _GetKMS_DUKPT_DES;
    {class} property KMS_DUPLICATES: JGEDI_SYS_e_SecuritySetup read _GetKMS_DUPLICATES;
    {class} property KMS_PINBLOCK_DISABLE_ALGORITHM_CHECK: JGEDI_SYS_e_SecuritySetup read _GetKMS_PINBLOCK_DISABLE_ALGORITHM_CHECK;
    {class} property KMS_PINBLOCK_ENABLE_PLAINTEXT: JGEDI_SYS_e_SecuritySetup read _GetKMS_PINBLOCK_ENABLE_PLAINTEXT;
    {class} property KMS_PIN_MAX_EVENT_TIMEOUT: JGEDI_SYS_e_SecuritySetup read _GetKMS_PIN_MAX_EVENT_TIMEOUT;
    {class} property KMS_PIN_MAX_RATE: JGEDI_SYS_e_SecuritySetup read _GetKMS_PIN_MAX_RATE;
    {class} property KMS_PIN_MAX_TIMEOUT: JGEDI_SYS_e_SecuritySetup read _GetKMS_PIN_MAX_TIMEOUT;
    {class} property KMS_RSA_MIN: JGEDI_SYS_e_SecuritySetup read _GetKMS_RSA_MIN;
    {class} property KMS_SHA1: JGEDI_SYS_e_SecuritySetup read _GetKMS_SHA1;
    {class} property RESTORE_DEFAULT: JGEDI_SYS_e_SecuritySetup read _GetRESTORE_DEFAULT;
    {class} property WIFI_OPEN: JGEDI_SYS_e_SecuritySetup read _GetWIFI_OPEN;
    {class} property WIFI_WEP: JGEDI_SYS_e_SecuritySetup read _GetWIFI_WEP;
  end;

  [JavaSignature('br/com/gertec/gedi/enums/GEDI_SYS_e_SecuritySetup')]
  JGEDI_SYS_e_SecuritySetup = interface(JEnum)
    ['{4B5A0A24-35E3-4590-9BDF-AA617C3592B8}']
  end;
  TJGEDI_SYS_e_SecuritySetup = class(TJavaGenericImport<JGEDI_SYS_e_SecuritySetupClass, JGEDI_SYS_e_SecuritySetup>) end;

  JGEDI_e_RetClass = interface(JEnumClass)
    ['{3CE7664F-DA6B-4E5C-BBAA-F983AA1BB370}']
    {class} function _GetAUDIO_BUZZER_NOT_EXIST: JGEDI_e_Ret; cdecl;
    {class} function _GetAUDIO_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetAUTH_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetAUTH_HASH_MISMATCH: JGEDI_e_Ret; cdecl;
    {class} function _GetAUTH_KEY_EXPIRED: JGEDI_e_Ret; cdecl;
    {class} function _GetAUTH_SRED_DISABLED: JGEDI_e_Ret; cdecl;
    {class} function _GetBT_ALREADY_OPEN: JGEDI_e_Ret; cdecl;
    {class} function _GetBT_CMD_FAIL: JGEDI_e_Ret; cdecl;
    {class} function _GetBT_CONNECT_FAILED: JGEDI_e_Ret; cdecl;
    {class} function _GetBT_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetBT_INVALID_CONFIG: JGEDI_e_Ret; cdecl;
    {class} function _GetBT_NOT_CONNECTED: JGEDI_e_Ret; cdecl;
    {class} function _GetBT_NOT_INITIALIZED: JGEDI_e_Ret; cdecl;
    {class} function _GetBT_NOT_PARIED: JGEDI_e_Ret; cdecl;
    {class} function _GetBT_PROCESSING: JGEDI_e_Ret; cdecl;
    {class} function _GetBT_SCAN_FAILED: JGEDI_e_Ret; cdecl;
    {class} function _GetBUFFER_NOT_ENOUGH: JGEDI_e_Ret; cdecl;
    {class} function _GetCANCELLED: JGEDI_e_Ret; cdecl;
    {class} function _GetCLOCK_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetCL_BYTE_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetCL_COLLISION: JGEDI_e_Ret; cdecl;
    {class} function _GetCL_CRC_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetCL_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetCL_MF_AUTHENTICATE: JGEDI_e_Ret; cdecl;
    {class} function _GetCL_MF_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetCL_MF_KEY_INVALID_TYPE: JGEDI_e_Ret; cdecl;
    {class} function _GetCL_MF_TYPE_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetCL_NO_RESPONSE: JGEDI_e_Ret; cdecl;
    {class} function _GetCL_PROTOCOL_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetCL_SN: JGEDI_e_Ret; cdecl;
    {class} function _GetCOULD_NOT_ALLOCATE_MEMORY: JGEDI_e_Ret; cdecl;
    {class} function _GetCRYPT_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetEND_OF_LIST: JGEDI_e_Ret; cdecl;
    {class} function _GetENG_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetETH_ALREADY_OPEN: JGEDI_e_Ret; cdecl;
    {class} function _GetETH_CMD_FAIL: JGEDI_e_Ret; cdecl;
    {class} function _GetETH_DNS_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetETH_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetETH_FTP_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetETH_NOT_ONLINE: JGEDI_e_Ret; cdecl;
    {class} function _GetETH_NOT_OPEN: JGEDI_e_Ret; cdecl;
    {class} function _GetETH_TX_BUSY: JGEDI_e_Ret; cdecl;
    {class} function _GetFS_ACCESS_DENIED: JGEDI_e_Ret; cdecl;
    {class} function _GetFS_ALREADY_EXIST: JGEDI_e_Ret; cdecl;
    {class} function _GetFS_EOF: JGEDI_e_Ret; cdecl;
    {class} function _GetFS_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetFS_INVALID_HANDLE: JGEDI_e_Ret; cdecl;
    {class} function _GetFS_INVALID_NAME: JGEDI_e_Ret; cdecl;
    {class} function _GetFS_NOT_EXIST: JGEDI_e_Ret; cdecl;
    {class} function _GetFUNCTION_NOT_FOUND: JGEDI_e_Ret; cdecl;
    {class} function _GetGSM_ALREADY_INITIALIZED: JGEDI_e_Ret; cdecl;
    {class} function _GetGSM_AUTH_FAIL: JGEDI_e_Ret; cdecl;
    {class} function _GetGSM_CMD_FAIL: JGEDI_e_Ret; cdecl;
    {class} function _GetGSM_CONNECT_FAILED: JGEDI_e_Ret; cdecl;
    {class} function _GetGSM_CSD_CONNECTED: JGEDI_e_Ret; cdecl;
    {class} function _GetGSM_CSD_NOT_CONNECTED: JGEDI_e_Ret; cdecl;
    {class} function _GetGSM_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetGSM_GPRS_ATTACHED: JGEDI_e_Ret; cdecl;
    {class} function _GetGSM_GPRS_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetGSM_GPRS_NOT_ALLOWED: JGEDI_e_Ret; cdecl;
    {class} function _GetGSM_GPRS_NOT_ATTACHED: JGEDI_e_Ret; cdecl;
    {class} function _GetGSM_GPRS_PDP_ACTIVATED: JGEDI_e_Ret; cdecl;
    {class} function _GetGSM_GPRS_PDP_NOT_ACTIVATED: JGEDI_e_Ret; cdecl;
    {class} function _GetGSM_GPRS_PPP_FAILED: JGEDI_e_Ret; cdecl;
    {class} function _GetGSM_GPRS_PPP_STARTED: JGEDI_e_Ret; cdecl;
    {class} function _GetGSM_GPRS_PPP_STOPPED: JGEDI_e_Ret; cdecl;
    {class} function _GetGSM_GPRS_UNKNOWN_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetGSM_INFO_NOT_FOUND: JGEDI_e_Ret; cdecl;
    {class} function _GetGSM_NETWORK_NOT_ALLOWED: JGEDI_e_Ret; cdecl;
    {class} function _GetGSM_NETWORK_TIMEOUT: JGEDI_e_Ret; cdecl;
    {class} function _GetGSM_NOT_INITIALIZED: JGEDI_e_Ret; cdecl;
    {class} function _GetGSM_NOT_OPEN: JGEDI_e_Ret; cdecl;
    {class} function _GetGSM_NOT_REGISTERED: JGEDI_e_Ret; cdecl;
    {class} function _GetGSM_NO_NETWORK: JGEDI_e_Ret; cdecl;
    {class} function _GetGSM_OPERATION_NOT_ALLOWED: JGEDI_e_Ret; cdecl;
    {class} function _GetGSM_PLMN_NOT_ALLOWED: JGEDI_e_Ret; cdecl;
    {class} function _GetGSM_PROCESSING: JGEDI_e_Ret; cdecl;
    {class} function _GetGSM_PROTOCOL_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetGSM_REGISTERED: JGEDI_e_Ret; cdecl;
    {class} function _GetGSM_SERIAL_OPEN_FAILED: JGEDI_e_Ret; cdecl;
    {class} function _GetGSM_SIGNAL_FAIL: JGEDI_e_Ret; cdecl;
    {class} function _GetGSM_SIM_ALREADY_INITIALIZED: JGEDI_e_Ret; cdecl;
    {class} function _GetGSM_SIM_BLOCKED: JGEDI_e_Ret; cdecl;
    {class} function _GetGSM_SIM_BUSY: JGEDI_e_Ret; cdecl;
    {class} function _GetGSM_SIM_FAIL: JGEDI_e_Ret; cdecl;
    {class} function _GetGSM_SIM_NOT_INITIALIZED: JGEDI_e_Ret; cdecl;
    {class} function _GetGSM_SIM_NOT_INSERTED: JGEDI_e_Ret; cdecl;
    {class} function _GetGSM_SIM_PIN_REQUIRED: JGEDI_e_Ret; cdecl;
    {class} function _GetGSM_SMS_CONNECTED: JGEDI_e_Ret; cdecl;
    {class} function _GetGSM_SMS_NOT_CONNECTED: JGEDI_e_Ret; cdecl;
    {class} function _GetGSM_SMS_RECEIVED_FAILED: JGEDI_e_Ret; cdecl;
    {class} function _GetGSM_SMS_SEND_FAILED: JGEDI_e_Ret; cdecl;
    {class} function _GetGSM_STANDBY: JGEDI_e_Ret; cdecl;
    {class} function _GetGSM_USSD_CONNECTED: JGEDI_e_Ret; cdecl;
    {class} function _GetGSM_USSD_FAILED: JGEDI_e_Ret; cdecl;
    {class} function _GetGSM_USSD_NOT_CONNECTED: JGEDI_e_Ret; cdecl;
    {class} function _GetGSM_USSD_NOT_OPEN: JGEDI_e_Ret; cdecl;
    {class} function _GetGSM_USSD_OPEN: JGEDI_e_Ret; cdecl;
    {class} function _GetI2C_ADDRESS_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetI2C_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetI2C_OPEN_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetI2C_REGISTER_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetIMPLEMENTATION_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetINFO_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetINVALID_PARAMETER: JGEDI_e_Ret; cdecl;
    {class} function _GetKBD_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetKBD_IN_USE: JGEDI_e_Ret; cdecl;
    {class} function _GetKMS_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetKMS_FULL: JGEDI_e_Ret; cdecl;
    {class} function _GetKMS_INVALID_CERTIFICATE: JGEDI_e_Ret; cdecl;
    {class} function _GetKMS_INVALID_HASH: JGEDI_e_Ret; cdecl;
    {class} function _GetKMS_INVALID_INDEX: JGEDI_e_Ret; cdecl;
    {class} function _GetKMS_INVALID_KCV: JGEDI_e_Ret; cdecl;
    {class} function _GetKMS_INVALID_KEK: JGEDI_e_Ret; cdecl;
    {class} function _GetKMS_INVALID_KEY: JGEDI_e_Ret; cdecl;
    {class} function _GetKMS_INVALID_LENGTH: JGEDI_e_Ret; cdecl;
    {class} function _GetKMS_INVALID_MODE: JGEDI_e_Ret; cdecl;
    {class} function _GetKMS_INVALID_OPERATION: JGEDI_e_Ret; cdecl;
    {class} function _GetKMS_INVALID_PIN_LEN: JGEDI_e_Ret; cdecl;
    {class} function _GetKMS_INVALID_PURPOSE: JGEDI_e_Ret; cdecl;
    {class} function _GetKMS_INVALID_TYPE: JGEDI_e_Ret; cdecl;
    {class} function _GetKMS_KEY_EXPIRED: JGEDI_e_Ret; cdecl;
    {class} function _GetKMS_KEY_NOT_UNIQUE: JGEDI_e_Ret; cdecl;
    {class} function _GetKMS_KEY_ON_COOLDOWN: JGEDI_e_Ret; cdecl;
    {class} function _GetKMS_NULL_PIN: JGEDI_e_Ret; cdecl;
    {class} function _GetKMS_PINMODE_ACTIVE: JGEDI_e_Ret; cdecl;
    {class} function _GetKMS_PINMODE_INACTIVE: JGEDI_e_Ret; cdecl;
    {class} function _GetKMS_PINMODE_NO_KEY: JGEDI_e_Ret; cdecl;
    {class} function _GetKMS_USER_CANCELLED: JGEDI_e_Ret; cdecl;
    {class} function _GetLCD_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetLCD_FONT_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetLED_BACKLIGHT_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetLED_BACKLIGHT_NOT_EXIST: JGEDI_e_Ret; cdecl;
    {class} function _GetLED_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetLED_NOT_EXIST: JGEDI_e_Ret; cdecl;
    {class} function _GetLINUX_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetMENU_NOT_INITIALIZED: JGEDI_e_Ret; cdecl;
    {class} function _GetMIFARE_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetMIFARE_KEYA_REQUIRED: JGEDI_e_Ret; cdecl;
    {class} function _GetMIFARE_KEYB_REQUIRED: JGEDI_e_Ret; cdecl;
    {class} function _GetMIFARE_NOT_FORMATTED: JGEDI_e_Ret; cdecl;
    {class} function _GetMIFARE_PROTECTED: JGEDI_e_Ret; cdecl;
    {class} function _GetMODEM_ALREADY_OPEN: JGEDI_e_Ret; cdecl;
    {class} function _GetMODEM_CMD_FAIL: JGEDI_e_Ret; cdecl;
    {class} function _GetMODEM_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetMODEM_NOT_ONLINE: JGEDI_e_Ret; cdecl;
    {class} function _GetMODEM_NOT_OPEN: JGEDI_e_Ret; cdecl;
    {class} function _GetMODEM_TX_BUSY: JGEDI_e_Ret; cdecl;
    {class} function _GetMODULE_NOT_FOUND: JGEDI_e_Ret; cdecl;
    {class} function _GetMSR_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetMSR_NO_SWIPE: JGEDI_e_Ret; cdecl;
    {class} function _GetMSR_TRACK_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetNET_BINDTODEVICE_FAILED: JGEDI_e_Ret; cdecl;
    {class} function _GetNET_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetNET_PING_FAILED: JGEDI_e_Ret; cdecl;
    {class} function _GetNET_SELECTDEFAULTDEVICE_FAILED: JGEDI_e_Ret; cdecl;
    {class} function _GetNET_URL_NOT_FOUND: JGEDI_e_Ret; cdecl;
    {class} function _GetNOT_AVAILABLE: JGEDI_e_Ret; cdecl;
    {class} function _GetNOT_SUPPORTED: JGEDI_e_Ret; cdecl;
    {class} function _GetNULL_PARAMETER: JGEDI_e_Ret; cdecl;
    {class} function _GetOK: JGEDI_e_Ret; cdecl;
    {class} function _GetOUT_OF_BOUNDS: JGEDI_e_Ret; cdecl;
    {class} function _GetPENALTY_ACTIVE: JGEDI_e_Ret; cdecl;
    {class} function _GetPENALTY_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetPKI_CMAC_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetPKI_CSR_NOT_SIGNED: JGEDI_e_Ret; cdecl;
    {class} function _GetPKI_DATE_NOT_FOUND: JGEDI_e_Ret; cdecl;
    {class} function _GetPKI_DERIVATION_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetPKI_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetPKI_INVALID_CERTIFICATE: JGEDI_e_Ret; cdecl;
    {class} function _GetPKI_INVALID_CHALLENGE: JGEDI_e_Ret; cdecl;
    {class} function _GetPKI_INVALID_CMAC: JGEDI_e_Ret; cdecl;
    {class} function _GetPKI_INVALID_DATE: JGEDI_e_Ret; cdecl;
    {class} function _GetPKI_INVALID_KEY: JGEDI_e_Ret; cdecl;
    {class} function _GetPKI_KBPK_MISSING: JGEDI_e_Ret; cdecl;
    {class} function _GetPKI_NO_CA_FOUND: JGEDI_e_Ret; cdecl;
    {class} function _GetPKI_NO_CERTIFICATE_FOUND: JGEDI_e_Ret; cdecl;
    {class} function _GetPKI_NO_CUST_KEY_FOUND: JGEDI_e_Ret; cdecl;
    {class} function _GetPKI_NO_DEV_KEY_FOUND: JGEDI_e_Ret; cdecl;
    {class} function _GetPKI_TR31_BLOCK_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetPLATFORM_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetPM_ALREADY_SEALED: JGEDI_e_Ret; cdecl;
    {class} function _GetPM_AP_NAME_REPEATED: JGEDI_e_Ret; cdecl;
    {class} function _GetPM_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetPM_FULL: JGEDI_e_Ret; cdecl;
    {class} function _GetPM_INVALID_AP: JGEDI_e_Ret; cdecl;
    {class} function _GetPM_INVALID_FILE: JGEDI_e_Ret; cdecl;
    {class} function _GetPM_NOT_SEALED: JGEDI_e_Ret; cdecl;
    {class} function _GetPM_SEAL_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetPM_SIGN_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetPM_ULD_FAIL: JGEDI_e_Ret; cdecl;
    {class} function _GetPOWER_BATTERY_BUSY: JGEDI_e_Ret; cdecl;
    {class} function _GetPOWER_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetPOWER_NO_BATTERY: JGEDI_e_Ret; cdecl;
    {class} function _GetPOWER_NO_EXT_POWER: JGEDI_e_Ret; cdecl;
    {class} function _GetPRNTR_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetPRNTR_FONT_PATH_LEN: JGEDI_e_Ret; cdecl;
    {class} function _GetPRNTR_NOT_READY: JGEDI_e_Ret; cdecl;
    {class} function _GetPRNTR_OUT_OF_PAPER: JGEDI_e_Ret; cdecl;
    {class} function _GetRS232_BUSY: JGEDI_e_Ret; cdecl;
    {class} function _GetRS232_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetRS232_NOT_OPEN: JGEDI_e_Ret; cdecl;
    {class} function _GetRSA_GEN_FAIL: JGEDI_e_Ret; cdecl;
    {class} function _GetSMART_ABSENT: JGEDI_e_Ret; cdecl;
    {class} function _GetSMART_ATR_TOO_LONG: JGEDI_e_Ret; cdecl;
    {class} function _GetSMART_BAD_TS: JGEDI_e_Ret; cdecl;
    {class} function _GetSMART_COMM_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetSMART_DEACTIVATED_PROTOCOL: JGEDI_e_Ret; cdecl;
    {class} function _GetSMART_EDC_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetSMART_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetSMART_INVALID_ATR: JGEDI_e_Ret; cdecl;
    {class} function _GetSMART_MUTE: JGEDI_e_Ret; cdecl;
    {class} function _GetSMART_NOT_ACTIVATED: JGEDI_e_Ret; cdecl;
    {class} function _GetSMART_PARITY_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetSMART_POWER_FAILED: JGEDI_e_Ret; cdecl;
    {class} function _GetSMART_PROCEDURE_BYTE_CONFLICT: JGEDI_e_Ret; cdecl;
    {class} function _GetSMART_PTS_RESPONSE_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetSMART_TA1_NOT_SUPPORTED: JGEDI_e_Ret; cdecl;
    {class} function _GetSYS_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetTEST_FAIL: JGEDI_e_Ret; cdecl;
    {class} function _GetTIMEOUT: JGEDI_e_Ret; cdecl;
    {class} function _GetUSB_ALREADY_OPEN: JGEDI_e_Ret; cdecl;
    {class} function _GetUSB_BUSY: JGEDI_e_Ret; cdecl;
    {class} function _GetUSB_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetUSB_NOT_OPEN: JGEDI_e_Ret; cdecl;
    {class} function _GetUTIL_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetWIFI_CMD_FAIL: JGEDI_e_Ret; cdecl;
    {class} function _GetWIFI_CONNECT_FAILED: JGEDI_e_Ret; cdecl;
    {class} function _GetWIFI_ERROR: JGEDI_e_Ret; cdecl;
    {class} function _GetWIFI_INVALID_CONFIG: JGEDI_e_Ret; cdecl;
    {class} function _GetWIFI_NOT_OPEN: JGEDI_e_Ret; cdecl;
    {class} function _GetWIFI_PROCESSING: JGEDI_e_Ret; cdecl;
    {class} function _GetWIFI_SCAN_FAILED: JGEDI_e_Ret; cdecl;
    {class} function getValue: Integer; cdecl;//Deprecated
    {class} function valueOf(P1: Integer): JGEDI_e_Ret; cdecl; overload;//Deprecated
    {class} function valueOf(P1: JString): JGEDI_e_Ret; cdecl; overload;//Deprecated
    {class} function values: TJavaObjectArray<JGEDI_e_Ret>; cdecl;//Deprecated
    {class} property AUDIO_BUZZER_NOT_EXIST: JGEDI_e_Ret read _GetAUDIO_BUZZER_NOT_EXIST;
    {class} property AUDIO_ERROR: JGEDI_e_Ret read _GetAUDIO_ERROR;
    {class} property AUTH_ERROR: JGEDI_e_Ret read _GetAUTH_ERROR;
    {class} property AUTH_HASH_MISMATCH: JGEDI_e_Ret read _GetAUTH_HASH_MISMATCH;
    {class} property AUTH_KEY_EXPIRED: JGEDI_e_Ret read _GetAUTH_KEY_EXPIRED;
    {class} property AUTH_SRED_DISABLED: JGEDI_e_Ret read _GetAUTH_SRED_DISABLED;
    {class} property BT_ALREADY_OPEN: JGEDI_e_Ret read _GetBT_ALREADY_OPEN;
    {class} property BT_CMD_FAIL: JGEDI_e_Ret read _GetBT_CMD_FAIL;
    {class} property BT_CONNECT_FAILED: JGEDI_e_Ret read _GetBT_CONNECT_FAILED;
    {class} property BT_ERROR: JGEDI_e_Ret read _GetBT_ERROR;
    {class} property BT_INVALID_CONFIG: JGEDI_e_Ret read _GetBT_INVALID_CONFIG;
    {class} property BT_NOT_CONNECTED: JGEDI_e_Ret read _GetBT_NOT_CONNECTED;
    {class} property BT_NOT_INITIALIZED: JGEDI_e_Ret read _GetBT_NOT_INITIALIZED;
    {class} property BT_NOT_PARIED: JGEDI_e_Ret read _GetBT_NOT_PARIED;
    {class} property BT_PROCESSING: JGEDI_e_Ret read _GetBT_PROCESSING;
    {class} property BT_SCAN_FAILED: JGEDI_e_Ret read _GetBT_SCAN_FAILED;
    {class} property BUFFER_NOT_ENOUGH: JGEDI_e_Ret read _GetBUFFER_NOT_ENOUGH;
    {class} property CANCELLED: JGEDI_e_Ret read _GetCANCELLED;
    {class} property CLOCK_ERROR: JGEDI_e_Ret read _GetCLOCK_ERROR;
    {class} property CL_BYTE_ERROR: JGEDI_e_Ret read _GetCL_BYTE_ERROR;
    {class} property CL_COLLISION: JGEDI_e_Ret read _GetCL_COLLISION;
    {class} property CL_CRC_ERROR: JGEDI_e_Ret read _GetCL_CRC_ERROR;
    {class} property CL_ERROR: JGEDI_e_Ret read _GetCL_ERROR;
    {class} property CL_MF_AUTHENTICATE: JGEDI_e_Ret read _GetCL_MF_AUTHENTICATE;
    {class} property CL_MF_ERROR: JGEDI_e_Ret read _GetCL_MF_ERROR;
    {class} property CL_MF_KEY_INVALID_TYPE: JGEDI_e_Ret read _GetCL_MF_KEY_INVALID_TYPE;
    {class} property CL_MF_TYPE_ERROR: JGEDI_e_Ret read _GetCL_MF_TYPE_ERROR;
    {class} property CL_NO_RESPONSE: JGEDI_e_Ret read _GetCL_NO_RESPONSE;
    {class} property CL_PROTOCOL_ERROR: JGEDI_e_Ret read _GetCL_PROTOCOL_ERROR;
    {class} property CL_SN: JGEDI_e_Ret read _GetCL_SN;
    {class} property COULD_NOT_ALLOCATE_MEMORY: JGEDI_e_Ret read _GetCOULD_NOT_ALLOCATE_MEMORY;
    {class} property CRYPT_ERROR: JGEDI_e_Ret read _GetCRYPT_ERROR;
    {class} property END_OF_LIST: JGEDI_e_Ret read _GetEND_OF_LIST;
    {class} property ENG_ERROR: JGEDI_e_Ret read _GetENG_ERROR;
    {class} property ETH_ALREADY_OPEN: JGEDI_e_Ret read _GetETH_ALREADY_OPEN;
    {class} property ETH_CMD_FAIL: JGEDI_e_Ret read _GetETH_CMD_FAIL;
    {class} property ETH_DNS_ERROR: JGEDI_e_Ret read _GetETH_DNS_ERROR;
    {class} property ETH_ERROR: JGEDI_e_Ret read _GetETH_ERROR;
    {class} property ETH_FTP_ERROR: JGEDI_e_Ret read _GetETH_FTP_ERROR;
    {class} property ETH_NOT_ONLINE: JGEDI_e_Ret read _GetETH_NOT_ONLINE;
    {class} property ETH_NOT_OPEN: JGEDI_e_Ret read _GetETH_NOT_OPEN;
    {class} property ETH_TX_BUSY: JGEDI_e_Ret read _GetETH_TX_BUSY;
    {class} property FS_ACCESS_DENIED: JGEDI_e_Ret read _GetFS_ACCESS_DENIED;
    {class} property FS_ALREADY_EXIST: JGEDI_e_Ret read _GetFS_ALREADY_EXIST;
    {class} property FS_EOF: JGEDI_e_Ret read _GetFS_EOF;
    {class} property FS_ERROR: JGEDI_e_Ret read _GetFS_ERROR;
    {class} property FS_INVALID_HANDLE: JGEDI_e_Ret read _GetFS_INVALID_HANDLE;
    {class} property FS_INVALID_NAME: JGEDI_e_Ret read _GetFS_INVALID_NAME;
    {class} property FS_NOT_EXIST: JGEDI_e_Ret read _GetFS_NOT_EXIST;
    {class} property FUNCTION_NOT_FOUND: JGEDI_e_Ret read _GetFUNCTION_NOT_FOUND;
    {class} property GSM_ALREADY_INITIALIZED: JGEDI_e_Ret read _GetGSM_ALREADY_INITIALIZED;
    {class} property GSM_AUTH_FAIL: JGEDI_e_Ret read _GetGSM_AUTH_FAIL;
    {class} property GSM_CMD_FAIL: JGEDI_e_Ret read _GetGSM_CMD_FAIL;
    {class} property GSM_CONNECT_FAILED: JGEDI_e_Ret read _GetGSM_CONNECT_FAILED;
    {class} property GSM_CSD_CONNECTED: JGEDI_e_Ret read _GetGSM_CSD_CONNECTED;
    {class} property GSM_CSD_NOT_CONNECTED: JGEDI_e_Ret read _GetGSM_CSD_NOT_CONNECTED;
    {class} property GSM_ERROR: JGEDI_e_Ret read _GetGSM_ERROR;
    {class} property GSM_GPRS_ATTACHED: JGEDI_e_Ret read _GetGSM_GPRS_ATTACHED;
    {class} property GSM_GPRS_ERROR: JGEDI_e_Ret read _GetGSM_GPRS_ERROR;
    {class} property GSM_GPRS_NOT_ALLOWED: JGEDI_e_Ret read _GetGSM_GPRS_NOT_ALLOWED;
    {class} property GSM_GPRS_NOT_ATTACHED: JGEDI_e_Ret read _GetGSM_GPRS_NOT_ATTACHED;
    {class} property GSM_GPRS_PDP_ACTIVATED: JGEDI_e_Ret read _GetGSM_GPRS_PDP_ACTIVATED;
    {class} property GSM_GPRS_PDP_NOT_ACTIVATED: JGEDI_e_Ret read _GetGSM_GPRS_PDP_NOT_ACTIVATED;
    {class} property GSM_GPRS_PPP_FAILED: JGEDI_e_Ret read _GetGSM_GPRS_PPP_FAILED;
    {class} property GSM_GPRS_PPP_STARTED: JGEDI_e_Ret read _GetGSM_GPRS_PPP_STARTED;
    {class} property GSM_GPRS_PPP_STOPPED: JGEDI_e_Ret read _GetGSM_GPRS_PPP_STOPPED;
    {class} property GSM_GPRS_UNKNOWN_ERROR: JGEDI_e_Ret read _GetGSM_GPRS_UNKNOWN_ERROR;
    {class} property GSM_INFO_NOT_FOUND: JGEDI_e_Ret read _GetGSM_INFO_NOT_FOUND;
    {class} property GSM_NETWORK_NOT_ALLOWED: JGEDI_e_Ret read _GetGSM_NETWORK_NOT_ALLOWED;
    {class} property GSM_NETWORK_TIMEOUT: JGEDI_e_Ret read _GetGSM_NETWORK_TIMEOUT;
    {class} property GSM_NOT_INITIALIZED: JGEDI_e_Ret read _GetGSM_NOT_INITIALIZED;
    {class} property GSM_NOT_OPEN: JGEDI_e_Ret read _GetGSM_NOT_OPEN;
    {class} property GSM_NOT_REGISTERED: JGEDI_e_Ret read _GetGSM_NOT_REGISTERED;
    {class} property GSM_NO_NETWORK: JGEDI_e_Ret read _GetGSM_NO_NETWORK;
    {class} property GSM_OPERATION_NOT_ALLOWED: JGEDI_e_Ret read _GetGSM_OPERATION_NOT_ALLOWED;
    {class} property GSM_PLMN_NOT_ALLOWED: JGEDI_e_Ret read _GetGSM_PLMN_NOT_ALLOWED;
    {class} property GSM_PROCESSING: JGEDI_e_Ret read _GetGSM_PROCESSING;
    {class} property GSM_PROTOCOL_ERROR: JGEDI_e_Ret read _GetGSM_PROTOCOL_ERROR;
    {class} property GSM_REGISTERED: JGEDI_e_Ret read _GetGSM_REGISTERED;
    {class} property GSM_SERIAL_OPEN_FAILED: JGEDI_e_Ret read _GetGSM_SERIAL_OPEN_FAILED;
    {class} property GSM_SIGNAL_FAIL: JGEDI_e_Ret read _GetGSM_SIGNAL_FAIL;
    {class} property GSM_SIM_ALREADY_INITIALIZED: JGEDI_e_Ret read _GetGSM_SIM_ALREADY_INITIALIZED;
    {class} property GSM_SIM_BLOCKED: JGEDI_e_Ret read _GetGSM_SIM_BLOCKED;
    {class} property GSM_SIM_BUSY: JGEDI_e_Ret read _GetGSM_SIM_BUSY;
    {class} property GSM_SIM_FAIL: JGEDI_e_Ret read _GetGSM_SIM_FAIL;
    {class} property GSM_SIM_NOT_INITIALIZED: JGEDI_e_Ret read _GetGSM_SIM_NOT_INITIALIZED;
    {class} property GSM_SIM_NOT_INSERTED: JGEDI_e_Ret read _GetGSM_SIM_NOT_INSERTED;
    {class} property GSM_SIM_PIN_REQUIRED: JGEDI_e_Ret read _GetGSM_SIM_PIN_REQUIRED;
    {class} property GSM_SMS_CONNECTED: JGEDI_e_Ret read _GetGSM_SMS_CONNECTED;
    {class} property GSM_SMS_NOT_CONNECTED: JGEDI_e_Ret read _GetGSM_SMS_NOT_CONNECTED;
    {class} property GSM_SMS_RECEIVED_FAILED: JGEDI_e_Ret read _GetGSM_SMS_RECEIVED_FAILED;
    {class} property GSM_SMS_SEND_FAILED: JGEDI_e_Ret read _GetGSM_SMS_SEND_FAILED;
    {class} property GSM_STANDBY: JGEDI_e_Ret read _GetGSM_STANDBY;
    {class} property GSM_USSD_CONNECTED: JGEDI_e_Ret read _GetGSM_USSD_CONNECTED;
    {class} property GSM_USSD_FAILED: JGEDI_e_Ret read _GetGSM_USSD_FAILED;
    {class} property GSM_USSD_NOT_CONNECTED: JGEDI_e_Ret read _GetGSM_USSD_NOT_CONNECTED;
    {class} property GSM_USSD_NOT_OPEN: JGEDI_e_Ret read _GetGSM_USSD_NOT_OPEN;
    {class} property GSM_USSD_OPEN: JGEDI_e_Ret read _GetGSM_USSD_OPEN;
    {class} property I2C_ADDRESS_ERROR: JGEDI_e_Ret read _GetI2C_ADDRESS_ERROR;
    {class} property I2C_ERROR: JGEDI_e_Ret read _GetI2C_ERROR;
    {class} property I2C_OPEN_ERROR: JGEDI_e_Ret read _GetI2C_OPEN_ERROR;
    {class} property I2C_REGISTER_ERROR: JGEDI_e_Ret read _GetI2C_REGISTER_ERROR;
    {class} property IMPLEMENTATION_ERROR: JGEDI_e_Ret read _GetIMPLEMENTATION_ERROR;
    {class} property INFO_ERROR: JGEDI_e_Ret read _GetINFO_ERROR;
    {class} property INVALID_PARAMETER: JGEDI_e_Ret read _GetINVALID_PARAMETER;
    {class} property KBD_ERROR: JGEDI_e_Ret read _GetKBD_ERROR;
    {class} property KBD_IN_USE: JGEDI_e_Ret read _GetKBD_IN_USE;
    {class} property KMS_ERROR: JGEDI_e_Ret read _GetKMS_ERROR;
    {class} property KMS_FULL: JGEDI_e_Ret read _GetKMS_FULL;
    {class} property KMS_INVALID_CERTIFICATE: JGEDI_e_Ret read _GetKMS_INVALID_CERTIFICATE;
    {class} property KMS_INVALID_HASH: JGEDI_e_Ret read _GetKMS_INVALID_HASH;
    {class} property KMS_INVALID_INDEX: JGEDI_e_Ret read _GetKMS_INVALID_INDEX;
    {class} property KMS_INVALID_KCV: JGEDI_e_Ret read _GetKMS_INVALID_KCV;
    {class} property KMS_INVALID_KEK: JGEDI_e_Ret read _GetKMS_INVALID_KEK;
    {class} property KMS_INVALID_KEY: JGEDI_e_Ret read _GetKMS_INVALID_KEY;
    {class} property KMS_INVALID_LENGTH: JGEDI_e_Ret read _GetKMS_INVALID_LENGTH;
    {class} property KMS_INVALID_MODE: JGEDI_e_Ret read _GetKMS_INVALID_MODE;
    {class} property KMS_INVALID_OPERATION: JGEDI_e_Ret read _GetKMS_INVALID_OPERATION;
    {class} property KMS_INVALID_PIN_LEN: JGEDI_e_Ret read _GetKMS_INVALID_PIN_LEN;
    {class} property KMS_INVALID_PURPOSE: JGEDI_e_Ret read _GetKMS_INVALID_PURPOSE;
    {class} property KMS_INVALID_TYPE: JGEDI_e_Ret read _GetKMS_INVALID_TYPE;
    {class} property KMS_KEY_EXPIRED: JGEDI_e_Ret read _GetKMS_KEY_EXPIRED;
    {class} property KMS_KEY_NOT_UNIQUE: JGEDI_e_Ret read _GetKMS_KEY_NOT_UNIQUE;
    {class} property KMS_KEY_ON_COOLDOWN: JGEDI_e_Ret read _GetKMS_KEY_ON_COOLDOWN;
    {class} property KMS_NULL_PIN: JGEDI_e_Ret read _GetKMS_NULL_PIN;
    {class} property KMS_PINMODE_ACTIVE: JGEDI_e_Ret read _GetKMS_PINMODE_ACTIVE;
    {class} property KMS_PINMODE_INACTIVE: JGEDI_e_Ret read _GetKMS_PINMODE_INACTIVE;
    {class} property KMS_PINMODE_NO_KEY: JGEDI_e_Ret read _GetKMS_PINMODE_NO_KEY;
    {class} property KMS_USER_CANCELLED: JGEDI_e_Ret read _GetKMS_USER_CANCELLED;
    {class} property LCD_ERROR: JGEDI_e_Ret read _GetLCD_ERROR;
    {class} property LCD_FONT_ERROR: JGEDI_e_Ret read _GetLCD_FONT_ERROR;
    {class} property LED_BACKLIGHT_ERROR: JGEDI_e_Ret read _GetLED_BACKLIGHT_ERROR;
    {class} property LED_BACKLIGHT_NOT_EXIST: JGEDI_e_Ret read _GetLED_BACKLIGHT_NOT_EXIST;
    {class} property LED_ERROR: JGEDI_e_Ret read _GetLED_ERROR;
    {class} property LED_NOT_EXIST: JGEDI_e_Ret read _GetLED_NOT_EXIST;
    {class} property LINUX_ERROR: JGEDI_e_Ret read _GetLINUX_ERROR;
    {class} property MENU_NOT_INITIALIZED: JGEDI_e_Ret read _GetMENU_NOT_INITIALIZED;
    {class} property MIFARE_ERROR: JGEDI_e_Ret read _GetMIFARE_ERROR;
    {class} property MIFARE_KEYA_REQUIRED: JGEDI_e_Ret read _GetMIFARE_KEYA_REQUIRED;
    {class} property MIFARE_KEYB_REQUIRED: JGEDI_e_Ret read _GetMIFARE_KEYB_REQUIRED;
    {class} property MIFARE_NOT_FORMATTED: JGEDI_e_Ret read _GetMIFARE_NOT_FORMATTED;
    {class} property MIFARE_PROTECTED: JGEDI_e_Ret read _GetMIFARE_PROTECTED;
    {class} property MODEM_ALREADY_OPEN: JGEDI_e_Ret read _GetMODEM_ALREADY_OPEN;
    {class} property MODEM_CMD_FAIL: JGEDI_e_Ret read _GetMODEM_CMD_FAIL;
    {class} property MODEM_ERROR: JGEDI_e_Ret read _GetMODEM_ERROR;
    {class} property MODEM_NOT_ONLINE: JGEDI_e_Ret read _GetMODEM_NOT_ONLINE;
    {class} property MODEM_NOT_OPEN: JGEDI_e_Ret read _GetMODEM_NOT_OPEN;
    {class} property MODEM_TX_BUSY: JGEDI_e_Ret read _GetMODEM_TX_BUSY;
    {class} property MODULE_NOT_FOUND: JGEDI_e_Ret read _GetMODULE_NOT_FOUND;
    {class} property MSR_ERROR: JGEDI_e_Ret read _GetMSR_ERROR;
    {class} property MSR_NO_SWIPE: JGEDI_e_Ret read _GetMSR_NO_SWIPE;
    {class} property MSR_TRACK_ERROR: JGEDI_e_Ret read _GetMSR_TRACK_ERROR;
    {class} property NET_BINDTODEVICE_FAILED: JGEDI_e_Ret read _GetNET_BINDTODEVICE_FAILED;
    {class} property NET_ERROR: JGEDI_e_Ret read _GetNET_ERROR;
    {class} property NET_PING_FAILED: JGEDI_e_Ret read _GetNET_PING_FAILED;
    {class} property NET_SELECTDEFAULTDEVICE_FAILED: JGEDI_e_Ret read _GetNET_SELECTDEFAULTDEVICE_FAILED;
    {class} property NET_URL_NOT_FOUND: JGEDI_e_Ret read _GetNET_URL_NOT_FOUND;
    {class} property NOT_AVAILABLE: JGEDI_e_Ret read _GetNOT_AVAILABLE;
    {class} property NOT_SUPPORTED: JGEDI_e_Ret read _GetNOT_SUPPORTED;
    {class} property NULL_PARAMETER: JGEDI_e_Ret read _GetNULL_PARAMETER;
    {class} property OK: JGEDI_e_Ret read _GetOK;
    {class} property OUT_OF_BOUNDS: JGEDI_e_Ret read _GetOUT_OF_BOUNDS;
    {class} property PENALTY_ACTIVE: JGEDI_e_Ret read _GetPENALTY_ACTIVE;
    {class} property PENALTY_ERROR: JGEDI_e_Ret read _GetPENALTY_ERROR;
    {class} property PKI_CMAC_ERROR: JGEDI_e_Ret read _GetPKI_CMAC_ERROR;
    {class} property PKI_CSR_NOT_SIGNED: JGEDI_e_Ret read _GetPKI_CSR_NOT_SIGNED;
    {class} property PKI_DATE_NOT_FOUND: JGEDI_e_Ret read _GetPKI_DATE_NOT_FOUND;
    {class} property PKI_DERIVATION_ERROR: JGEDI_e_Ret read _GetPKI_DERIVATION_ERROR;
    {class} property PKI_ERROR: JGEDI_e_Ret read _GetPKI_ERROR;
    {class} property PKI_INVALID_CERTIFICATE: JGEDI_e_Ret read _GetPKI_INVALID_CERTIFICATE;
    {class} property PKI_INVALID_CHALLENGE: JGEDI_e_Ret read _GetPKI_INVALID_CHALLENGE;
    {class} property PKI_INVALID_CMAC: JGEDI_e_Ret read _GetPKI_INVALID_CMAC;
    {class} property PKI_INVALID_DATE: JGEDI_e_Ret read _GetPKI_INVALID_DATE;
    {class} property PKI_INVALID_KEY: JGEDI_e_Ret read _GetPKI_INVALID_KEY;
    {class} property PKI_KBPK_MISSING: JGEDI_e_Ret read _GetPKI_KBPK_MISSING;
    {class} property PKI_NO_CA_FOUND: JGEDI_e_Ret read _GetPKI_NO_CA_FOUND;
    {class} property PKI_NO_CERTIFICATE_FOUND: JGEDI_e_Ret read _GetPKI_NO_CERTIFICATE_FOUND;
    {class} property PKI_NO_CUST_KEY_FOUND: JGEDI_e_Ret read _GetPKI_NO_CUST_KEY_FOUND;
    {class} property PKI_NO_DEV_KEY_FOUND: JGEDI_e_Ret read _GetPKI_NO_DEV_KEY_FOUND;
    {class} property PKI_TR31_BLOCK_ERROR: JGEDI_e_Ret read _GetPKI_TR31_BLOCK_ERROR;
    {class} property PLATFORM_ERROR: JGEDI_e_Ret read _GetPLATFORM_ERROR;
    {class} property PM_ALREADY_SEALED: JGEDI_e_Ret read _GetPM_ALREADY_SEALED;
    {class} property PM_AP_NAME_REPEATED: JGEDI_e_Ret read _GetPM_AP_NAME_REPEATED;
    {class} property PM_ERROR: JGEDI_e_Ret read _GetPM_ERROR;
    {class} property PM_FULL: JGEDI_e_Ret read _GetPM_FULL;
    {class} property PM_INVALID_AP: JGEDI_e_Ret read _GetPM_INVALID_AP;
    {class} property PM_INVALID_FILE: JGEDI_e_Ret read _GetPM_INVALID_FILE;
    {class} property PM_NOT_SEALED: JGEDI_e_Ret read _GetPM_NOT_SEALED;
    {class} property PM_SEAL_ERROR: JGEDI_e_Ret read _GetPM_SEAL_ERROR;
    {class} property PM_SIGN_ERROR: JGEDI_e_Ret read _GetPM_SIGN_ERROR;
    {class} property PM_ULD_FAIL: JGEDI_e_Ret read _GetPM_ULD_FAIL;
    {class} property POWER_BATTERY_BUSY: JGEDI_e_Ret read _GetPOWER_BATTERY_BUSY;
    {class} property POWER_ERROR: JGEDI_e_Ret read _GetPOWER_ERROR;
    {class} property POWER_NO_BATTERY: JGEDI_e_Ret read _GetPOWER_NO_BATTERY;
    {class} property POWER_NO_EXT_POWER: JGEDI_e_Ret read _GetPOWER_NO_EXT_POWER;
    {class} property PRNTR_ERROR: JGEDI_e_Ret read _GetPRNTR_ERROR;
    {class} property PRNTR_FONT_PATH_LEN: JGEDI_e_Ret read _GetPRNTR_FONT_PATH_LEN;
    {class} property PRNTR_NOT_READY: JGEDI_e_Ret read _GetPRNTR_NOT_READY;
    {class} property PRNTR_OUT_OF_PAPER: JGEDI_e_Ret read _GetPRNTR_OUT_OF_PAPER;
    {class} property RS232_BUSY: JGEDI_e_Ret read _GetRS232_BUSY;
    {class} property RS232_ERROR: JGEDI_e_Ret read _GetRS232_ERROR;
    {class} property RS232_NOT_OPEN: JGEDI_e_Ret read _GetRS232_NOT_OPEN;
    {class} property RSA_GEN_FAIL: JGEDI_e_Ret read _GetRSA_GEN_FAIL;
    {class} property SMART_ABSENT: JGEDI_e_Ret read _GetSMART_ABSENT;
    {class} property SMART_ATR_TOO_LONG: JGEDI_e_Ret read _GetSMART_ATR_TOO_LONG;
    {class} property SMART_BAD_TS: JGEDI_e_Ret read _GetSMART_BAD_TS;
    {class} property SMART_COMM_ERROR: JGEDI_e_Ret read _GetSMART_COMM_ERROR;
    {class} property SMART_DEACTIVATED_PROTOCOL: JGEDI_e_Ret read _GetSMART_DEACTIVATED_PROTOCOL;
    {class} property SMART_EDC_ERROR: JGEDI_e_Ret read _GetSMART_EDC_ERROR;
    {class} property SMART_ERROR: JGEDI_e_Ret read _GetSMART_ERROR;
    {class} property SMART_INVALID_ATR: JGEDI_e_Ret read _GetSMART_INVALID_ATR;
    {class} property SMART_MUTE: JGEDI_e_Ret read _GetSMART_MUTE;
    {class} property SMART_NOT_ACTIVATED: JGEDI_e_Ret read _GetSMART_NOT_ACTIVATED;
    {class} property SMART_PARITY_ERROR: JGEDI_e_Ret read _GetSMART_PARITY_ERROR;
    {class} property SMART_POWER_FAILED: JGEDI_e_Ret read _GetSMART_POWER_FAILED;
    {class} property SMART_PROCEDURE_BYTE_CONFLICT: JGEDI_e_Ret read _GetSMART_PROCEDURE_BYTE_CONFLICT;
    {class} property SMART_PTS_RESPONSE_ERROR: JGEDI_e_Ret read _GetSMART_PTS_RESPONSE_ERROR;
    {class} property SMART_TA1_NOT_SUPPORTED: JGEDI_e_Ret read _GetSMART_TA1_NOT_SUPPORTED;
    {class} property SYS_ERROR: JGEDI_e_Ret read _GetSYS_ERROR;
    {class} property TEST_FAIL: JGEDI_e_Ret read _GetTEST_FAIL;
    {class} property TIMEOUT: JGEDI_e_Ret read _GetTIMEOUT;
    {class} property USB_ALREADY_OPEN: JGEDI_e_Ret read _GetUSB_ALREADY_OPEN;
    {class} property USB_BUSY: JGEDI_e_Ret read _GetUSB_BUSY;
    {class} property USB_ERROR: JGEDI_e_Ret read _GetUSB_ERROR;
    {class} property USB_NOT_OPEN: JGEDI_e_Ret read _GetUSB_NOT_OPEN;
    {class} property UTIL_ERROR: JGEDI_e_Ret read _GetUTIL_ERROR;
    {class} property WIFI_CMD_FAIL: JGEDI_e_Ret read _GetWIFI_CMD_FAIL;
    {class} property WIFI_CONNECT_FAILED: JGEDI_e_Ret read _GetWIFI_CONNECT_FAILED;
    {class} property WIFI_ERROR: JGEDI_e_Ret read _GetWIFI_ERROR;
    {class} property WIFI_INVALID_CONFIG: JGEDI_e_Ret read _GetWIFI_INVALID_CONFIG;
    {class} property WIFI_NOT_OPEN: JGEDI_e_Ret read _GetWIFI_NOT_OPEN;
    {class} property WIFI_PROCESSING: JGEDI_e_Ret read _GetWIFI_PROCESSING;
    {class} property WIFI_SCAN_FAILED: JGEDI_e_Ret read _GetWIFI_SCAN_FAILED;
  end;

  [JavaSignature('br/com/gertec/gedi/enums/GEDI_e_Ret')]
  JGEDI_e_Ret = interface(JEnum)
    ['{8CA143CE-F71D-4338-8FBB-8B4863729BF6}']
  end;
  TJGEDI_e_Ret = class(TJavaGenericImport<JGEDI_e_RetClass, JGEDI_e_Ret>) end;

  JGediExceptionClass = interface(JExceptionClass)
    ['{01EBB695-DBA6-4812-B81C-1C33437290F0}']
    {class} function getErrorCode: JGEDI_e_Ret; cdecl;//Deprecated
    {class} function init(P1: JGEDI_e_Ret): JGediException; cdecl; overload;//Deprecated
    {class} function init(P1: Integer): JGediException; cdecl; overload;//Deprecated
    {class} function init(P1: JGEDI_e_Ret; P2: JString): JGediException; cdecl; overload;//Deprecated
    {class} function init(P1: JGEDI_e_Ret; P2: JThrowable): JGediException; cdecl; overload;//Deprecated
    {class} function init(P1: Integer; P2: JString): JGediException; cdecl; overload;//Deprecated
    {class} function init(P1: Integer; P2: JThrowable): JGediException; cdecl; overload;//Deprecated
    {class} function init(P1: JGEDI_e_Ret; P2: JString; P3: JThrowable): JGediException; cdecl; overload;//Deprecated
    {class} function init(P1: Integer; P2: JString; P3: JThrowable): JGediException; cdecl; overload;//Deprecated
    {class} function toString: JString; cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/exceptions/GediException')]
  JGediException = interface(JException)
    ['{5308FB59-CBAF-4904-85F2-AB2802E07A20}']
  end;
  TJGediException = class(TJavaGenericImport<JGediExceptionClass, JGediException>) end;

  Jgedi_fClass = interface(JObjectClass)
    ['{6BF3EF4B-6171-4294-B605-CA1B38247EC1}']
    {class} function _Geta: JButton; cdecl;
    {class} function _Getb: JButton; cdecl;
    {class} procedure _Setb(Value: JButton); cdecl;
    {class} function _Getc: JButton; cdecl;
    {class} procedure _Setc(Value: JButton); cdecl;
    {class} function _Getd: JButton; cdecl;
    {class} procedure _Setd(Value: JButton); cdecl;
    {class} function _Gete: JButton; cdecl;
    {class} procedure _Sete(Value: JButton); cdecl;
    {class} function _Getf: JButton; cdecl;
    {class} procedure _Setf(Value: JButton); cdecl;
    {class} function _Getg: JButton; cdecl;
    {class} procedure _Setg(Value: JButton); cdecl;
    {class} function _Geth: JButton; cdecl;
    {class} procedure _Seth(Value: JButton); cdecl;
    {class} function _Geti: JButton; cdecl;
    {class} procedure _Seti(Value: JButton); cdecl;
    {class} function _Getj: JButton; cdecl;
    {class} procedure _Setj(Value: JButton); cdecl;
    {class} function _Getk: JButton; cdecl;
    {class} procedure _Setk(Value: JButton); cdecl;
    {class} function _Getl: JButton; cdecl;
    {class} procedure _Setl(Value: JButton); cdecl;
    {class} function _Getm: JButton; cdecl;
    {class} procedure _Setm(Value: JButton); cdecl;
    {class} function _Getn: JActivity; cdecl;
    {class} procedure _Setn(Value: JActivity); cdecl;
    {class} function a: Boolean; cdecl; overload;//Deprecated
    {class} function a(P1: Integer): JButton; cdecl; overload;//Deprecated
    {class} function b: Jgedi_f; cdecl;//Deprecated
    {class} function clone: JObject; cdecl;//Deprecated
    {class} function init: Jgedi_f; cdecl; overload;//Deprecated
    {class} function init(P1: JGEDI_KBD_st_Info): Jgedi_f; cdecl; overload;//Deprecated
    {class} function init(P1: JButton; P2: JButton; P3: JButton; P4: JButton; P5: JButton; P6: JButton; P7: JButton; P8: JButton; P9: JButton; P10: JButton; P11: JButton; P12: JButton; P13: JButton; P14: JActivity): Jgedi_f; cdecl; overload;//Deprecated

    // Alterado por Geovani
    // {class} property a: JButton read _Geta;
    // {class} property b: JButton read _Getb write _Setb;
    {class} property a_1: JButton read _Geta;
    {class} property b_1: JButton read _Getb write _Setb;

    {class} property c: JButton read _Getc write _Setc;
    {class} property d: JButton read _Getd write _Setd;
    {class} property e: JButton read _Gete write _Sete;
    {class} property f: JButton read _Getf write _Setf;
    {class} property g: JButton read _Getg write _Setg;
    {class} property h: JButton read _Geth write _Seth;
    {class} property i: JButton read _Geti write _Seti;
    {class} property j: JButton read _Getj write _Setj;
    {class} property k: JButton read _Getk write _Setk;
    {class} property l: JButton read _Getl write _Setl;
    {class} property m: JButton read _Getm write _Setm;
    {class} property n: JActivity read _Getn write _Setn;
  end;

  [JavaSignature('br/com/gertec/gedi/f')]
  Jgedi_f = interface(JObject)
    ['{ACC715EA-2004-491B-9F16-9E0B316A150E}']
  end;
  TJgedi_f = class(TJavaGenericImport<Jgedi_fClass, Jgedi_f>) end;

  JILEDClass = interface(IJavaClass)
    ['{D5DA0329-E637-45F5-A4B2-18DFD50038D1}']
    {class} procedure &Set(P1: JGEDI_LED_e_Id; P2: Boolean); cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/interfaces/ILED')]
  JILED = interface(IJavaInstance)
    ['{ED916856-FFAF-4403-BFE8-CB62236EF106}']
  end;
  TJILED = class(TJavaGenericImport<JILEDClass, JILED>) end;

  Jgedi_hClass = interface(JILEDClass)
    ['{9708DB14-BEAD-4930-AD2E-D597A199E2B7}']
  end;

  [JavaSignature('br/com/gertec/gedi/h')]
  Jgedi_h = interface(JILED)
    ['{148120AC-5CF4-49E6-AE31-43F0EAC05A2F}']
  end;
  TJgedi_h = class(TJavaGenericImport<Jgedi_hClass, Jgedi_h>) end;

  JIEnumsClass = interface(IJavaClass)
    ['{28F7654E-A30C-49DF-9BCE-82F8A23B2A86}']
    {class} function getValue: Integer; cdecl;//Deprecated
  end;

  [JavaSignature('br/com/gertec/gedi/interfaces/IEnums')]
  JIEnums = interface(IJavaInstance)
    ['{9AE11535-372A-4D33-B559-8AE7E7908AFA}']
  end;
  TJIEnums = class(TJavaGenericImport<JIEnumsClass, JIEnums>) end;

  JGEDI_AUTH_st_DataClass = interface(JObjectClass)
    ['{CE162ABB-8CE4-4815-9AA9-A76064167A85}']
    {class} function _GetabHash: TJavaArray<Byte>; cdecl;
    {class} procedure _SetabHash(Value: TJavaArray<Byte>); cdecl;
    {class} function _GetabICV: TJavaArray<Byte>; cdecl;
    {class} procedure _SetabICV(Value: TJavaArray<Byte>); cdecl;
    {class} function _GetabInput: TJavaArray<Byte>; cdecl;
    {class} procedure _SetabInput(Value: TJavaArray<Byte>); cdecl;
    {class} function _GetabOutput: TJavaArray<Byte>; cdecl;
    {class} procedure _SetabOutput(Value: TJavaArray<Byte>); cdecl;
    {class} function _GeteMode: Integer; cdecl;
    {class} procedure _SeteMode(Value: Integer); cdecl;
    {class} function _GeteOperation: Integer; cdecl;
    {class} function _GetuiInputLen: Integer; cdecl;
    {class} procedure _SetuiInputLen(Value: Integer); cdecl;
    {class} function _GetuiKeyIndex: Integer; cdecl;
    {class} procedure _SetuiKeyIndex(Value: Integer); cdecl;
    {class} function init: JGEDI_AUTH_st_Data; cdecl;//Deprecated
    {class} property abHash: TJavaArray<Byte> read _GetabHash write _SetabHash;
    {class} property abICV: TJavaArray<Byte> read _GetabICV write _SetabICV;
    {class} property abInput: TJavaArray<Byte> read _GetabInput write _SetabInput;
    {class} property abOutput: TJavaArray<Byte> read _GetabOutput write _SetabOutput;
    {class} property eMode: Integer read _GeteMode write _SeteMode;
    {class} property eOperation: Integer read _GeteOperation;
    {class} property uiInputLen: Integer read _GetuiInputLen write _SetuiInputLen;
    {class} property uiKeyIndex: Integer read _GetuiKeyIndex write _SetuiKeyIndex;
  end;

  [JavaSignature('br/com/gertec/gedi/structs/GEDI_AUTH_st_Data')]
  JGEDI_AUTH_st_Data = interface(JObject)
    ['{FE9C5B48-741C-4817-9547-914187E0B678}']
  end;
  TJGEDI_AUTH_st_Data = class(TJavaGenericImport<JGEDI_AUTH_st_DataClass, JGEDI_AUTH_st_Data>) end;

  JGEDI_CLOCK_st_RTCClass = interface(JObjectClass)
    ['{CA5B1950-0EF3-4168-9122-13B3FCDB0E69}']
    {class} function _GetbDay: Byte; cdecl;
    {class} procedure _SetbDay(Value: Byte); cdecl;
    {class} function _GetbDoW: Byte; cdecl;
    {class} procedure _SetbDoW(Value: Byte); cdecl;
    {class} function _GetbHour: Byte; cdecl;
    {class} procedure _SetbHour(Value: Byte); cdecl;
    {class} function _GetbMinute: Byte; cdecl;
    {class} procedure _SetbMinute(Value: Byte); cdecl;
    {class} function _GetbMonth: Byte; cdecl;
    {class} procedure _SetbMonth(Value: Byte); cdecl;
    {class} function _GetbSecond: Byte; cdecl;
    {class} procedure _SetbSecond(Value: Byte); cdecl;
    {class} function _GetbYear: Byte; cdecl;
    {class} function init: JGEDI_CLOCK_st_RTC; cdecl; overload;//Deprecated
    {class} function init(P1: Byte; P2: Byte; P3: Byte; P4: Byte; P5: Byte; P6: Byte; P7: Byte): JGEDI_CLOCK_st_RTC; cdecl; overload;//Deprecated
    {class} property bDay: Byte read _GetbDay write _SetbDay;
    {class} property bDoW: Byte read _GetbDoW write _SetbDoW;
    {class} property bHour: Byte read _GetbHour write _SetbHour;
    {class} property bMinute: Byte read _GetbMinute write _SetbMinute;
    {class} property bMonth: Byte read _GetbMonth write _SetbMonth;
    {class} property bSecond: Byte read _GetbSecond write _SetbSecond;
    {class} property bYear: Byte read _GetbYear;
  end;

  [JavaSignature('br/com/gertec/gedi/structs/GEDI_CLOCK_st_RTC')]
  JGEDI_CLOCK_st_RTC = interface(JObject)
    ['{ECD904E6-5BB3-4A44-95F8-8F2D27C16110}']
  end;
  TJGEDI_CLOCK_st_RTC = class(TJavaGenericImport<JGEDI_CLOCK_st_RTCClass, JGEDI_CLOCK_st_RTC>) end;

  JGEDI_CL_st_ISO_PollingInfoClass = interface(JObjectClass)
    ['{389CF170-B566-4055-8A0A-D1370F2D48E6}']
    {class} function _GetabATQA: TJavaArray<Byte>; cdecl;
    {class} procedure _SetabATQA(Value: TJavaArray<Byte>); cdecl;
    {class} function _GetabATQB: TJavaArray<Byte>; cdecl;
    {class} procedure _SetabATQB(Value: TJavaArray<Byte>); cdecl;
    {class} function _GetabATS: TJavaArray<Byte>; cdecl;
    {class} procedure _SetabATS(Value: TJavaArray<Byte>); cdecl;
    {class} function _GetabATTRIBResp: TJavaArray<Byte>; cdecl;
    {class} procedure _SetabATTRIBResp(Value: TJavaArray<Byte>); cdecl;
    {class} function _GetabPUPI: TJavaArray<Byte>; cdecl;
    {class} procedure _SetabPUPI(Value: TJavaArray<Byte>); cdecl;
    {class} function _GetabUID: TJavaArray<Byte>; cdecl;
    {class} procedure _SetabUID(Value: TJavaArray<Byte>); cdecl;
    {class} function _GetbSAK: Byte; cdecl;
    {class} procedure _SetbSAK(Value: Byte); cdecl;
    {class} function _GetpeType: JGEDI_CL_e_ISO_Type; cdecl;
    {class} function init: JGEDI_CL_st_ISO_PollingInfo; cdecl;//Deprecated
    {class} property abATQA: TJavaArray<Byte> read _GetabATQA write _SetabATQA;
    {class} property abATQB: TJavaArray<Byte> read _GetabATQB write _SetabATQB;
    {class} property abATS: TJavaArray<Byte> read _GetabATS write _SetabATS;
    {class} property abATTRIBResp: TJavaArray<Byte> read _GetabATTRIBResp write _SetabATTRIBResp;
    {class} property abPUPI: TJavaArray<Byte> read _GetabPUPI write _SetabPUPI;
    {class} property abUID: TJavaArray<Byte> read _GetabUID write _SetabUID;
    {class} property bSAK: Byte read _GetbSAK write _SetbSAK;
    {class} property peType: JGEDI_CL_e_ISO_Type read _GetpeType;
  end;

  [JavaSignature('br/com/gertec/gedi/structs/GEDI_CL_st_ISO_PollingInfo')]
  JGEDI_CL_st_ISO_PollingInfo = interface(JObject)
    ['{005CDD47-35A3-41D6-B5F9-2E9214E686AD}']
    // Adicionado pelo Geovani
    {class} function _GetabATQA: TJavaArray<Byte>; cdecl;
    {class} procedure _SetabATQA(Value: TJavaArray<Byte>); cdecl;
    {class} function _GetabATQB: TJavaArray<Byte>; cdecl;
    {class} procedure _SetabATQB(Value: TJavaArray<Byte>); cdecl;
    {class} function _GetabATS: TJavaArray<Byte>; cdecl;
    {class} procedure _SetabATS(Value: TJavaArray<Byte>); cdecl;
    {class} function _GetabATTRIBResp: TJavaArray<Byte>; cdecl;
    {class} procedure _SetabATTRIBResp(Value: TJavaArray<Byte>); cdecl;
    {class} function _GetabPUPI: TJavaArray<Byte>; cdecl;
    {class} procedure _SetabPUPI(Value: TJavaArray<Byte>); cdecl;
    {class} function _GetabUID: TJavaArray<Byte>; cdecl;
    {class} procedure _SetabUID(Value: TJavaArray<Byte>); cdecl;
    {class} function _GetbSAK: Byte; cdecl;
    {class} procedure _SetbSAK(Value: Byte); cdecl;
    {class} function _GetpeType: JGEDI_CL_e_ISO_Type; cdecl;
    {class} function init: JGEDI_CL_st_ISO_PollingInfo; cdecl;//Deprecated
    {class} property abATQA: TJavaArray<Byte> read _GetabATQA write _SetabATQA;
    {class} property abATQB: TJavaArray<Byte> read _GetabATQB write _SetabATQB;
    {class} property abATS: TJavaArray<Byte> read _GetabATS write _SetabATS;
    {class} property abATTRIBResp: TJavaArray<Byte> read _GetabATTRIBResp write _SetabATTRIBResp;
    {class} property abPUPI: TJavaArray<Byte> read _GetabPUPI write _SetabPUPI;
    {class} property abUID: TJavaArray<Byte> read _GetabUID write _SetabUID;
    {class} property bSAK: Byte read _GetbSAK write _SetbSAK;
    {class} property peType: JGEDI_CL_e_ISO_Type read _GetpeType;

  end;
  TJGEDI_CL_st_ISO_PollingInfo = class(TJavaGenericImport<JGEDI_CL_st_ISO_PollingInfoClass, JGEDI_CL_st_ISO_PollingInfo>) end;

  JGEDI_CL_st_MF_ActivateInfoClass = interface(JObjectClass)
    ['{4B482880-A942-49E4-823C-BF19533A5877}']
    {class} function _GetabUID: TJavaArray<Byte>; cdecl;
    {class} procedure _SetabUID(Value: TJavaArray<Byte>); cdecl;
    {class} function _Gettype: JGEDI_CL_e_MF_Type; cdecl;
    {class} function init: JGEDI_CL_st_MF_ActivateInfo; cdecl;//Deprecated
    {class} property abUID: TJavaArray<Byte> read _GetabUID write _SetabUID;
    {class} property &type: JGEDI_CL_e_MF_Type read _Gettype;
  end;

  [JavaSignature('br/com/gertec/gedi/structs/GEDI_CL_st_MF_ActivateInfo')]
  JGEDI_CL_st_MF_ActivateInfo = interface(JObject)
    ['{45C308AE-E52C-4FCD-8350-28A337408E82}']
  end;
  TJGEDI_CL_st_MF_ActivateInfo = class(TJavaGenericImport<JGEDI_CL_st_MF_ActivateInfoClass, JGEDI_CL_st_MF_ActivateInfo>) end;

  JGEDI_CL_st_MF_KeyClass = interface(JObjectClass)
    ['{65F1520E-75FB-44FA-867E-1C99E8636D7A}']
    {class} function _GetabValue: TJavaArray<Byte>; cdecl;
    {class} procedure _SetabValue(Value: TJavaArray<Byte>); cdecl;        // Criado por Geovani
    {class} function _GeteType: JGEDI_CL_e_MF_KeyType; cdecl;
    {class} procedure _SeteType(Value: JGEDI_CL_e_MF_KeyType); cdecl;
    {class} function init: JGEDI_CL_st_MF_Key; cdecl;//Deprecated
    // Alterado por Geovani
    // {class} property abValue: TJavaArray<Byte> read _GetabValue;
    {class} property abValue: TJavaArray<Byte> read _GetabValue write _SetabValue;
    {class} property eType: JGEDI_CL_e_MF_KeyType read _GeteType write _SeteType;
  end;

  [JavaSignature('br/com/gertec/gedi/structs/GEDI_CL_st_MF_Key')]
  JGEDI_CL_st_MF_Key = interface(JObject)
    ['{A90D909B-E4DA-4981-92E1-9E8A6DDABC03}']
    // Adicionado por Geovani
    {class} function _GetabValue: TJavaArray<Byte>; cdecl;
    {class} procedure _SetabValue(Value: TJavaArray<Byte>); cdecl;        // Criado por Geovani
    {class} function _GeteType: JGEDI_CL_e_MF_KeyType; cdecl;
    {class} procedure _SeteType(Value: JGEDI_CL_e_MF_KeyType); cdecl;
    {class} function init: JGEDI_CL_st_MF_Key; cdecl;//Deprecated
    {class} property abValue: TJavaArray<Byte> read _GetabValue write _SetabValue;
    {class} property eType: JGEDI_CL_e_MF_KeyType read _GeteType write _SeteType;
    // Fim

  end;
  TJGEDI_CL_st_MF_Key = class(TJavaGenericImport<JGEDI_CL_st_MF_KeyClass, JGEDI_CL_st_MF_Key>) end;

  JGEDI_CL_st_ResetEMVInfoClass = interface(JObjectClass)
    ['{D02B88AD-FC2D-4E46-8BB3-AD38D5355FA0}']
    {class} function _GetabATR: TJavaArray<Byte>; cdecl;
    {class} function _GetpeCardType: JGEDI_CL_e_ISO_Type; cdecl;
    {class} procedure _SetpeCardType(Value: JGEDI_CL_e_ISO_Type); cdecl;
    {class} function init: JGEDI_CL_st_ResetEMVInfo; cdecl;//Deprecated
    {class} property abATR: TJavaArray<Byte> read _GetabATR;
    {class} property peCardType: JGEDI_CL_e_ISO_Type read _GetpeCardType write _SetpeCardType;
  end;

  [JavaSignature('br/com/gertec/gedi/structs/GEDI_CL_st_ResetEMVInfo')]
  JGEDI_CL_st_ResetEMVInfo = interface(JObject)
    ['{4551A75A-3AC2-4EFA-AB18-6B9F21E9D3C7}']
  end;
  TJGEDI_CL_st_ResetEMVInfo = class(TJavaGenericImport<JGEDI_CL_st_ResetEMVInfoClass, JGEDI_CL_st_ResetEMVInfo>) end;

  JGEDI_CRYPT_st_RSAKeyGenClass = interface(JObjectClass)
    ['{FC21C534-C804-43D7-8596-8CB2E65B0F58}']
    {class} function _GetabModulus: TJavaArray<Byte>; cdecl;
    {class} procedure _SetabModulus(Value: TJavaArray<Byte>); cdecl;
    {class} function _GetabPrivateKey: TJavaArray<Byte>; cdecl;
    {class} procedure _SetabPrivateKey(Value: TJavaArray<Byte>); cdecl;
    {class} function _GetabPublicKey: TJavaArray<Byte>; cdecl;
    {class} procedure _SetabPublicKey(Value: TJavaArray<Byte>); cdecl;
    {class} function _GetbVersion: Byte; cdecl;
    {class} function _GetuiBits: Integer; cdecl;
    {class} procedure _SetuiBits(Value: Integer); cdecl;
    {class} function _GetuiModulusLen: Integer; cdecl;
    {class} procedure _SetuiModulusLen(Value: Integer); cdecl;
    {class} function _GetuiPrivateKeyLen: Integer; cdecl;
    {class} procedure _SetuiPrivateKeyLen(Value: Integer); cdecl;
    {class} function _GetuiPublicKeyLen: Integer; cdecl;
    {class} procedure _SetuiPublicKeyLen(Value: Integer); cdecl;
    {class} function init: JGEDI_CRYPT_st_RSAKeyGen; cdecl;//Deprecated
    {class} property abModulus: TJavaArray<Byte> read _GetabModulus write _SetabModulus;
    {class} property abPrivateKey: TJavaArray<Byte> read _GetabPrivateKey write _SetabPrivateKey;
    {class} property abPublicKey: TJavaArray<Byte> read _GetabPublicKey write _SetabPublicKey;
    {class} property bVersion: Byte read _GetbVersion;
    {class} property uiBits: Integer read _GetuiBits write _SetuiBits;
    {class} property uiModulusLen: Integer read _GetuiModulusLen write _SetuiModulusLen;
    {class} property uiPrivateKeyLen: Integer read _GetuiPrivateKeyLen write _SetuiPrivateKeyLen;
    {class} property uiPublicKeyLen: Integer read _GetuiPublicKeyLen write _SetuiPublicKeyLen;
  end;

  [JavaSignature('br/com/gertec/gedi/structs/GEDI_CRYPT_st_RSAKeyGen')]
  JGEDI_CRYPT_st_RSAKeyGen = interface(JObject)
    ['{DE134DC8-E6D9-492F-B063-F3BD6F062AEE}']
  end;
  TJGEDI_CRYPT_st_RSAKeyGen = class(TJavaGenericImport<JGEDI_CRYPT_st_RSAKeyGenClass, JGEDI_CRYPT_st_RSAKeyGen>) end;

  JGEDI_KBD_st_InfoClass = interface(JObjectClass)
    ['{3B825B18-EEBC-4966-AA17-7730C77E745D}']
    {class} function _Getactivity: JActivity; cdecl;
    {class} procedure _Setactivity(Value: JActivity); cdecl;
    {class} function _Getbtn0: JButton; cdecl;
    {class} function _Getbtn1: JButton; cdecl;
    {class} procedure _Setbtn1(Value: JButton); cdecl;
    {class} function _Getbtn2: JButton; cdecl;
    {class} procedure _Setbtn2(Value: JButton); cdecl;
    {class} function _Getbtn3: JButton; cdecl;
    {class} procedure _Setbtn3(Value: JButton); cdecl;
    {class} function _Getbtn4: JButton; cdecl;
    {class} procedure _Setbtn4(Value: JButton); cdecl;
    {class} function _Getbtn5: JButton; cdecl;
    {class} procedure _Setbtn5(Value: JButton); cdecl;
    {class} function _Getbtn6: JButton; cdecl;
    {class} procedure _Setbtn6(Value: JButton); cdecl;
    {class} function _Getbtn7: JButton; cdecl;
    {class} procedure _Setbtn7(Value: JButton); cdecl;
    {class} function _Getbtn8: JButton; cdecl;
    {class} procedure _Setbtn8(Value: JButton); cdecl;
    {class} function _Getbtn9: JButton; cdecl;
    {class} procedure _Setbtn9(Value: JButton); cdecl;
    {class} function _GetbtnCancel: JButton; cdecl;
    {class} procedure _SetbtnCancel(Value: JButton); cdecl;
    {class} function _GetbtnClear: JButton; cdecl;
    {class} procedure _SetbtnClear(Value: JButton); cdecl;
    {class} function _GetbtnConfirm: JButton; cdecl;
    {class} procedure _SetbtnConfirm(Value: JButton); cdecl;
    {class} function clone: JGEDI_KBD_st_Info; cdecl;//Deprecated
    {class} function getButtonByIndex(P1: Integer): JButton; cdecl;//Deprecated
    {class} function init(P1: JButton; P2: JButton; P3: JButton; P4: JButton; P5: JButton; P6: JButton; P7: JButton; P8: JButton; P9: JButton; P10: JButton; P11: JButton; P12: JButton; P13: JButton; P14: JActivity): JGEDI_KBD_st_Info; cdecl;//Deprecated
    {class} property activity: JActivity read _Getactivity write _Setactivity;
    {class} property btn0: JButton read _Getbtn0;
    {class} property btn1: JButton read _Getbtn1 write _Setbtn1;
    {class} property btn2: JButton read _Getbtn2 write _Setbtn2;
    {class} property btn3: JButton read _Getbtn3 write _Setbtn3;
    {class} property btn4: JButton read _Getbtn4 write _Setbtn4;
    {class} property btn5: JButton read _Getbtn5 write _Setbtn5;
    {class} property btn6: JButton read _Getbtn6 write _Setbtn6;
    {class} property btn7: JButton read _Getbtn7 write _Setbtn7;
    {class} property btn8: JButton read _Getbtn8 write _Setbtn8;
    {class} property btn9: JButton read _Getbtn9 write _Setbtn9;
    {class} property btnCancel: JButton read _GetbtnCancel write _SetbtnCancel;
    {class} property btnClear: JButton read _GetbtnClear write _SetbtnClear;
    {class} property btnConfirm: JButton read _GetbtnConfirm write _SetbtnConfirm;
  end;

  [JavaSignature('br/com/gertec/gedi/structs/GEDI_KBD_st_Info')]
  JGEDI_KBD_st_Info = interface(JObject)
    ['{CA1CB6F1-673A-45A9-B9DD-186C5D24BECC}']
  end;
  TJGEDI_KBD_st_Info = class(TJavaGenericImport<JGEDI_KBD_st_InfoClass, JGEDI_KBD_st_Info>) end;

  JGEDI_KMS_st_CapturePINBlockInfoClass = interface(JObjectClass)
    ['{2F83BEAA-979C-44BF-8651-0D623F7FE48A}']
    {class} function _GetastPB: JList; cdecl;
    {class} procedure _SetastPB(Value: JList); cdecl;
    {class} function _GetpstControl: JGEDI_KMS_st_Control; cdecl;
    {class} function _GetpstData: JGEDI_KMS_st_Data; cdecl;
    {class} procedure _SetpstData(Value: JGEDI_KMS_st_Data); cdecl;
    {class} function init(P1: JGEDI_KMS_st_Control; P2: JGEDI_KMS_st_Data; P3: JList): JGEDI_KMS_st_CapturePINBlockInfo; cdecl;//Deprecated
    {class} property astPB: JList read _GetastPB write _SetastPB;
    {class} property pstControl: JGEDI_KMS_st_Control read _GetpstControl;
    {class} property pstData: JGEDI_KMS_st_Data read _GetpstData write _SetpstData;
  end;

  [JavaSignature('br/com/gertec/gedi/structs/GEDI_KMS_st_CapturePINBlockInfo')]
  JGEDI_KMS_st_CapturePINBlockInfo = interface(JObject)
    ['{D65802E5-A868-4FD4-B2E9-BED64C2FA50D}']
  end;
  TJGEDI_KMS_st_CapturePINBlockInfo = class(TJavaGenericImport<JGEDI_KMS_st_CapturePINBlockInfoClass, JGEDI_KMS_st_CapturePINBlockInfo>) end;

  JGEDI_KMS_st_ControlClass = interface(JObjectClass)
    ['{C10B5C13-2188-4191-B9CF-0A7BB42C380C}']
    {class} function _GetacClearPIN: JString; cdecl;
    {class} procedure _SetacClearPIN(Value: JString); cdecl;
    {class} function _GetbVersion: Byte; cdecl;
    {class} function _GetboAutoEnd: Boolean; cdecl;
    {class} procedure _SetboAutoEnd(Value: Boolean); cdecl;
    {class} function _GetboClearSingle: Boolean; cdecl;
    {class} procedure _SetboClearSingle(Value: Boolean); cdecl;
    {class} function _GetboNullPIN: Boolean; cdecl;
    {class} procedure _SetboNullPIN(Value: Boolean); cdecl;
    {class} function _Getcb: JGEDI_KMS_st_Control_Callbacks; cdecl;
    {class} procedure _Setcb(Value: JGEDI_KMS_st_Control_Callbacks); cdecl;
    {class} function _GetuiEventTimeout: Integer; cdecl;
    {class} procedure _SetuiEventTimeout(Value: Integer); cdecl;
    {class} function _GetuiGlobalTimeout: Integer; cdecl;
    {class} procedure _SetuiGlobalTimeout(Value: Integer); cdecl;
    {class} function _GetuiMaxPINLen: Integer; cdecl;
    {class} procedure _SetuiMaxPINLen(Value: Integer); cdecl;
    {class} function _GetuiMinPINLen: Integer; cdecl;
    {class} procedure _SetuiMinPINLen(Value: Integer); cdecl;
    {class} function init: JGEDI_KMS_st_Control; cdecl; overload;//Deprecated
    {class} function init(P1: Byte; P2: Integer; P3: Integer; P4: Boolean; P5: Boolean; P6: Boolean; P7: Integer; P8: Integer; P9: JGEDI_KMS_st_Control_Callbacks): JGEDI_KMS_st_Control; cdecl; overload;//Deprecated
    {class} property acClearPIN: JString read _GetacClearPIN write _SetacClearPIN;
    {class} property bVersion: Byte read _GetbVersion;
    {class} property boAutoEnd: Boolean read _GetboAutoEnd write _SetboAutoEnd;
    {class} property boClearSingle: Boolean read _GetboClearSingle write _SetboClearSingle;
    {class} property boNullPIN: Boolean read _GetboNullPIN write _SetboNullPIN;
    {class} property cb: JGEDI_KMS_st_Control_Callbacks read _Getcb write _Setcb;
    {class} property uiEventTimeout: Integer read _GetuiEventTimeout write _SetuiEventTimeout;
    {class} property uiGlobalTimeout: Integer read _GetuiGlobalTimeout write _SetuiGlobalTimeout;
    {class} property uiMaxPINLen: Integer read _GetuiMaxPINLen write _SetuiMaxPINLen;
    {class} property uiMinPINLen: Integer read _GetuiMinPINLen write _SetuiMinPINLen;
  end;

  [JavaSignature('br/com/gertec/gedi/structs/GEDI_KMS_st_Control')]
  JGEDI_KMS_st_Control = interface(JObject)
    ['{13003544-AB6E-4CC2-A03B-1BB1185F500B}']
  end;
  TJGEDI_KMS_st_Control = class(TJavaGenericImport<JGEDI_KMS_st_ControlClass, JGEDI_KMS_st_Control>) end;

  JGEDI_KMS_st_DataClass = interface(JObjectClass)
    ['{263FDACF-7BBA-4636-944C-D993548845BB}']
    {class} function _GetabICV: TJavaArray<Byte>; cdecl;
    {class} procedure _SetabICV(Value: TJavaArray<Byte>); cdecl;
    {class} function _GetabInput: TJavaArray<Byte>; cdecl;
    {class} procedure _SetabInput(Value: TJavaArray<Byte>); cdecl;
    {class} function _GetabKSN: TJavaArray<Byte>; cdecl;
    {class} procedure _SetabKSN(Value: TJavaArray<Byte>); cdecl;
    {class} function _GetabOutput: TJavaArray<Byte>; cdecl;
    {class} procedure _SetabOutput(Value: TJavaArray<Byte>); cdecl;
    {class} function _GetabSK: TJavaArray<Byte>; cdecl;
    {class} procedure _SetabSK(Value: TJavaArray<Byte>); cdecl;
    {class} function _GetbVersion: Byte; cdecl;
    {class} function _GeteKeyType: JGEDI_KMS_e_KEYTYPE; cdecl;
    {class} procedure _SeteKeyType(Value: JGEDI_KMS_e_KEYTYPE); cdecl;
    {class} function _GeteMode: JGEDI_KMS_e_EncMode; cdecl;
    {class} procedure _SeteMode(Value: JGEDI_KMS_e_EncMode); cdecl;
    {class} function _GeteOperation: JGEDI_KMS_e_OP; cdecl;
    {class} procedure _SeteOperation(Value: JGEDI_KMS_e_OP); cdecl;
    {class} function _GetuiKeyIndex: Integer; cdecl;
    {class} procedure _SetuiKeyIndex(Value: Integer); cdecl;
    {class} function init: JGEDI_KMS_st_Data; cdecl; overload;//Deprecated
    {class} function init(P1: Byte; P2: JGEDI_KMS_e_OP; P3: JGEDI_KMS_e_KEYTYPE; P4: Integer; P5: JGEDI_KMS_e_EncMode; P6: TJavaArray<Byte>; P7: TJavaArray<Byte>; P8: TJavaArray<Byte>): JGEDI_KMS_st_Data; cdecl; overload;//Deprecated
    {class} property abICV: TJavaArray<Byte> read _GetabICV write _SetabICV;
    {class} property abInput: TJavaArray<Byte> read _GetabInput write _SetabInput;
    {class} property abKSN: TJavaArray<Byte> read _GetabKSN write _SetabKSN;
    {class} property abOutput: TJavaArray<Byte> read _GetabOutput write _SetabOutput;
    {class} property abSK: TJavaArray<Byte> read _GetabSK write _SetabSK;
    {class} property bVersion: Byte read _GetbVersion;
    {class} property eKeyType: JGEDI_KMS_e_KEYTYPE read _GeteKeyType write _SeteKeyType;
    {class} property eMode: JGEDI_KMS_e_EncMode read _GeteMode write _SeteMode;
    {class} property eOperation: JGEDI_KMS_e_OP read _GeteOperation write _SeteOperation;
    {class} property uiKeyIndex: Integer read _GetuiKeyIndex write _SetuiKeyIndex;
  end;

  [JavaSignature('br/com/gertec/gedi/structs/GEDI_KMS_st_Data')]
  JGEDI_KMS_st_Data = interface(JObject)
    ['{BEC30C1F-461A-4F87-A81C-924E43C5D890}']
  end;
  TJGEDI_KMS_st_Data = class(TJavaGenericImport<JGEDI_KMS_st_DataClass, JGEDI_KMS_st_Data>) end;

  JGEDI_KMS_st_KBClass = interface(JObjectClass)
    ['{D658CA3C-EEC3-4EB4-B85F-FCF8E7AEE557}']
    {class} function _GetabKCV: TJavaArray<Byte>; cdecl;
    {class} procedure _SetabKCV(Value: TJavaArray<Byte>); cdecl;
    {class} function _GetabKEKIndex: TJavaArray<Byte>; cdecl;
    {class} procedure _SetabKEKIndex(Value: TJavaArray<Byte>); cdecl;
    {class} function _GetabKSN: TJavaArray<Byte>; cdecl;
    {class} procedure _SetabKSN(Value: TJavaArray<Byte>); cdecl;
    {class} function _GetabKey: TJavaArray<Byte>; cdecl;
    {class} procedure _SetabKey(Value: TJavaArray<Byte>); cdecl;
    {class} function _GetabKeyIndex: TJavaArray<Byte>; cdecl;
    {class} procedure _SetabKeyIndex(Value: TJavaArray<Byte>); cdecl;
    {class} function _GetabKeyLen: TJavaArray<Byte>; cdecl;
    {class} function _GetabRND: TJavaArray<Byte>; cdecl;
    {class} procedure _SetabRND(Value: TJavaArray<Byte>); cdecl;
    {class} function _GetbKEKType: JGEDI_KMS_e_KEYTYPE; cdecl;
    {class} procedure _SetbKEKType(Value: JGEDI_KMS_e_KEYTYPE); cdecl;
    {class} function _GetbKeyPurpose: JGEDI_KMS_e_KEYPURPOSE; cdecl;
    {class} procedure _SetbKeyPurpose(Value: JGEDI_KMS_e_KEYPURPOSE); cdecl;
    {class} function _GetbKeyType: JGEDI_KMS_e_KEYTYPE; cdecl;
    {class} procedure _SetbKeyType(Value: JGEDI_KMS_e_KEYTYPE); cdecl;
    {class} function init: JGEDI_KMS_st_KB; cdecl;//Deprecated
    {class} property abKCV: TJavaArray<Byte> read _GetabKCV write _SetabKCV;
    {class} property abKEKIndex: TJavaArray<Byte> read _GetabKEKIndex write _SetabKEKIndex;
    {class} property abKSN: TJavaArray<Byte> read _GetabKSN write _SetabKSN;
    {class} property abKey: TJavaArray<Byte> read _GetabKey write _SetabKey;
    {class} property abKeyIndex: TJavaArray<Byte> read _GetabKeyIndex write _SetabKeyIndex;
    {class} property abKeyLen: TJavaArray<Byte> read _GetabKeyLen;
    {class} property abRND: TJavaArray<Byte> read _GetabRND write _SetabRND;
    {class} property bKEKType: JGEDI_KMS_e_KEYTYPE read _GetbKEKType write _SetbKEKType;
    {class} property bKeyPurpose: JGEDI_KMS_e_KEYPURPOSE read _GetbKeyPurpose write _SetbKeyPurpose;
    {class} property bKeyType: JGEDI_KMS_e_KEYTYPE read _GetbKeyType write _SetbKeyType;
  end;

  [JavaSignature('br/com/gertec/gedi/structs/GEDI_KMS_st_KB')]
  JGEDI_KMS_st_KB = interface(JObject)
    ['{03529752-0499-4E2D-8DA3-7CC63153C5AB}']
  end;
  TJGEDI_KMS_st_KB = class(TJavaGenericImport<JGEDI_KMS_st_KBClass, JGEDI_KMS_st_KB>) end;

  JGEDI_KMS_st_PINBlockClass = interface(JObjectClass)
    ['{CB13E107-C79A-49F5-B150-33127ADC9CA5}']
    {class} function _GetabEncPINBlock: TJavaArray<Byte>; cdecl;
    {class} procedure _SetabEncPINBlock(Value: TJavaArray<Byte>); cdecl;
    {class} function _GetabSeq: TJavaArray<Byte>; cdecl;
    {class} procedure _SetabSeq(Value: TJavaArray<Byte>); cdecl;
    {class} function _GetbCN: Byte; cdecl;
    {class} procedure _SetbCN(Value: Byte); cdecl;
    {class} function _GetbVersion: Byte; cdecl;
    {class} function _GetcPad: Byte; cdecl;
    {class} procedure _SetcPad(Value: Byte); cdecl;
    {class} function _GeteBlockType: JGEDI_KMS_e_BLOCKTYPE; cdecl;
    {class} procedure _SeteBlockType(Value: JGEDI_KMS_e_BLOCKTYPE); cdecl;
    {class} function _GetszPan: JString; cdecl;
    {class} procedure _SetszPan(Value: JString); cdecl;
    {class} function init: JGEDI_KMS_st_PINBlock; cdecl; overload;//Deprecated
    {class} function init(P1: Byte; P2: JGEDI_KMS_e_BLOCKTYPE; P3: JString; P4: TJavaArray<Byte>; P5: Byte; P6: Byte): JGEDI_KMS_st_PINBlock; cdecl; overload;//Deprecated
    {class} property abEncPINBlock: TJavaArray<Byte> read _GetabEncPINBlock write _SetabEncPINBlock;
    {class} property abSeq: TJavaArray<Byte> read _GetabSeq write _SetabSeq;
    {class} property bCN: Byte read _GetbCN write _SetbCN;
    {class} property bVersion: Byte read _GetbVersion;
    {class} property cPad: Byte read _GetcPad write _SetcPad;
    {class} property eBlockType: JGEDI_KMS_e_BLOCKTYPE read _GeteBlockType write _SeteBlockType;
    {class} property szPan: JString read _GetszPan write _SetszPan;
  end;

  [JavaSignature('br/com/gertec/gedi/structs/GEDI_KMS_st_PINBlock')]
  JGEDI_KMS_st_PINBlock = interface(JObject)
    ['{63FBE2FA-E174-4E2F-AD5A-D87F262A71B5}']
  end;
  TJGEDI_KMS_st_PINBlock = class(TJavaGenericImport<JGEDI_KMS_st_PINBlockClass, JGEDI_KMS_st_PINBlock>) end;

  JGEDI_KMS_st_SaveKeyClass = interface(JObjectClass)
    ['{51D8F51F-164E-4C11-9A4D-D7C6FB3A41AF}']
    {class} function _GetabKSN: TJavaArray<Byte>; cdecl;
    {class} procedure _SetabKSN(Value: TJavaArray<Byte>); cdecl;
    {class} function _GetabKey: TJavaArray<Byte>; cdecl;
    {class} procedure _SetabKey(Value: TJavaArray<Byte>); cdecl;
    {class} function _GetbVersion: Byte; cdecl;
    {class} function _GeteKeyPurpose: JGEDI_KMS_e_KEYPURPOSE; cdecl;
    {class} procedure _SeteKeyPurpose(Value: JGEDI_KMS_e_KEYPURPOSE); cdecl;
    {class} function _GeteKeyType: JGEDI_KMS_e_KEYTYPE; cdecl;
    {class} procedure _SeteKeyType(Value: JGEDI_KMS_e_KEYTYPE); cdecl;
    {class} function _GetuiKeyIndex: Integer; cdecl;
    {class} procedure _SetuiKeyIndex(Value: Integer); cdecl;
    {class} function init: JGEDI_KMS_st_SaveKey; cdecl; overload;//Deprecated
    {class} function init(P1: Byte; P2: JGEDI_KMS_e_KEYTYPE; P3: JGEDI_KMS_e_KEYPURPOSE; P4: Integer; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>): JGEDI_KMS_st_SaveKey; cdecl; overload;//Deprecated
    {class} property abKSN: TJavaArray<Byte> read _GetabKSN write _SetabKSN;
    {class} property abKey: TJavaArray<Byte> read _GetabKey write _SetabKey;
    {class} property bVersion: Byte read _GetbVersion;
    {class} property eKeyPurpose: JGEDI_KMS_e_KEYPURPOSE read _GeteKeyPurpose write _SeteKeyPurpose;
    {class} property eKeyType: JGEDI_KMS_e_KEYTYPE read _GeteKeyType write _SeteKeyType;
    {class} property uiKeyIndex: Integer read _GetuiKeyIndex write _SetuiKeyIndex;
  end;

  [JavaSignature('br/com/gertec/gedi/structs/GEDI_KMS_st_SaveKey')]
  JGEDI_KMS_st_SaveKey = interface(JObject)
    ['{2A8A94C0-8E45-43C7-969F-E7465E84855A}']
  end;
  TJGEDI_KMS_st_SaveKey = class(TJavaGenericImport<JGEDI_KMS_st_SaveKeyClass, JGEDI_KMS_st_SaveKey>) end;

  JGEDI_MSR_st_LastErrorsClass = interface(JObjectClass)
    ['{0BA08525-4D5A-4B51-99F9-F3163B6D26F6}']
    {class} function _GetpeTk1Err: JGEDI_MSR_e_Status; cdecl;
    {class} function _GetpeTk2Err: JGEDI_MSR_e_Status; cdecl;
    {class} procedure _SetpeTk2Err(Value: JGEDI_MSR_e_Status); cdecl;
    {class} function _GetpeTk3Err: JGEDI_MSR_e_Status; cdecl;
    {class} procedure _SetpeTk3Err(Value: JGEDI_MSR_e_Status); cdecl;
    {class} function init: JGEDI_MSR_st_LastErrors; cdecl;//Deprecated
    {class} property peTk1Err: JGEDI_MSR_e_Status read _GetpeTk1Err;
    {class} property peTk2Err: JGEDI_MSR_e_Status read _GetpeTk2Err write _SetpeTk2Err;
    {class} property peTk3Err: JGEDI_MSR_e_Status read _GetpeTk3Err write _SetpeTk3Err;
  end;

  [JavaSignature('br/com/gertec/gedi/structs/GEDI_MSR_st_LastErrors')]
  JGEDI_MSR_st_LastErrors = interface(JObject)
    ['{1CB895FF-9068-413D-8824-95D05BC525D0}']
  end;
  TJGEDI_MSR_st_LastErrors = class(TJavaGenericImport<JGEDI_MSR_st_LastErrorsClass, JGEDI_MSR_st_LastErrors>) end;

  JGEDI_MSR_st_TracksClass = interface(JObjectClass)
    ['{AC334179-912B-404C-BFF0-31A85E6552B7}']
    {class} function _GetabTk1Buf: TJavaArray<Byte>; cdecl;
    {class} function _GetabTk2Buf: TJavaArray<Byte>; cdecl;
    {class} procedure _SetabTk2Buf(Value: TJavaArray<Byte>); cdecl;
    {class} function _GetabTk3Buf: TJavaArray<Byte>; cdecl;
    {class} procedure _SetabTk3Buf(Value: TJavaArray<Byte>); cdecl;
    {class} function init: JGEDI_MSR_st_Tracks; cdecl;//Deprecated
    {class} property abTk1Buf: TJavaArray<Byte> read _GetabTk1Buf;
    {class} property abTk2Buf: TJavaArray<Byte> read _GetabTk2Buf write _SetabTk2Buf;
    {class} property abTk3Buf: TJavaArray<Byte> read _GetabTk3Buf write _SetabTk3Buf;
  end;

  [JavaSignature('br/com/gertec/gedi/structs/GEDI_MSR_st_Tracks')]
  JGEDI_MSR_st_Tracks = interface(JObject)
    ['{81123B4E-DD79-43A7-81C7-BB6CBF50DE31}']
  end;
  TJGEDI_MSR_st_Tracks = class(TJavaGenericImport<JGEDI_MSR_st_TracksClass, JGEDI_MSR_st_Tracks>) end;

  JGEDI_PRNTR_st_BarCodeConfigClass = interface(JObjectClass)
    ['{0B1676D8-6D94-4635-A5AC-71E7E1DC41A8}']
    {class} function _GetbarCodeType: JGEDI_PRNTR_e_BarCodeType; cdecl;
    {class} function _Getheight: Integer; cdecl;
    {class} procedure _Setheight(Value: Integer); cdecl;
    {class} function _Getwidth: Integer; cdecl;
    {class} procedure _Setwidth(Value: Integer); cdecl;
    {class} function init: JGEDI_PRNTR_st_BarCodeConfig; cdecl; overload;//Deprecated
    {class} function init(P1: JGEDI_PRNTR_e_BarCodeType; P2: Integer): JGEDI_PRNTR_st_BarCodeConfig; cdecl; overload;//Deprecated
    {class} function init(P1: JGEDI_PRNTR_e_BarCodeType; P2: Integer; P3: Integer): JGEDI_PRNTR_st_BarCodeConfig; cdecl; overload;//Deprecated
    {class} property barCodeType: JGEDI_PRNTR_e_BarCodeType read _GetbarCodeType;
    {class} property height: Integer read _Getheight write _Setheight;
    {class} property width: Integer read _Getwidth write _Setwidth;
  end;

  [JavaSignature('br/com/gertec/gedi/structs/GEDI_PRNTR_st_BarCodeConfig')]
  JGEDI_PRNTR_st_BarCodeConfig = interface(JObject)
    ['{2BAFE2D7-7C03-4CE7-BCA7-24728AEFB0B5}']
  end;
  TJGEDI_PRNTR_st_BarCodeConfig = class(TJavaGenericImport<JGEDI_PRNTR_st_BarCodeConfigClass, JGEDI_PRNTR_st_BarCodeConfig>) end;

  JGEDI_PRNTR_st_PictureConfigClass = interface(JObjectClass)
    ['{0D9AA609-D556-4E16-9760-281621837021}']
    {class} function _Getalignment: JGEDI_PRNTR_e_Alignment; cdecl;
    {class} function _Getheight: Integer; cdecl;
    {class} procedure _Setheight(Value: Integer); cdecl;
    {class} function _Getoffset: Integer; cdecl;
    {class} procedure _Setoffset(Value: Integer); cdecl;
    {class} function _Getwidth: Integer; cdecl;
    {class} procedure _Setwidth(Value: Integer); cdecl;
    {class} function init: JGEDI_PRNTR_st_PictureConfig; cdecl; overload;//Deprecated
    {class} function init(P1: JGEDI_PRNTR_e_Alignment): JGEDI_PRNTR_st_PictureConfig; cdecl; overload;//Deprecated
    {class} function init(P1: JGEDI_PRNTR_e_Alignment; P2: Integer; P3: Integer; P4: Integer): JGEDI_PRNTR_st_PictureConfig; cdecl; overload;//Deprecated
    {class} property alignment: JGEDI_PRNTR_e_Alignment read _Getalignment;
    {class} property height: Integer read _Getheight write _Setheight;
    {class} property offset: Integer read _Getoffset write _Setoffset;
    {class} property width: Integer read _Getwidth write _Setwidth;
  end;

  [JavaSignature('br/com/gertec/gedi/structs/GEDI_PRNTR_st_PictureConfig')]
  JGEDI_PRNTR_st_PictureConfig = interface(JObject)
    ['{0CA1E592-E976-44DF-A0BF-FF09F68E09CA}']
  end;
  TJGEDI_PRNTR_st_PictureConfig = class(TJavaGenericImport<JGEDI_PRNTR_st_PictureConfigClass, JGEDI_PRNTR_st_PictureConfig>) end;

  JGEDI_PRNTR_st_StringConfigClass = interface(JObjectClass)
    ['{806557C0-EC31-407D-B84A-2EB3AACE5C0F}']
    {class} function _GetlineSpace: Integer; cdecl;
    {class} procedure _SetlineSpace(Value: Integer); cdecl;
    {class} function _Getoffset: Integer; cdecl;
    {class} procedure _Setoffset(Value: Integer); cdecl;
    {class} function _Getpaint: JPaint; cdecl;
    {class} function init: JGEDI_PRNTR_st_StringConfig; cdecl; overload;//Deprecated
    {class} function init(P1: JPaint): JGEDI_PRNTR_st_StringConfig; cdecl; overload;//Deprecated
    {class} function init(P1: JPaint; P2: Integer; P3: Integer): JGEDI_PRNTR_st_StringConfig; cdecl; overload;//Deprecated
    {class} property lineSpace: Integer read _GetlineSpace write _SetlineSpace;
    {class} property offset: Integer read _Getoffset write _Setoffset;
    {class} property paint: JPaint read _Getpaint;
  end;

  [JavaSignature('br/com/gertec/gedi/structs/GEDI_PRNTR_st_StringConfig')]
  JGEDI_PRNTR_st_StringConfig = interface(JObject)
    ['{F41CEA3D-A51C-4725-B5DA-725693CC9519}']
  end;
  TJGEDI_PRNTR_st_StringConfig = class(TJavaGenericImport<JGEDI_PRNTR_st_StringConfigClass, JGEDI_PRNTR_st_StringConfig>) end;

  JGEDI_SMART_st_ResetInfoClass = interface(JObjectClass)
    ['{6B123EF2-4E05-44A1-A35F-6F06109DA85D}']
    {class} function _GetabATR: TJavaArray<Byte>; cdecl;
    {class} function _GetpeCardType: JGEDI_SMART_e_Type; cdecl;
    {class} procedure _SetpeCardType(Value: JGEDI_SMART_e_Type); cdecl;
    {class} function init: JGEDI_SMART_st_ResetInfo; cdecl;//Deprecated
    {class} property abATR: TJavaArray<Byte> read _GetabATR;
    {class} property peCardType: JGEDI_SMART_e_Type read _GetpeCardType write _SetpeCardType;
  end;

  [JavaSignature('br/com/gertec/gedi/structs/GEDI_SMART_st_ResetInfo')]
  JGEDI_SMART_st_ResetInfo = interface(JObject)
    ['{B6BF885C-9682-4F60-AF9C-A6583CFFF596}']
  end;
  TJGEDI_SMART_st_ResetInfo = class(TJavaGenericImport<JGEDI_SMART_st_ResetInfoClass, JGEDI_SMART_st_ResetInfo>) end;

  Jsdk4_a_aClass = interface(JIInterfaceClass)
    ['{411FA1F9-6552-4912-B1DA-949CAF71BF5C}']
    {class} function a: Integer; cdecl; overload;//Deprecated
    {class} function a(P1: TJavaArray<Byte>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Ja_e): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: JString): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: TJavaArray<Byte>; P2: Integer): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Ja_d): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>; P3: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: Integer): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: TJavaArray<Byte>; P3: Integer): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: JString; P2: Integer; P3: Boolean): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: JBitmap; P2: Integer; P3: Integer): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: TJavaArray<Byte>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: JString; P2: Integer; P3: Integer; P4: Integer): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: TJavaArray<Byte>; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: TJavaArray<Integer>; P4: TJavaArray<Byte>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: JString; P2: JString; P3: Integer; P4: Integer): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: JBitmap; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: JString; P2: Integer; P3: Integer; P4: Boolean; P5: Boolean): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: TJavaArray<Byte>; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Byte; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>; P6: JString): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: TJavaArray<Byte>; P6: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Integer>; P5: TJavaArray<Byte>; P6: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>; P6: JString): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: Integer; P6: TJavaArray<Byte>; P7: TJavaArray<Byte>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>; P7: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>; P7: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>; P7: TJavaArray<Byte>; P8: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: Integer; P6: TJavaArray<Byte>; P7: TJavaArray<Byte>; P8: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Byte; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>; P6: Integer; P7: Integer; P8: Integer): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: JString; P2: Integer; P3: TJavaArray<Byte>; P4: Integer; P5: TJavaArray<Byte>; P6: Integer; P7: TJavaArray<Byte>; P8: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: JString; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: Integer; P6: TJavaArray<Byte>; P7: Integer; P8: TJavaArray<Byte>; P9: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: JString; P2: JString; P3: Single; P4: Integer; P5: Integer; P6: Integer; P7: Boolean; P8: Boolean; P9: Boolean): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: JString; P2: Integer; P3: Single; P4: Single; P5: Integer; P6: Integer; P7: Boolean; P8: Boolean; P9: Boolean): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: Integer; P6: TJavaArray<Byte>; P7: Integer; P8: TJavaArray<Byte>; P9: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>; P7: TJavaArray<Byte>; P8: Integer; P9: TJavaArray<Byte>; P10: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: JString; P2: Integer; P3: Single; P4: Single; P5: Integer; P6: Integer; P7: Integer; P8: Boolean; P9: Boolean; P10: Boolean): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: JString; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: TJavaArray<Byte>; P8: Integer; P9: TJavaArray<Byte>; P10: Ja_c): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: JString; P2: Integer; P3: Single; P4: Single; P5: Single; P6: Integer; P7: Integer; P8: Integer; P9: Boolean; P10: Boolean; P11: Boolean): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: TJavaArray<Byte>; P7: Integer; P8: TJavaArray<Byte>; P9: Integer; P10: TJavaArray<Byte>; P11: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: JString; P4: Integer; P5: Integer; P6: TJavaArray<Byte>; P7: Integer; P8: TJavaArray<Byte>; P9: Integer; P10: TJavaArray<Byte>; P11: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Byte; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: TJavaArray<Byte>; P7: Integer; P8: TJavaArray<Byte>; P9: Integer; P10: TJavaArray<Byte>; P11: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function b: Integer; cdecl; overload;//Deprecated
    {class} function b(P1: TJavaArray<Byte>): Integer; cdecl; overload;//Deprecated
    {class} function b(P1: Integer): Integer; cdecl; overload;//Deprecated
    {class} function b(P1: JString): Integer; cdecl; overload;//Deprecated
    {class} function b(P1: Integer; P2: Integer): Integer; cdecl; overload;//Deprecated
    {class} function b(P1: TJavaArray<Byte>; P2: Integer): Integer; cdecl; overload;//Deprecated
    {class} function b(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl; overload;//Deprecated
    {class} function b(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function b(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>; P3: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function b(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function b(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function b(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function b(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function b(P1: TJavaArray<Byte>; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function b(P1: Integer; P2: TJavaArray<Byte>; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function b(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function b(P1: Byte; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>; P6: JString): Integer; cdecl; overload;//Deprecated
    {class} function b(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>; P6: JString): Integer; cdecl; overload;//Deprecated
    {class} function b(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: TJavaArray<Byte>; P6: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function b(P1: JString; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: Integer; P6: TJavaArray<Byte>; P7: Integer; P8: TJavaArray<Byte>; P9: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function b(P1: Integer; P2: JString; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: TJavaArray<Byte>; P8: Integer; P9: TJavaArray<Byte>; P10: Ja_c): Integer; cdecl; overload;//Deprecated
    {class} function b(P1: Integer; P2: Integer; P3: JString; P4: Integer; P5: Integer; P6: TJavaArray<Byte>; P7: Integer; P8: TJavaArray<Byte>; P9: Integer; P10: TJavaArray<Byte>; P11: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function c: Integer; cdecl; overload;//Deprecated
    {class} procedure c(P1: JString); cdecl; overload;//Deprecated
    {class} function c(P1: Integer): Integer; cdecl; overload;//Deprecated
    {class} function c(P1: TJavaArray<Byte>): Integer; cdecl; overload;//Deprecated
    {class} function c(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl; overload;//Deprecated
    {class} function c(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function c(P1: Integer; P2: Integer): Integer; cdecl; overload;//Deprecated
    {class} function c(P1: TJavaArray<Byte>; P2: Integer): Integer; cdecl; overload;//Deprecated
    {class} function c(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function c(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function c(P1: TJavaArray<Byte>; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function c(P1: Integer; P2: TJavaArray<Byte>; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function d: Integer; cdecl; overload;//Deprecated
    {class} function d(P1: TJavaArray<Byte>): Integer; cdecl; overload;//Deprecated
    {class} function d(P1: Integer): Integer; cdecl; overload;//Deprecated
    {class} function d(P1: Integer; P2: Integer): Integer; cdecl; overload;//Deprecated
    {class} function d(P1: TJavaArray<Byte>; P2: Integer): Integer; cdecl; overload;//Deprecated
    {class} function d(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function d(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl; overload;//Deprecated
    {class} function d(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function d(P1: TJavaArray<Byte>; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function e: Integer; cdecl; overload;//Deprecated
    {class} function e(P1: Integer): Integer; cdecl; overload;//Deprecated
    {class} procedure e(P1: TJavaArray<Byte>); cdecl; overload;//Deprecated
    {class} function e(P1: TJavaArray<Byte>; P2: Integer): Integer; cdecl; overload;//Deprecated
    {class} function e(P1: Integer; P2: Integer): Integer; cdecl; overload;//Deprecated
    {class} function e(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function f: Integer; cdecl; overload;//Deprecated
    {class} function f(P1: TJavaArray<Byte>): Integer; cdecl; overload;//Deprecated
    {class} function f(P1: Integer): Integer; cdecl; overload;//Deprecated
    {class} function f(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function g: Integer; cdecl; overload;//Deprecated
    {class} function g(P1: Integer): Integer; cdecl; overload;//Deprecated
    {class} function g(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function h: Integer; cdecl; overload;//Deprecated
    {class} function h(P1: Integer): Integer; cdecl; overload;//Deprecated
    {class} function h(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function i: Integer; cdecl; overload;//Deprecated
    {class} function i(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function j: TJavaObjectArray<JString>; cdecl; overload;//Deprecated
    {class} function j(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function k: Integer; cdecl; overload;//Deprecated
    {class} function k(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function l: Integer; cdecl; overload;//Deprecated
    {class} function l(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function m: Integer; cdecl; overload;//Deprecated
    {class} function m(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function n: Integer; cdecl; overload;//Deprecated
    {class} function n(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function o: JString; cdecl;//Deprecated
    {class} function p: JString; cdecl;//Deprecated
    {class} function q: Integer; cdecl;//Deprecated
    {class} function r: Integer; cdecl;//Deprecated
    {class} function s: JString; cdecl;//Deprecated
  end;

  [JavaSignature('wangpos/sdk4/a/a')]
  Jsdk4_a_a = interface(JIInterface)
    ['{B929D20B-54BB-4DDE-96C9-B4CB06113921}']
  end;
  TJsdk4_a_a = class(TJavaGenericImport<Jsdk4_a_aClass, Jsdk4_a_a>) end;

  Jsdk4_a_a_aClass = interface(JBinderClass)
    ['{F7FD99B5-182D-414E-ACB3-6437FC90055F}']
    {class} function a(P1: JIBinder): Jsdk4_a_a; cdecl;//Deprecated
    {class} function onTransact(P1: Integer; P2: JParcel; P3: JParcel; P4: Integer): Boolean; cdecl;//Deprecated
  end;

  [JavaSignature('wangpos/sdk4/a/a$a')]
  Jsdk4_a_a_a = interface(JBinder)
    ['{FF98B70C-25B0-45DB-AD5D-2CD1BA1C7068}']
  end;
  TJsdk4_a_a_a = class(TJavaGenericImport<Jsdk4_a_a_aClass, Jsdk4_a_a_a>) end;

  Ja_a_aClass = interface(Jsdk4_a_aClass)
    ['{B26A9D6C-3655-4B77-B7BE-46A1E3CA620B}']
    {class} function a: Integer; cdecl; overload;//Deprecated
    {class} function a(P1: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: TJavaArray<Byte>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: JString): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Ja_e): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: TJavaArray<Byte>; P2: Integer): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Ja_d): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: TJavaArray<Byte>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: TJavaArray<Byte>; P3: Integer): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>; P3: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: Integer): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: JString; P2: Integer; P3: Boolean): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: JBitmap; P2: Integer; P3: Integer): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: TJavaArray<Byte>; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: TJavaArray<Integer>; P4: TJavaArray<Byte>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: JString; P2: JString; P3: Integer; P4: Integer): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: JString; P2: Integer; P3: Integer; P4: Integer): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: JBitmap; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: JString; P2: Integer; P3: Integer; P4: Boolean; P5: Boolean): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: TJavaArray<Byte>; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: TJavaArray<Byte>; P6: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Byte; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>; P6: JString): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Integer>; P5: TJavaArray<Byte>; P6: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>; P6: JString): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>; P7: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>; P7: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: Integer; P6: TJavaArray<Byte>; P7: TJavaArray<Byte>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Byte; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>; P6: Integer; P7: Integer; P8: Integer): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>; P7: TJavaArray<Byte>; P8: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: Integer; P6: TJavaArray<Byte>; P7: TJavaArray<Byte>; P8: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: JString; P2: Integer; P3: TJavaArray<Byte>; P4: Integer; P5: TJavaArray<Byte>; P6: Integer; P7: TJavaArray<Byte>; P8: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: JString; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: Integer; P6: TJavaArray<Byte>; P7: Integer; P8: TJavaArray<Byte>; P9: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: JString; P2: JString; P3: Single; P4: Integer; P5: Integer; P6: Integer; P7: Boolean; P8: Boolean; P9: Boolean): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: Integer; P6: TJavaArray<Byte>; P7: Integer; P8: TJavaArray<Byte>; P9: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: JString; P2: Integer; P3: Single; P4: Single; P5: Integer; P6: Integer; P7: Boolean; P8: Boolean; P9: Boolean): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: JString; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: TJavaArray<Byte>; P8: Integer; P9: TJavaArray<Byte>; P10: Ja_c): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>; P7: TJavaArray<Byte>; P8: Integer; P9: TJavaArray<Byte>; P10: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: JString; P2: Integer; P3: Single; P4: Single; P5: Integer; P6: Integer; P7: Integer; P8: Boolean; P9: Boolean; P10: Boolean): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: JString; P2: Integer; P3: Single; P4: Single; P5: Single; P6: Integer; P7: Integer; P8: Integer; P9: Boolean; P10: Boolean; P11: Boolean): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Byte; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: TJavaArray<Byte>; P7: Integer; P8: TJavaArray<Byte>; P9: Integer; P10: TJavaArray<Byte>; P11: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: TJavaArray<Byte>; P7: Integer; P8: TJavaArray<Byte>; P9: Integer; P10: TJavaArray<Byte>; P11: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: JString; P4: Integer; P5: Integer; P6: TJavaArray<Byte>; P7: Integer; P8: TJavaArray<Byte>; P9: Integer; P10: TJavaArray<Byte>; P11: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function asBinder: JIBinder; cdecl;//Deprecated
    {class} function b: Integer; cdecl; overload;//Deprecated
    {class} function b(P1: TJavaArray<Byte>): Integer; cdecl; overload;//Deprecated
    {class} function b(P1: Integer): Integer; cdecl; overload;//Deprecated
    {class} function b(P1: JString): Integer; cdecl; overload;//Deprecated
    {class} function b(P1: TJavaArray<Byte>; P2: Integer): Integer; cdecl; overload;//Deprecated
    {class} function b(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl; overload;//Deprecated
    {class} function b(P1: Integer; P2: Integer): Integer; cdecl; overload;//Deprecated
    {class} function b(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function b(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function b(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>; P3: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function b(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function b(P1: TJavaArray<Byte>; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function b(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function b(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function b(P1: Integer; P2: TJavaArray<Byte>; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function b(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function b(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: TJavaArray<Byte>; P6: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function b(P1: Byte; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>; P6: JString): Integer; cdecl; overload;//Deprecated
    {class} function b(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>; P6: JString): Integer; cdecl; overload;//Deprecated
    {class} function b(P1: JString; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: Integer; P6: TJavaArray<Byte>; P7: Integer; P8: TJavaArray<Byte>; P9: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function b(P1: Integer; P2: JString; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: TJavaArray<Byte>; P8: Integer; P9: TJavaArray<Byte>; P10: Ja_c): Integer; cdecl; overload;//Deprecated
    {class} function b(P1: Integer; P2: Integer; P3: JString; P4: Integer; P5: Integer; P6: TJavaArray<Byte>; P7: Integer; P8: TJavaArray<Byte>; P9: Integer; P10: TJavaArray<Byte>; P11: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function c: Integer; cdecl; overload;//Deprecated
    {class} procedure c(P1: JString); cdecl; overload;//Deprecated
    {class} function c(P1: TJavaArray<Byte>): Integer; cdecl; overload;//Deprecated
    {class} function c(P1: Integer): Integer; cdecl; overload;//Deprecated
    {class} function c(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl; overload;//Deprecated
    {class} function c(P1: TJavaArray<Byte>; P2: Integer): Integer; cdecl; overload;//Deprecated
    {class} function c(P1: Integer; P2: Integer): Integer; cdecl; overload;//Deprecated
    {class} function c(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function c(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function c(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function c(P1: TJavaArray<Byte>; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function c(P1: Integer; P2: TJavaArray<Byte>; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function d: Integer; cdecl; overload;//Deprecated
    {class} function d(P1: Integer): Integer; cdecl; overload;//Deprecated
    {class} function d(P1: TJavaArray<Byte>): Integer; cdecl; overload;//Deprecated
    {class} function d(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function d(P1: Integer; P2: Integer): Integer; cdecl; overload;//Deprecated
    {class} function d(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl; overload;//Deprecated
    {class} function d(P1: TJavaArray<Byte>; P2: Integer): Integer; cdecl; overload;//Deprecated
    {class} function d(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function d(P1: TJavaArray<Byte>; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function e: Integer; cdecl; overload;//Deprecated
    {class} procedure e(P1: TJavaArray<Byte>); cdecl; overload;//Deprecated
    {class} function e(P1: Integer): Integer; cdecl; overload;//Deprecated
    {class} function e(P1: Integer; P2: Integer): Integer; cdecl; overload;//Deprecated
    {class} function e(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function e(P1: TJavaArray<Byte>; P2: Integer): Integer; cdecl; overload;//Deprecated
    {class} function f: Integer; cdecl; overload;//Deprecated
    {class} function f(P1: Integer): Integer; cdecl; overload;//Deprecated
    {class} function f(P1: TJavaArray<Byte>): Integer; cdecl; overload;//Deprecated
    {class} function f(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function g: Integer; cdecl; overload;//Deprecated
    {class} function g(P1: Integer): Integer; cdecl; overload;//Deprecated
    {class} function g(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function h: Integer; cdecl; overload;//Deprecated
    {class} function h(P1: Integer): Integer; cdecl; overload;//Deprecated
    {class} function h(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function i: Integer; cdecl; overload;//Deprecated
    {class} function i(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function j: TJavaObjectArray<JString>; cdecl; overload;//Deprecated
    {class} function j(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function k: Integer; cdecl; overload;//Deprecated
    {class} function k(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function l: Integer; cdecl; overload;//Deprecated
    {class} function l(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function m: Integer; cdecl; overload;//Deprecated
    {class} function m(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function n: Integer; cdecl; overload;//Deprecated
    {class} function n(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function o: JString; cdecl;//Deprecated
    {class} function p: JString; cdecl;//Deprecated
    {class} function q: Integer; cdecl;//Deprecated
    {class} function r: Integer; cdecl;//Deprecated
    {class} function s: JString; cdecl;//Deprecated
  end;

  [JavaSignature('wangpos/sdk4/a/a$a$a')]
  Ja_a_a = interface(Jsdk4_a_a)
    ['{135AA571-7F9E-4977-A593-96DA29F64C42}']
  end;
  TJa_a_a = class(TJavaGenericImport<Ja_a_aClass, Ja_a_a>) end;

  Ja_bClass = interface(JIInterfaceClass)
    ['{541F63DB-06EC-4F5F-B0BD-86CEE4D677A2}']
    {class} function a(P1: Integer): JIBinder; cdecl;//Deprecated
  end;

  [JavaSignature('wangpos/sdk4/a/b')]
  Ja_b = interface(JIInterface)
    ['{E321A9C6-7511-4522-9170-0F0957FDC15D}']
  end;
  TJa_b = class(TJavaGenericImport<Ja_bClass, Ja_b>) end;

  Jb_aClass = interface(JBinderClass)
    ['{1F965FE5-CC15-4909-A6E5-B75BC36B8002}']
    {class} function a(P1: JIBinder): Ja_b; cdecl;//Deprecated
    {class} function onTransact(P1: Integer; P2: JParcel; P3: JParcel; P4: Integer): Boolean; cdecl;//Deprecated
  end;

  [JavaSignature('wangpos/sdk4/a/b$a')]
  Jb_a = interface(JBinder)
    ['{52A5FBE0-E277-430C-BEF3-5A8371E8AD5B}']
  end;
  TJb_a = class(TJavaGenericImport<Jb_aClass, Jb_a>) end;

  Jb_a_aClass = interface(Ja_bClass)
    ['{1F8ACEB1-1E2C-462B-8F29-DF68B6F6053A}']
    {class} function a(P1: Integer): JIBinder; cdecl;//Deprecated
    {class} function asBinder: JIBinder; cdecl;//Deprecated
  end;

  [JavaSignature('wangpos/sdk4/a/b$a$a')]
  Jb_a_a = interface(Ja_b)
    ['{DA7C35E5-750F-48DC-AB4B-C4F7A0AD7F1B}']
  end;
  TJb_a_a = class(TJavaGenericImport<Jb_a_aClass, Jb_a_a>) end;

  Ja_cClass = interface(JIInterfaceClass)
    ['{2D05B665-8276-44AA-BC03-A4E1A79EBAEC}']
    {class} function a(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl;//Deprecated
  end;

  [JavaSignature('wangpos/sdk4/a/c')]
  Ja_c = interface(JIInterface)
    ['{690F4261-7ACB-48AF-98E0-01CBC21D1F98}']
  end;
  TJa_c = class(TJavaGenericImport<Ja_cClass, Ja_c>) end;

  Jc_a_aClass = interface(Ja_cClass)
    ['{09CD969C-6B94-4AC7-83BB-E0B921D539A5}']
    {class} function a(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function asBinder: JIBinder; cdecl;//Deprecated
  end;

  [JavaSignature('wangpos/sdk4/a/c$a$a')]
  Jc_a_a = interface(Ja_c)
    ['{45A42098-8CCC-4A7F-B7EE-0C3D96EB5071}']
  end;
  TJc_a_a = class(TJavaGenericImport<Jc_a_aClass, Jc_a_a>) end;

  Ja_dClass = interface(JIInterfaceClass)
    ['{43FFE1C4-608F-416B-8B3F-185CCCE77A08}']
    {class} function a(P1: Integer): Integer; cdecl;//Deprecated
  end;

  [JavaSignature('wangpos/sdk4/a/d')]
  Ja_d = interface(JIInterface)
    ['{84363282-AB5E-4DBA-951A-89BC44D10897}']
  end;
  TJa_d = class(TJavaGenericImport<Ja_dClass, Ja_d>) end;

  Jd_aClass = interface(JBinderClass)
    ['{E7744B9E-8D0A-414F-A93C-318149F02320}']
    {class} function a(P1: JIBinder): Ja_d; cdecl;//Deprecated
    {class} function onTransact(P1: Integer; P2: JParcel; P3: JParcel; P4: Integer): Boolean; cdecl;//Deprecated
  end;

  [JavaSignature('wangpos/sdk4/a/d$a')]
  Jd_a = interface(JBinder)
    ['{7FFFA6BD-FBA5-4D06-B5FD-DD20D97B7712}']
  end;
  TJd_a = class(TJavaGenericImport<Jd_aClass, Jd_a>) end;

  Jd_a_aClass = interface(Ja_dClass)
    ['{5ED51826-5516-4B83-81F8-A37B40BDAD6D}']
    {class} function a(P1: Integer): Integer; cdecl;//Deprecated
    {class} function asBinder: JIBinder; cdecl;//Deprecated
  end;

  [JavaSignature('wangpos/sdk4/a/d$a$a')]
  Jd_a_a = interface(Ja_d)
    ['{5B653A52-2E48-42B0-96EF-D91FE3766485}']
  end;
  TJd_a_a = class(TJavaGenericImport<Jd_a_aClass, Jd_a_a>) end;

  Ja_eClass = interface(JIInterfaceClass)
    ['{B1F4A47C-53E8-4BB5-B4C0-C761DB20FF43}']
    {class} function a(P1: Integer): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: JString; P3: Byte; P4: Byte; P5: Byte; P6: Integer; P7: TJavaArray<Byte>): Integer; cdecl; overload;//Deprecated
  end;

  [JavaSignature('wangpos/sdk4/a/e')]
  Ja_e = interface(JIInterface)
    ['{2825B887-AF62-4118-A3F6-C9B30F0CC088}']
  end;
  TJa_e = class(TJavaGenericImport<Ja_eClass, Ja_e>) end;

  Je_aClass = interface(JBinderClass)
    ['{C92432E6-12F4-4E72-99FA-0FC580CC2A1C}']
    {class} function a(P1: JIBinder): Ja_e; cdecl;//Deprecated
    {class} function onTransact(P1: Integer; P2: JParcel; P3: JParcel; P4: Integer): Boolean; cdecl;//Deprecated
  end;

  [JavaSignature('wangpos/sdk4/a/e$a')]
  Je_a = interface(JBinder)
    ['{8EA2572D-09EA-4E51-BE52-3B3C924B3E85}']
  end;
  TJe_a = class(TJavaGenericImport<Je_aClass, Je_a>) end;

  Je_a_aClass = interface(Ja_eClass)
    ['{B962C644-121D-461C-A4B1-F9C478803D75}']
    {class} function a(P1: Integer): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: JString; P3: Byte; P4: Byte; P5: Byte; P6: Integer; P7: TJavaArray<Byte>): Integer; cdecl; overload;//Deprecated
    {class} function asBinder: JIBinder; cdecl;//Deprecated
  end;

  [JavaSignature('wangpos/sdk4/a/e$a$a')]
  Je_a_a = interface(Ja_e)
    ['{A08A950A-D6A6-459F-AE05-095B27B36D87}']
  end;
  TJe_a_a = class(TJavaGenericImport<Je_a_aClass, Je_a_a>) end;

  Jsdk4_b_aClass = interface(JIInterfaceClass)
    ['{7A66139C-BC82-4CB0-8AE7-40F187A392E5}']
    {class} function a(P1: Integer): JIBinder; cdecl;//Deprecated
  end;

  [JavaSignature('wangpos/sdk4/b/a')]
  Jsdk4_b_a = interface(JIInterface)
    ['{47CA1A58-3360-4CBE-87EE-1AA5609040EA}']
  end;
  TJsdk4_b_a = class(TJavaGenericImport<Jsdk4_b_aClass, Jsdk4_b_a>) end;

  Jsdk4_b_a_aClass = interface(JBinderClass)
    ['{7B8B0D74-5D22-4E87-8D72-61EB2B663A81}']
    {class} function a(P1: JIBinder): Jsdk4_b_a; cdecl;//Deprecated
    {class} function onTransact(P1: Integer; P2: JParcel; P3: JParcel; P4: Integer): Boolean; cdecl;//Deprecated
  end;

  [JavaSignature('wangpos/sdk4/b/a$a')]
  Jsdk4_b_a_a = interface(JBinder)
    ['{DBE86467-99E6-4141-A7CD-E17E3A390B49}']
  end;
  TJsdk4_b_a_a = class(TJavaGenericImport<Jsdk4_b_a_aClass, Jsdk4_b_a_a>) end;

  Jb_a_a_aClass = interface(Jsdk4_b_aClass)
    ['{77408F9D-8C6D-4F04-8BDB-4473781BFD45}']
    {class} function a(P1: Integer): JIBinder; cdecl;//Deprecated
    {class} function asBinder: JIBinder; cdecl;//Deprecated
  end;

  [JavaSignature('wangpos/sdk4/b/a$a$a')]
  Jb_a_a_a = interface(Jsdk4_b_a)
    ['{EC7A2577-8CF4-4971-A114-0AAF30EEA3C4}']
  end;
  TJb_a_a_a = class(TJavaGenericImport<Jb_a_a_aClass, Jb_a_a_a>) end;

  Jb_bClass = interface(JIInterfaceClass)
    ['{777E9739-4FBF-4206-8892-9A4D6264B94B}']
    {class} function a: Integer; cdecl; overload;//Deprecated
    {class} procedure a(P1: JString); cdecl; overload;//Deprecated
    {class} function a(P1: JString; P2: Integer): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: JString): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: JString; P2: Integer; P3: TJavaArray<Byte>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: JString; P2: TJavaArray<Byte>; P3: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: JString; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>; P7: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: JString; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: Integer; P7: TJavaArray<Byte>; P8: Boolean; P9: Integer): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>; P5: Boolean; P6: Integer; P7: TJavaArray<Byte>; P8: JString; P9: Integer): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>; P5: Boolean; P6: Integer; P7: TJavaArray<Byte>; P8: JString; P9: JString; P10: Integer): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: Boolean; P7: Integer; P8: TJavaArray<Byte>; P9: JString; P10: Integer): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: Boolean; P7: Integer; P8: TJavaArray<Byte>; P9: JString; P10: JString; P11: Integer): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: Integer; P7: Integer; P8: TJavaArray<Byte>; P9: TJavaArray<Byte>; P10: Integer; P11: Integer; P12: TJavaArray<Byte>; P13: TJavaArray<Byte>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: TJavaArray<Byte>; P8: Integer; P9: TJavaArray<Byte>; P10: Integer; P11: Integer; P12: TJavaArray<Byte>; P13: Integer; P14: TJavaArray<Byte>; P15: TJavaArray<Byte>; P16: JString): Integer; cdecl; overload;//Deprecated
    {class} function b: Integer; cdecl; overload;//Deprecated
    {class} function b(P1: JString): Integer; cdecl; overload;//Deprecated
    {class} function c: JString; cdecl;//Deprecated
  end;

  [JavaSignature('wangpos/sdk4/b/b')]
  Jb_b = interface(JIInterface)
    ['{364E6437-639E-4C85-B7D4-5DB81EDE5554}']
  end;
  TJb_b = class(TJavaGenericImport<Jb_bClass, Jb_b>) end;

  Jb_b_aClass = interface(JBinderClass)
    ['{A6BF3F16-E7AE-4649-9EEE-C8764C5AF00B}']
    {class} function a(P1: JIBinder): Jb_b; cdecl;//Deprecated
    {class} function onTransact(P1: Integer; P2: JParcel; P3: JParcel; P4: Integer): Boolean; cdecl;//Deprecated
  end;

  [JavaSignature('wangpos/sdk4/b/b$a')]
  Jb_b_a = interface(JBinder)
    ['{6F458D37-2E7D-4B01-AC8B-7E66BD223292}']
  end;
  TJb_b_a = class(TJavaGenericImport<Jb_b_aClass, Jb_b_a>) end;

  Jb_b_a_aClass = interface(Jb_bClass)
    ['{CAB30C48-D745-488F-BE7D-F89A21AFCE64}']
    {class} function a: Integer; cdecl; overload;//Deprecated
    {class} procedure a(P1: JString); cdecl; overload;//Deprecated
    {class} function a(P1: JString; P2: Integer): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: JString): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: JString; P2: TJavaArray<Byte>; P3: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: JString; P2: Integer; P3: TJavaArray<Byte>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: JString; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>; P7: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: JString; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: Integer; P7: TJavaArray<Byte>; P8: Boolean; P9: Integer): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>; P5: Boolean; P6: Integer; P7: TJavaArray<Byte>; P8: JString; P9: Integer): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>; P5: Boolean; P6: Integer; P7: TJavaArray<Byte>; P8: JString; P9: JString; P10: Integer): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: Boolean; P7: Integer; P8: TJavaArray<Byte>; P9: JString; P10: Integer): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: Boolean; P7: Integer; P8: TJavaArray<Byte>; P9: JString; P10: JString; P11: Integer): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: Integer; P7: Integer; P8: TJavaArray<Byte>; P9: TJavaArray<Byte>; P10: Integer; P11: Integer; P12: TJavaArray<Byte>; P13: TJavaArray<Byte>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: TJavaArray<Byte>; P8: Integer; P9: TJavaArray<Byte>; P10: Integer; P11: Integer; P12: TJavaArray<Byte>; P13: Integer; P14: TJavaArray<Byte>; P15: TJavaArray<Byte>; P16: JString): Integer; cdecl; overload;//Deprecated
    {class} function asBinder: JIBinder; cdecl;//Deprecated
    {class} function b: Integer; cdecl; overload;//Deprecated
    {class} function b(P1: JString): Integer; cdecl; overload;//Deprecated
    {class} function c: JString; cdecl;//Deprecated
  end;

  [JavaSignature('wangpos/sdk4/b/b$a$a')]
  Jb_b_a_a = interface(Jb_b)
    ['{04E71AC4-8AB6-46DF-BE1E-12B29ED104BE}']
  end;
  TJb_b_a_a = class(TJavaGenericImport<Jb_b_a_aClass, Jb_b_a_a>) end;

  Jsdk4_c_aClass = interface(JObjectClass)
    ['{51C60900-E8E0-409D-8157-58089B82C5D4}']
    {class} function a(P1: Jsdk4_c_a): JIBinder_DeathRecipient; cdecl; overload;//Deprecated
    {class} function a(P1: Jsdk4_b_a): Jsdk4_b_a; cdecl; overload;//Deprecated
    {class} function a(P1: Integer): JIBinder; cdecl; overload;//Deprecated
    {class} function a(P1: JContext): Jsdk4_c_a; cdecl; overload;//Deprecated
    {class} function b: Jsdk4_b_a; cdecl; overload;//Deprecated
    {class} function b(P1: Jsdk4_c_a): JCountDownLatch; cdecl; overload;//Deprecated
    {class} procedure c(P1: Jsdk4_c_a); cdecl;//Deprecated
    {class} function init: Jsdk4_c_a; cdecl;//Deprecated
  end;

  [JavaSignature('wangpos/sdk4/c/a')]
  Jsdk4_c_a = interface(JObject)
    ['{BDDA9E88-DC3E-4D7C-95E0-032E634C5D03}']
  end;
  TJsdk4_c_a = class(TJavaGenericImport<Jsdk4_c_aClass, Jsdk4_c_a>) end;

  Jsdk4_c_a_aClass = interface(JServiceConnectionClass)
    ['{13AE789D-AE69-42E3-8264-4DD803FEB9ED}']
    {class} function init(P1: Jsdk4_c_a): Jsdk4_c_a_a; cdecl;//Deprecated
    {class} procedure onServiceConnected(P1: JComponentName; P2: JIBinder); cdecl;//Deprecated
    {class} procedure onServiceDisconnected(P1: JComponentName); cdecl;//Deprecated
  end;

  [JavaSignature('wangpos/sdk4/c/a$a')]
  Jsdk4_c_a_a = interface(JServiceConnection)
    ['{E7D22853-68D5-4C0E-AB23-1F14C66B1F53}']
  end;
  TJsdk4_c_a_a = class(TJavaGenericImport<Jsdk4_c_a_aClass, Jsdk4_c_a_a>) end;

  Jc_a_bClass = interface(JIBinder_DeathRecipientClass)
    ['{CDB9997E-38E4-4790-8D4D-B58F60826426}']
    {class} procedure binderDied; cdecl;//Deprecated
    {class} function init(P1: Jsdk4_c_a): Jc_a_b; cdecl;//Deprecated
  end;

  [JavaSignature('wangpos/sdk4/c/a$b')]
  Jc_a_b = interface(JIBinder_DeathRecipient)
    ['{1B974567-6092-4069-9391-2E1C5BC58CDC}']
  end;
  TJc_a_b = class(TJavaGenericImport<Jc_a_bClass, Jc_a_b>) end;

  Jc_bClass = interface(Jsdk4_c_aClass)
    ['{6958A449-4A51-42C2-8728-5D68C78F4F4E}']
    {class} function a: Integer; cdecl; overload;//Deprecated
    {class} procedure a(P1: JString); cdecl; overload;//Deprecated
    {class} function a(P1: JString; P2: Integer): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: JString; P2: TJavaArray<Byte>; P3: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: JString; P2: Integer; P3: TJavaArray<Byte>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: JString; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>): Integer; cdecl; overload;//Deprecated
    {class} function a(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: Boolean; P7: Integer; P8: TJavaArray<Byte>; P9: JString; P10: Integer): Integer; cdecl; overload;//Deprecated
    {class} function b(P1: JString): Integer; cdecl; overload;//Deprecated
    {class} function b(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: Boolean; P7: Integer; P8: TJavaArray<Byte>; P9: JString; P10: Integer): Integer; cdecl; overload;//Deprecated
    {class} function init(P1: JContext): Jc_b; cdecl;//Deprecated
  end;

  [JavaSignature('wangpos/sdk4/c/b')]
  Jc_b = interface(Jsdk4_c_a)
    ['{6A8A300A-755D-4A42-BC16-89553F0901BA}']
  end;
  TJc_b = class(TJavaGenericImport<Jc_bClass, Jc_b>) end;

  Jlibbasebinder_aClass = interface(JObjectClass)
    ['{386EC6E5-A62C-457F-845C-985FA0E9833E}']
    {class} function _GetBINDER_NONE: Integer; cdecl;
    {class} function _GetmBinderConnected: Boolean; cdecl;
    {class} procedure _SetmBinderConnected(Value: Boolean); cdecl;
    {class} function getInstance(P1: JContext): Jlibbasebinder_a; cdecl;//Deprecated
    {class} function init: Jlibbasebinder_a; cdecl;//Deprecated
    {class} function queryBinder(P1: Integer): JIBinder; cdecl;//Deprecated
    {class} property BINDER_NONE: Integer read _GetBINDER_NONE;
    {class} property mBinderConnected: Boolean read _GetmBinderConnected write _SetmBinderConnected;
  end;

  [JavaSignature('wangpos/sdk4/libbasebinder/a')]
  Jlibbasebinder_a = interface(JObject)
    ['{E9B74BEC-8271-4591-972D-AA87A7D296FB}']
  end;
  TJlibbasebinder_a = class(TJavaGenericImport<Jlibbasebinder_aClass, Jlibbasebinder_a>) end;

  JBankCardClass = interface(Jlibbasebinder_aClass)
    ['{DA3AE3C2-E856-4C63-8738-601318B14272}']
    {class} function _GetCARD_DETECT_EXIST: Integer; cdecl;
    {class} function _GetCARD_DETECT_NOTEXIST: Integer; cdecl;
    {class} function _GetCARD_MODE_ICC: Integer; cdecl;
    {class} function _GetCARD_MODE_ICC_APDU: Integer; cdecl;
    {class} function _GetCARD_MODE_MAG: Integer; cdecl;
    {class} function _GetCARD_MODE_NFC: Integer; cdecl;
    {class} function _GetCARD_MODE_PICC: Integer; cdecl;
    {class} function _GetCARD_MODE_PSAM1: Integer; cdecl;
    {class} function _GetCARD_MODE_PSAM1_APDU: Integer; cdecl;
    {class} function _GetCARD_MODE_PSAM2: Integer; cdecl;
    {class} function _GetCARD_MODE_PSAM2_APDU: Integer; cdecl;
    {class} function _GetCARD_NMODE_ICC: Integer; cdecl;
    {class} function _GetCARD_NMODE_MAG: Integer; cdecl;
    {class} function _GetCARD_NMODE_PICC: Integer; cdecl;
    {class} function _GetCARD_READ_BANKCARD: Byte; cdecl;
    {class} function _GetCARD_READ_CANCELED: Byte; cdecl;
    {class} function _GetCARD_READ_CLOSE: Byte; cdecl;
    {class} function _GetCARD_READ_FAIL: Byte; cdecl;
    {class} function _GetCARD_READ_ICDETACT: Byte; cdecl;
    {class} function _GetCARD_READ_MAGENC: Byte; cdecl;
    {class} function _GetCARD_READ_MAGENCFAIL: Byte; cdecl;
    {class} function _GetCARD_READ_MANUAL: Byte; cdecl;
    {class} function _GetCARD_READ_OPEN: Byte; cdecl;
    {class} function _GetCARD_READ_PICCDETACT: Byte; cdecl;
    {class} function _GetCARD_READ_PSAM1DETACT: Byte; cdecl;
    {class} function _GetCARD_READ_PSAM2DETACT: Byte; cdecl;
    {class} function _GetCARD_READ_TIMEOUT: Byte; cdecl;
    {class} function _GetCARD_TYPE_INDUSTRY: Byte; cdecl;
    {class} function _GetCARD_TYPE_NORMAL: Byte; cdecl;
    {class} function _GetCARD_TYPE_TEST: Byte; cdecl;
    {class} function CLGetVersion(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function CardActivation(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function DesFire_Auth(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>): Integer; cdecl;//Deprecated
    {class} function DesFire_Comfirm_Cancel(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function DesFire_CreatApp(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function DesFire_CreatFile(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>; P7: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function DesFire_CreatLine_CycleFile(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>; P7: TJavaArray<Byte>; P8: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function DesFire_CreatValueFile(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>; P7: TJavaArray<Byte>; P8: Integer; P9: TJavaArray<Byte>; P10: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function DesFire_DelFile(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function DesFire_GetCardInfo(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function DesFire_ISO7816(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>; P3: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function DesFire_ReadFile(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: TJavaArray<Byte>; P6: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function DesFire_SelApp(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function DesFire_ValueFileOpr(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function DesFire_WriteFile(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>; P7: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function Felica_Open(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Integer>; P5: TJavaArray<Byte>; P6: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function Felica_Transmit(P1: TJavaArray<Byte>; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function L1_Contactless_wupa: Integer; cdecl;//Deprecated
    {class} function Logic_ModifyPW(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl;//Deprecated
    {class} function Logic_ReadPWDegree(P1: TJavaArray<Byte>): Integer; cdecl;//Deprecated
    {class} function M0CardKeyAuth(P1: TJavaArray<Byte>; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function M0GetSignData(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function NFCTagReadBlock(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function NFCTagWriteBlock(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl;//Deprecated
    {class} function ReadLogicCardData(P1: Integer; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function ScrdGetVersion(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function VerifyLogicCardPwd(P1: TJavaArray<Byte>): Integer; cdecl;//Deprecated
    {class} function WriteLogicCardData(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: TJavaArray<Byte>): Integer; cdecl;//Deprecated
    {class} function breakOffCommand: Integer; cdecl;//Deprecated
    {class} function cardReaderDetact(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>; P6: JString): Integer; cdecl;//Deprecated
    {class} function getCardSNFunction(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function iccDetect: Integer; cdecl;//Deprecated
    {class} function icsLotPower(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function init(P1: JContext): JBankCard; cdecl;//Deprecated
    {class} function m1CardKeyAuth(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: Integer; P6: TJavaArray<Byte>): Integer; cdecl;//Deprecated
    {class} function m1CardReadBlockData(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function m1CardValueOperation(P1: Integer; P2: Integer; P3: Integer; P4: Integer): Integer; cdecl;//Deprecated
    {class} function m1CardWriteBlockData(P1: Integer; P2: Integer; P3: TJavaArray<Byte>): Integer; cdecl;//Deprecated
    {class} function openCloseCardReader(P1: Integer; P2: Integer): Integer; cdecl;//Deprecated
    {class} function parseART(P1: TJavaArray<Byte>; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function parseMagnetic(P1: TJavaArray<Byte>; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>; P5: TJavaArray<Byte>; P6: TJavaArray<Integer>; P7: TJavaArray<Byte>; P8: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function piccDetect: Integer; cdecl;//Deprecated
    {class} function readCard(P1: Byte; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>; P6: JString): Integer; cdecl;//Deprecated
    {class} function readCardIndex(P1: Byte; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>; P6: Integer; P7: Integer; P8: Integer): Integer; cdecl;//Deprecated
    {class} function readContactlessInfo(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function sendAPDU(P1: Integer; P2: TJavaArray<Byte>; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} property CARD_DETECT_EXIST: Integer read _GetCARD_DETECT_EXIST;
    {class} property CARD_DETECT_NOTEXIST: Integer read _GetCARD_DETECT_NOTEXIST;
    {class} property CARD_MODE_ICC: Integer read _GetCARD_MODE_ICC;
    {class} property CARD_MODE_ICC_APDU: Integer read _GetCARD_MODE_ICC_APDU;
    {class} property CARD_MODE_MAG: Integer read _GetCARD_MODE_MAG;
    {class} property CARD_MODE_NFC: Integer read _GetCARD_MODE_NFC;
    {class} property CARD_MODE_PICC: Integer read _GetCARD_MODE_PICC;
    {class} property CARD_MODE_PSAM1: Integer read _GetCARD_MODE_PSAM1;
    {class} property CARD_MODE_PSAM1_APDU: Integer read _GetCARD_MODE_PSAM1_APDU;
    {class} property CARD_MODE_PSAM2: Integer read _GetCARD_MODE_PSAM2;
    {class} property CARD_MODE_PSAM2_APDU: Integer read _GetCARD_MODE_PSAM2_APDU;
    {class} property CARD_NMODE_ICC: Integer read _GetCARD_NMODE_ICC;
    {class} property CARD_NMODE_MAG: Integer read _GetCARD_NMODE_MAG;
    {class} property CARD_NMODE_PICC: Integer read _GetCARD_NMODE_PICC;
    {class} property CARD_READ_BANKCARD: Byte read _GetCARD_READ_BANKCARD;
    {class} property CARD_READ_CANCELED: Byte read _GetCARD_READ_CANCELED;
    {class} property CARD_READ_CLOSE: Byte read _GetCARD_READ_CLOSE;
    {class} property CARD_READ_FAIL: Byte read _GetCARD_READ_FAIL;
    {class} property CARD_READ_ICDETACT: Byte read _GetCARD_READ_ICDETACT;
    {class} property CARD_READ_MAGENC: Byte read _GetCARD_READ_MAGENC;
    {class} property CARD_READ_MAGENCFAIL: Byte read _GetCARD_READ_MAGENCFAIL;
    {class} property CARD_READ_MANUAL: Byte read _GetCARD_READ_MANUAL;
    {class} property CARD_READ_OPEN: Byte read _GetCARD_READ_OPEN;
    {class} property CARD_READ_PICCDETACT: Byte read _GetCARD_READ_PICCDETACT;
    {class} property CARD_READ_PSAM1DETACT: Byte read _GetCARD_READ_PSAM1DETACT;
    {class} property CARD_READ_PSAM2DETACT: Byte read _GetCARD_READ_PSAM2DETACT;
    {class} property CARD_READ_TIMEOUT: Byte read _GetCARD_READ_TIMEOUT;
    {class} property CARD_TYPE_INDUSTRY: Byte read _GetCARD_TYPE_INDUSTRY;
    {class} property CARD_TYPE_NORMAL: Byte read _GetCARD_TYPE_NORMAL;
    {class} property CARD_TYPE_TEST: Byte read _GetCARD_TYPE_TEST;
  end;

  [JavaSignature('wangpos/sdk4/libbasebinder/BankCard')]
  JBankCard = interface(Jlibbasebinder_a)
    ['{CDC2877B-F53D-4FCD-ACE1-7F1D3E763015}']
  end;
  TJBankCard = class(TJavaGenericImport<JBankCardClass, JBankCard>) end;

  JCoreClass = interface(Jlibbasebinder_aClass)
    ['{600A91C5-EFA5-4680-B9C2-23862C87703E}']
    {class} function _GetALGORITHM_3DES: Integer; cdecl;
    {class} function _GetALGORITHM_AES: Integer; cdecl;
    {class} function _GetALGORITHM_DES: Integer; cdecl;
    {class} function _GetCALLBACK_ADVICE: Integer; cdecl;
    {class} function _GetCALLBACK_AMOUNT: Integer; cdecl;
    {class} function _GetCALLBACK_APPREF: Integer; cdecl;
    {class} function _GetCALLBACK_NOTIFY: Integer; cdecl;
    {class} function _GetCALLBACK_ONLINE: Integer; cdecl;
    {class} function _GetCALLBACK_PIN: Integer; cdecl;
    {class} function _GetCALLBACK_PINN: Integer; cdecl;
    {class} function _GetCALLBACK_PINRESULT: Integer; cdecl;
    {class} function _GetCALLBACK_UNKNOWNTLV: Integer; cdecl;
    {class} function _GetCALLBACK_VERIFYUSERIDCARD: Integer; cdecl;
    {class} function _GetDECRYPT_MODE: Integer; cdecl;
    {class} function _GetENCRYPT_MODE: Integer; cdecl;
    {class} function _GetENCRYPT_MODE_CBC: Integer; cdecl;
    {class} function _GetENCRYPT_MODE_ECB: Integer; cdecl;
    {class} function _GetEnDecrypt_3DES: Byte; cdecl;
    {class} function _GetEnDecrypt_AES: Byte; cdecl;
    {class} function _GetEnDecrypt_DES: Byte; cdecl;
    {class} function _GetEnDecrypt_SM4: Byte; cdecl;
    {class} function _GetGETMAC_3DES: Byte; cdecl;
    {class} function _GetGETMAC_AES: Byte; cdecl;
    {class} function _GetGETMAC_DES: Byte; cdecl;
    {class} function _GetGETMAC_SM4: Byte; cdecl;
    {class} function _GetIM_KEY_3DES: Byte; cdecl;
    {class} function _GetIM_KEY_AES: Byte; cdecl;
    {class} function _GetIM_KEY_DES: Byte; cdecl;
    {class} function _GetIM_KEY_SM4: Byte; cdecl;
    {class} function _GetKEY_PROTECT_TLK: Byte; cdecl;
    {class} function _GetKEY_PROTECT_TMK: Byte; cdecl;
    {class} function _GetKEY_PROTECT_ZERO: Byte; cdecl;
    {class} function _GetKEY_REQUEST_DDEK: Byte; cdecl;
    {class} function _GetKEY_REQUEST_DEK: Byte; cdecl;
    {class} function _GetKEY_REQUEST_DMAK: Byte; cdecl;
    {class} function _GetKEY_REQUEST_IPEK: Byte; cdecl;
    {class} function _GetKEY_REQUEST_KBPK: Byte; cdecl;
    {class} function _GetKEY_REQUEST_MAK: Byte; cdecl;
    {class} function _GetKEY_REQUEST_PEK: Byte; cdecl;
    {class} function _GetKEY_REQUEST_TLK: Byte; cdecl;
    {class} function _GetKEY_REQUEST_TMK: Byte; cdecl;
    {class} function _GetPDD_MODE_2: Integer; cdecl;
    {class} function _GetPDD_MODE_9797: Integer; cdecl;
    {class} function _GetPDD_MODE_NONE: Integer; cdecl;
    {class} function _GetPIN_CMD_PREPARE: Byte; cdecl;
    {class} function _GetPIN_CMD_QUIT: Byte; cdecl;
    {class} function _GetPIN_CMD_UPDATE: Byte; cdecl;
    {class} function _GetPIN_PREPARE_APAsswordNew: Byte; cdecl;
    {class} function _GetPIN_PREPARE_APassword: Byte; cdecl;
    {class} function _GetPIN_PREPARE_BPAssword: Byte; cdecl;
    {class} function _GetPIN_PREPARE_BPAsswordNew: Byte; cdecl;
    {class} function _GetPIN_PREPARE_OFFLINE: Byte; cdecl;
    {class} function _GetPIN_PREPARE_ONLINE: Byte; cdecl;
    {class} function _GetPIN_QUIT_BYPASS: Byte; cdecl;
    {class} function _GetPIN_QUIT_CANCEL: Byte; cdecl;
    {class} function _GetPIN_QUIT_ERROR: Byte; cdecl;
    {class} function _GetPIN_QUIT_ERRORPAN: Byte; cdecl;
    {class} function _GetPIN_QUIT_NOUPLOAD: Byte; cdecl;
    {class} function _GetPIN_QUIT_PAINUPLOAD: Byte; cdecl;
    {class} function _GetPIN_QUIT_PINBLOCKUPLOAD: Byte; cdecl;
    {class} function _GetPIN_QUIT_SUCCESS: Byte; cdecl;
    {class} function _GetPIN_QUIT_TIMEOUT: Byte; cdecl;
    {class} function _GetPMK_UPADATE_KEYTYPE: Byte; cdecl;
    {class} function _GetPMK_UPDATE_KEYINDEX: Byte; cdecl;
    {class} function _GetPMK_UPDATE_KEYLEN: Byte; cdecl;
    {class} function EmvLib_GetPrintStatus(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function GeneratePINPrepareData(P1: Jlibbasebinder_a_a): Integer; cdecl; overload;//Deprecated
    {class} function GetSPLog(P1: Integer; P2: Integer; P3: TJavaArray<Integer>; P4: TJavaArray<Byte>): Integer; cdecl;//Deprecated
    {class} function Get_KeySign(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: Integer; P6: TJavaArray<Byte>; P7: TJavaArray<Byte>): Integer; cdecl;//Deprecated
    {class} function SDK_ReadData(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function SDK_SendData(P1: TJavaArray<Byte>; P2: Integer): Integer; cdecl;//Deprecated
    {class} function SerailDebugPort(P1: Integer; P2: Integer): Integer; cdecl;//Deprecated
    {class} function SetKernel(P1: Integer; P2: Integer; P3: Integer): Integer; cdecl;//Deprecated
    {class} function buzzer: Integer; cdecl;//Deprecated
    {class} function buzzerEx(P1: Integer): Integer; cdecl;//Deprecated
    {class} function clearTamperStatus: Integer; cdecl;//Deprecated
    {class} function dataEnDecrypt(P1: TJavaArray<Byte>; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function dataEnDecryptEx(P1: Integer; P2: Integer; P3: JString; P4: Integer; P5: Integer; P6: TJavaArray<Byte>; P7: Integer; P8: TJavaArray<Byte>; P9: Integer; P10: TJavaArray<Byte>; P11: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function dataEnDecryptExIndex(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: TJavaArray<Byte>; P7: Integer; P8: TJavaArray<Byte>; P9: Integer; P10: TJavaArray<Byte>; P11: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function dataEnDecryptForIPEK(P1: Integer; P2: Integer; P3: JString; P4: Integer; P5: Integer; P6: TJavaArray<Byte>; P7: Integer; P8: TJavaArray<Byte>; P9: Integer; P10: TJavaArray<Byte>; P11: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function decode_Close: Integer; cdecl;//Deprecated
    {class} function decode_Init(P1: Ja_e): Integer; cdecl;//Deprecated
    {class} function decode_SetLightsMode(P1: Integer): Integer; cdecl;//Deprecated
    {class} function decode_SetMaxMultiReadCount(P1: Integer): Integer; cdecl;//Deprecated
    {class} function decode_StartContinuousScan(P1: Integer): Integer; cdecl;//Deprecated
    {class} function decode_StartMultiScan(P1: Integer): Integer; cdecl;//Deprecated
    {class} function decode_StartSingleScan(P1: Integer): Integer; cdecl;//Deprecated
    {class} function decode_StopScan: Integer; cdecl;//Deprecated
    {class} function enableTamper(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function generatePINPrepareData(P1: TJavaArray<Byte>; P2: JButton; P3: JButton; P4: JButton; P5: JButton; P6: JButton; P7: JButton; P8: JButton; P9: JButton; P10: JButton; P11: JButton; P12: JButton; P13: JButton; P14: JButton; P15: JActivity): Integer; cdecl; overload;//Deprecated
    {class} function generatePINPrepareData(P1: TJavaArray<Byte>; P2: JButton; P3: JButton; P4: JButton; P5: JButton; P6: JButton; P7: JButton; P8: JButton; P9: JButton; P10: JButton; P11: JButton; P12: JButton; P13: JButton; P14: JButton; P15: JButton; P16: JActivity): Integer; cdecl; overload;//Deprecated
    {class} function generatePINPrepareData(P1: TJavaArray<Byte>; P2: JButton; P3: JButton; P4: JButton; P5: JButton; P6: JButton; P7: JButton; P8: JButton; P9: JButton; P10: JButton; P11: JButton; P12: JButton; P13: JButton; P14: JButton; P15: JButton; P16: Integer): Integer; cdecl; overload;//Deprecated
    {class} function generatePINPrepareData_HS(P1: TJavaArray<Byte>; P2: JButton; P3: JButton; P4: JButton; P5: JButton; P6: JButton; P7: JButton; P8: JButton; P9: JButton; P10: JButton; P11: JButton; P12: JButton; P13: JButton; P14: JButton; P15: JButton; P16: JContext; P17: Integer): Integer; cdecl;//Deprecated
    {class} function genereateRandomNum(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl;//Deprecated
    {class} function getBatteryLevel(P1: TJavaArray<Byte>): Integer; cdecl;//Deprecated
    {class} function getButtonPosition(P1: JButton; P2: TJavaArray<Byte>; P3: Integer): Integer; cdecl;//Deprecated
    {class} function getButtonPosition_HS(P1: JButton; P2: TJavaArray<Byte>; P3: JContext; P4: Integer): Integer; cdecl;//Deprecated
    {class} function getDateTime(P1: TJavaArray<Byte>): Integer; cdecl;//Deprecated
    {class} function getDeviceEncryptData(P1: JString; P2: JString): JString; cdecl;//Deprecated
    {class} function getDevicesVersion(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function getFirmWareNumber: JString; cdecl;//Deprecated
    {class} function getGMStatus(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function getMac(P1: TJavaArray<Byte>; P2: Integer; P3: TJavaArray<Byte>; P4: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function getMacEx(P1: JString; P2: Integer; P3: TJavaArray<Byte>; P4: Integer; P5: TJavaArray<Byte>; P6: Integer; P7: TJavaArray<Byte>; P8: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function getMacExIndex(P1: Integer; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: Integer; P6: TJavaArray<Byte>; P7: Integer; P8: TJavaArray<Byte>; P9: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function getMacForIPEK(P1: JString; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: Integer; P6: TJavaArray<Byte>; P7: Integer; P8: TJavaArray<Byte>; P9: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function getMacWithAlgorithm(P1: JString; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: Integer; P6: TJavaArray<Byte>; P7: Integer; P8: TJavaArray<Byte>; P9: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function getSDKVersion: JString; cdecl;//Deprecated
    {class} function getSpID(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function getSystemSn: JString; cdecl;//Deprecated
    {class} function getTamper(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function init(P1: JContext): JCore; cdecl;//Deprecated
    {class} function led(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer): Integer; cdecl;//Deprecated
    {class} function ledFlash(P1: Integer; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer): Integer; cdecl;//Deprecated
    {class} function pinPadRotation: Integer; cdecl;//Deprecated
    {class} function readDeviceSN: JString; cdecl;//Deprecated
    {class} function readSN(P1: TJavaArray<Byte>; P2: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function setDateTime(P1: TJavaArray<Byte>): Integer; cdecl;//Deprecated
    {class} function shortToByte(P1: SmallInt): TJavaArray<Byte>; cdecl;//Deprecated
    {class} function startPinInput(P1: Integer; P2: JString; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: TJavaArray<Byte>; P8: Integer; P9: TJavaArray<Byte>; P10: Ja_c): Integer; cdecl;//Deprecated
    {class} function startPinInputForIPEK(P1: Integer; P2: JString; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: TJavaArray<Byte>; P8: Integer; P9: TJavaArray<Byte>; P10: Ja_c): Integer; cdecl;//Deprecated
    {class} function transmitPSAM(P1: Integer; P2: TJavaArray<Byte>; P3: Integer; P4: TJavaArray<Byte>; P5: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function writeCallBackData(P1: TJavaArray<Byte>; P2: Integer): Integer; cdecl;//Deprecated
    {class} function writeCallBackDataWithCommandID(P1: Integer; P2: TJavaArray<Byte>; P3: Integer): Integer; cdecl;//Deprecated
    {class} function writeSN(P1: TJavaArray<Byte>; P2: Integer): Integer; cdecl;//Deprecated
    {class} property ALGORITHM_3DES: Integer read _GetALGORITHM_3DES;
    {class} property ALGORITHM_AES: Integer read _GetALGORITHM_AES;
    {class} property ALGORITHM_DES: Integer read _GetALGORITHM_DES;
    {class} property CALLBACK_ADVICE: Integer read _GetCALLBACK_ADVICE;
    {class} property CALLBACK_AMOUNT: Integer read _GetCALLBACK_AMOUNT;
    {class} property CALLBACK_APPREF: Integer read _GetCALLBACK_APPREF;
    {class} property CALLBACK_NOTIFY: Integer read _GetCALLBACK_NOTIFY;
    {class} property CALLBACK_ONLINE: Integer read _GetCALLBACK_ONLINE;
    {class} property CALLBACK_PIN: Integer read _GetCALLBACK_PIN;
    {class} property CALLBACK_PINN: Integer read _GetCALLBACK_PINN;
    {class} property CALLBACK_PINRESULT: Integer read _GetCALLBACK_PINRESULT;
    {class} property CALLBACK_UNKNOWNTLV: Integer read _GetCALLBACK_UNKNOWNTLV;
    {class} property CALLBACK_VERIFYUSERIDCARD: Integer read _GetCALLBACK_VERIFYUSERIDCARD;
    {class} property DECRYPT_MODE: Integer read _GetDECRYPT_MODE;
    {class} property ENCRYPT_MODE: Integer read _GetENCRYPT_MODE;
    {class} property ENCRYPT_MODE_CBC: Integer read _GetENCRYPT_MODE_CBC;
    {class} property ENCRYPT_MODE_ECB: Integer read _GetENCRYPT_MODE_ECB;
    {class} property EnDecrypt_3DES: Byte read _GetEnDecrypt_3DES;
    {class} property EnDecrypt_AES: Byte read _GetEnDecrypt_AES;
    {class} property EnDecrypt_DES: Byte read _GetEnDecrypt_DES;
    {class} property EnDecrypt_SM4: Byte read _GetEnDecrypt_SM4;
    {class} property GETMAC_3DES: Byte read _GetGETMAC_3DES;
    {class} property GETMAC_AES: Byte read _GetGETMAC_AES;
    {class} property GETMAC_DES: Byte read _GetGETMAC_DES;
    {class} property GETMAC_SM4: Byte read _GetGETMAC_SM4;
    {class} property IM_KEY_3DES: Byte read _GetIM_KEY_3DES;
    {class} property IM_KEY_AES: Byte read _GetIM_KEY_AES;
    {class} property IM_KEY_DES: Byte read _GetIM_KEY_DES;
    {class} property IM_KEY_SM4: Byte read _GetIM_KEY_SM4;
    {class} property KEY_PROTECT_TLK: Byte read _GetKEY_PROTECT_TLK;
    {class} property KEY_PROTECT_TMK: Byte read _GetKEY_PROTECT_TMK;
    {class} property KEY_PROTECT_ZERO: Byte read _GetKEY_PROTECT_ZERO;
    {class} property KEY_REQUEST_DDEK: Byte read _GetKEY_REQUEST_DDEK;
    {class} property KEY_REQUEST_DEK: Byte read _GetKEY_REQUEST_DEK;
    {class} property KEY_REQUEST_DMAK: Byte read _GetKEY_REQUEST_DMAK;
    {class} property KEY_REQUEST_IPEK: Byte read _GetKEY_REQUEST_IPEK;
    {class} property KEY_REQUEST_KBPK: Byte read _GetKEY_REQUEST_KBPK;
    {class} property KEY_REQUEST_MAK: Byte read _GetKEY_REQUEST_MAK;
    {class} property KEY_REQUEST_PEK: Byte read _GetKEY_REQUEST_PEK;
    {class} property KEY_REQUEST_TLK: Byte read _GetKEY_REQUEST_TLK;
    {class} property KEY_REQUEST_TMK: Byte read _GetKEY_REQUEST_TMK;
    {class} property PDD_MODE_2: Integer read _GetPDD_MODE_2;
    {class} property PDD_MODE_9797: Integer read _GetPDD_MODE_9797;
    {class} property PDD_MODE_NONE: Integer read _GetPDD_MODE_NONE;
    {class} property PIN_CMD_PREPARE: Byte read _GetPIN_CMD_PREPARE;
    {class} property PIN_CMD_QUIT: Byte read _GetPIN_CMD_QUIT;
    {class} property PIN_CMD_UPDATE: Byte read _GetPIN_CMD_UPDATE;
    {class} property PIN_PREPARE_APAsswordNew: Byte read _GetPIN_PREPARE_APAsswordNew;
    {class} property PIN_PREPARE_APassword: Byte read _GetPIN_PREPARE_APassword;
    {class} property PIN_PREPARE_BPAssword: Byte read _GetPIN_PREPARE_BPAssword;
    {class} property PIN_PREPARE_BPAsswordNew: Byte read _GetPIN_PREPARE_BPAsswordNew;
    {class} property PIN_PREPARE_OFFLINE: Byte read _GetPIN_PREPARE_OFFLINE;
    {class} property PIN_PREPARE_ONLINE: Byte read _GetPIN_PREPARE_ONLINE;
    {class} property PIN_QUIT_BYPASS: Byte read _GetPIN_QUIT_BYPASS;
    {class} property PIN_QUIT_CANCEL: Byte read _GetPIN_QUIT_CANCEL;
    {class} property PIN_QUIT_ERROR: Byte read _GetPIN_QUIT_ERROR;
    {class} property PIN_QUIT_ERRORPAN: Byte read _GetPIN_QUIT_ERRORPAN;
    {class} property PIN_QUIT_NOUPLOAD: Byte read _GetPIN_QUIT_NOUPLOAD;
    {class} property PIN_QUIT_PAINUPLOAD: Byte read _GetPIN_QUIT_PAINUPLOAD;
    {class} property PIN_QUIT_PINBLOCKUPLOAD: Byte read _GetPIN_QUIT_PINBLOCKUPLOAD;
    {class} property PIN_QUIT_SUCCESS: Byte read _GetPIN_QUIT_SUCCESS;
    {class} property PIN_QUIT_TIMEOUT: Byte read _GetPIN_QUIT_TIMEOUT;
    {class} property PMK_UPADATE_KEYTYPE: Byte read _GetPMK_UPADATE_KEYTYPE;
    {class} property PMK_UPDATE_KEYINDEX: Byte read _GetPMK_UPDATE_KEYINDEX;
    {class} property PMK_UPDATE_KEYLEN: Byte read _GetPMK_UPDATE_KEYLEN;
  end;

  [JavaSignature('wangpos/sdk4/libbasebinder/Core')]
  JCore = interface(Jlibbasebinder_a)
    ['{972CA861-EEC2-47AC-AF22-BBB70B4483B7}']
  end;
  TJCore = class(TJavaGenericImport<JCoreClass, JCore>) end;

  Jlibbasebinder_PrinterClass = interface(Jlibbasebinder_aClass)
    ['{85D753CC-57CB-4A18-97D4-0F9C528F4F24}']
    {class} function _GetPAPER_WIDTH: Integer; cdecl;
    {class} procedure CheckBlueToothPrintStatus; cdecl;//Deprecated
    {class} function Get_ClearPrinterMileage(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl;//Deprecated
    {class} function SDK_Printer_Test: Integer; cdecl;//Deprecated
    {class} function clearPrintDataCache: Integer; cdecl;//Deprecated
    {class} function escposBlueToothPrint(P1: TJavaArray<Byte>): Integer; cdecl;//Deprecated
    {class} function finishBlueToothPrint: Integer; cdecl;//Deprecated
    {class} function getPrinterStatus(P1: TJavaArray<Integer>): Integer; cdecl;//Deprecated
    {class} function init(P1: JContext): Jlibbasebinder_Printer; cdecl;//Deprecated
    {class} function initBlueToothPrint(P1: Ja_d): Integer; cdecl;//Deprecated
    {class} function print2StringInLine(P1: JString; P2: JString; P3: Single; P4: JPrinter_Font; P5: Integer; P6: JPrinter_Align; P7: Boolean; P8: Boolean; P9: Boolean): Integer; cdecl;//Deprecated
    {class} function printBarCode(P1: JString; P2: Integer; P3: Boolean): Integer; cdecl;//Deprecated
    {class} function printBarCodeBase(P1: JString; P2: JPrinter_BarcodeType; P3: JPrinter_BarcodeWidth; P4: Integer; P5: Integer): Integer; cdecl;//Deprecated
    {class} function printFinish: Integer; cdecl;//Deprecated
    {class} function printImage(P1: JBitmap; P2: Integer; P3: JPrinter_Align): Integer; cdecl;//Deprecated
    {class} function printImageBase(P1: JBitmap; P2: Integer; P3: Integer; P4: JPrinter_Align; P5: Integer): Integer; cdecl;//Deprecated
    {class} function printInit: Integer; cdecl;//Deprecated
    {class} function printPDF417(P1: JString): Integer; cdecl; overload;//Deprecated
    {class} function printPDF417(P1: JString; P2: Integer; P3: Integer): Integer; cdecl; overload;//Deprecated
    {class} function printPDF417(P1: JString; P2: Integer; P3: Integer; P4: JPrinter_Align): Integer; cdecl; overload;//Deprecated
    {class} function printPaper(P1: Integer): Integer; cdecl;//Deprecated
    {class} function printPaper_trade(P1: Integer; P2: Integer): Integer; cdecl;//Deprecated
    {class} function printQRCode(P1: JString): Integer; cdecl; overload;//Deprecated
    {class} function printQRCode(P1: JString; P2: Integer): Integer; cdecl; overload;//Deprecated
    {class} function printQRCode(P1: JString; P2: Integer; P3: JPrinter_Align): Integer; cdecl; overload;//Deprecated
    {class} function printString(P1: JString; P2: Integer; P3: JPrinter_Align; P4: Boolean; P5: Boolean): Integer; cdecl;//Deprecated
    {class} function printStringBase(P1: JString; P2: Integer; P3: Single; P4: Single; P5: Integer; P6: JPrinter_Align; P7: Boolean; P8: Boolean; P9: Boolean): Integer; cdecl;//Deprecated
    {class} function printStringExt(P1: JString; P2: Integer; P3: Single; P4: Single; P5: JPrinter_Font; P6: Integer; P7: JPrinter_Align; P8: Boolean; P9: Boolean; P10: Boolean): Integer; cdecl;//Deprecated
    {class} function printStringWithScaleX(P1: JString; P2: Integer; P3: Single; P4: Single; P5: Single; P6: JPrinter_Font; P7: Integer; P8: JPrinter_Align; P9: Boolean; P10: Boolean; P11: Boolean): Integer; cdecl;//Deprecated
    {class} function setGrayLevel(P1: Integer): Integer; cdecl;//Deprecated
    {class} procedure setPrintFontType(P1: JContext; P2: JString); cdecl;//Deprecated
    {class} function startBlueToothPrint: Integer; cdecl;//Deprecated
    {class} property PAPER_WIDTH: Integer read _GetPAPER_WIDTH;
  end;

  [JavaSignature('wangpos/sdk4/libbasebinder/Printer')]
  Jlibbasebinder_Printer = interface(Jlibbasebinder_a)
    ['{0921C883-0218-4DF6-B32B-BA92646D76FA}']
  end;
  TJlibbasebinder_Printer = class(TJavaGenericImport<Jlibbasebinder_PrinterClass, Jlibbasebinder_Printer>) end;

  JPrinter_AlignClass = interface(JEnumClass)
    ['{56499BE8-4BCC-4006-AD0F-4FE8AC18BAC2}']
    {class} function _GetCENTER: JPrinter_Align; cdecl;
    {class} function _GetLEFT: JPrinter_Align; cdecl;
    {class} function _GetRIGHT: JPrinter_Align; cdecl;
    {class} function valueOf(P1: JString): JPrinter_Align; cdecl;//Deprecated
    {class} function values: TJavaObjectArray<JPrinter_Align>; cdecl;//Deprecated
    {class} property CENTER: JPrinter_Align read _GetCENTER;
    {class} property LEFT: JPrinter_Align read _GetLEFT;
    {class} property RIGHT: JPrinter_Align read _GetRIGHT;
  end;

  [JavaSignature('wangpos/sdk4/libbasebinder/Printer$Align')]
  JPrinter_Align = interface(JEnum)
    ['{91DA4385-DAF8-4C15-AACA-B675CEE18381}']
  end;
  TJPrinter_Align = class(TJavaGenericImport<JPrinter_AlignClass, JPrinter_Align>) end;

  JPrinter_BarcodeTypeClass = interface(JEnumClass)
    ['{3A160DE7-0DE0-4281-A63E-E2B6820888E5}']
    {class} function _GetAZTEC: JPrinter_BarcodeType; cdecl;
    {class} function _GetCODABAR: JPrinter_BarcodeType; cdecl;
    {class} function _GetCODE_128: JPrinter_BarcodeType; cdecl;
    {class} function _GetCODE_39: JPrinter_BarcodeType; cdecl;
    {class} function _GetCODE_93: JPrinter_BarcodeType; cdecl;
    {class} function _GetDATA_MATRIX: JPrinter_BarcodeType; cdecl;
    {class} function _GetEAN_13: JPrinter_BarcodeType; cdecl;
    {class} function _GetEAN_8: JPrinter_BarcodeType; cdecl;
    {class} function _GetITF: JPrinter_BarcodeType; cdecl;
    {class} function _GetMAXICODE: JPrinter_BarcodeType; cdecl;
    {class} function _GetPDF_417: JPrinter_BarcodeType; cdecl;
    {class} function _GetQR_CODE: JPrinter_BarcodeType; cdecl;
    {class} function _GetRSS_14: JPrinter_BarcodeType; cdecl;
    {class} function _GetRSS_EXPANDED: JPrinter_BarcodeType; cdecl;
    {class} function _GetUPC_A: JPrinter_BarcodeType; cdecl;
    {class} function _GetUPC_E: JPrinter_BarcodeType; cdecl;
    {class} function _GetUPC_EAN_EXTENSION: JPrinter_BarcodeType; cdecl;
    {class} function valueOf(P1: JString): JPrinter_BarcodeType; cdecl;//Deprecated
    {class} function values: TJavaObjectArray<JPrinter_BarcodeType>; cdecl;//Deprecated
    {class} property AZTEC: JPrinter_BarcodeType read _GetAZTEC;
    {class} property CODABAR: JPrinter_BarcodeType read _GetCODABAR;
    {class} property CODE_128: JPrinter_BarcodeType read _GetCODE_128;
    {class} property CODE_39: JPrinter_BarcodeType read _GetCODE_39;
    {class} property CODE_93: JPrinter_BarcodeType read _GetCODE_93;
    {class} property DATA_MATRIX: JPrinter_BarcodeType read _GetDATA_MATRIX;
    {class} property EAN_13: JPrinter_BarcodeType read _GetEAN_13;
    {class} property EAN_8: JPrinter_BarcodeType read _GetEAN_8;
    {class} property ITF: JPrinter_BarcodeType read _GetITF;
    {class} property MAXICODE: JPrinter_BarcodeType read _GetMAXICODE;
    {class} property PDF_417: JPrinter_BarcodeType read _GetPDF_417;
    {class} property QR_CODE: JPrinter_BarcodeType read _GetQR_CODE;
    {class} property RSS_14: JPrinter_BarcodeType read _GetRSS_14;
    {class} property RSS_EXPANDED: JPrinter_BarcodeType read _GetRSS_EXPANDED;
    {class} property UPC_A: JPrinter_BarcodeType read _GetUPC_A;
    {class} property UPC_E: JPrinter_BarcodeType read _GetUPC_E;
    {class} property UPC_EAN_EXTENSION: JPrinter_BarcodeType read _GetUPC_EAN_EXTENSION;
  end;

  [JavaSignature('wangpos/sdk4/libbasebinder/Printer$BarcodeType')]
  JPrinter_BarcodeType = interface(JEnum)
    ['{65789BC7-2D95-46BB-923A-B4919BE2EBDD}']
  end;
  TJPrinter_BarcodeType = class(TJavaGenericImport<JPrinter_BarcodeTypeClass, JPrinter_BarcodeType>) end;

  JPrinter_BarcodeWidthClass = interface(JEnumClass)
    ['{3D8D6C2A-DC1F-40F5-BEB6-A1605955326D}']
    {class} function _GetHUGE: JPrinter_BarcodeWidth; cdecl;
    {class} function _GetLARGE: JPrinter_BarcodeWidth; cdecl;
    {class} function _GetNORMAL: JPrinter_BarcodeWidth; cdecl;
    {class} function _GetSMALL: JPrinter_BarcodeWidth; cdecl;
    {class} function valueOf(P1: JString): JPrinter_BarcodeWidth; cdecl;//Deprecated
    {class} function values: TJavaObjectArray<JPrinter_BarcodeWidth>; cdecl;//Deprecated
    {class} property HUGE: JPrinter_BarcodeWidth read _GetHUGE;
    {class} property LARGE: JPrinter_BarcodeWidth read _GetLARGE;
    {class} property NORMAL: JPrinter_BarcodeWidth read _GetNORMAL;
    {class} property SMALL: JPrinter_BarcodeWidth read _GetSMALL;
  end;

  [JavaSignature('wangpos/sdk4/libbasebinder/Printer$BarcodeWidth')]
  JPrinter_BarcodeWidth = interface(JEnum)
    ['{65450A26-4FD1-405B-9A36-F9CF9D07AD3A}']
  end;
  TJPrinter_BarcodeWidth = class(TJavaGenericImport<JPrinter_BarcodeWidthClass, JPrinter_BarcodeWidth>) end;

  JPrinter_FontClass = interface(JEnumClass)
    ['{C5218CAB-DD55-427D-A9BE-C130FB88E324}']
    {class} function _GetDEFAULT: JPrinter_Font; cdecl;
    {class} function _GetDEFAULT_BOLD: JPrinter_Font; cdecl;
    {class} function _GetMONOSPACE: JPrinter_Font; cdecl;
    {class} function _GetSANS_SERIF: JPrinter_Font; cdecl;
    {class} function _GetSERIF: JPrinter_Font; cdecl;
    {class} function valueOf(P1: JString): JPrinter_Font; cdecl;//Deprecated
    {class} function values: TJavaObjectArray<JPrinter_Font>; cdecl;//Deprecated
    {class} property DEFAULT: JPrinter_Font read _GetDEFAULT;
    {class} property DEFAULT_BOLD: JPrinter_Font read _GetDEFAULT_BOLD;
    {class} property MONOSPACE: JPrinter_Font read _GetMONOSPACE;
    {class} property SANS_SERIF: JPrinter_Font read _GetSANS_SERIF;
    {class} property SERIF: JPrinter_Font read _GetSERIF;
  end;

  [JavaSignature('wangpos/sdk4/libbasebinder/Printer$Font')]
  JPrinter_Font = interface(JEnum)
    ['{CDDBEDCC-2EF0-4E93-89A3-9FD958D98EF5}']
  end;
  TJPrinter_Font = class(TJavaGenericImport<JPrinter_FontClass, JPrinter_Font>) end;

  JRspCodeClass = interface(JObjectClass)
    ['{138C1497-3C2B-4E14-94AD-41851FA0958D}']
    {class} function _GetERROR: Integer; cdecl;
    {class} function _GetOK: Integer; cdecl;
    {class} function init: JRspCode; cdecl;//Deprecated
    {class} property ERROR: Integer read _GetERROR;
    {class} property OK: Integer read _GetOK;
  end;

  [JavaSignature('wangpos/sdk4/libbasebinder/RspCode')]
  JRspCode = interface(JObject)
    ['{EB01EF60-A71C-445E-BD4E-52D52A710396}']
  end;
  TJRspCode = class(TJavaGenericImport<JRspCodeClass, JRspCode>) end;

  Ja_1Class = interface(JServiceConnectionClass)
    ['{119376B5-7AF5-42A1-A036-10AC25FF9C8B}']
    {class} function init(P1: Jlibbasebinder_a): Ja_1; cdecl;//Deprecated
    {class} procedure onServiceConnected(P1: JComponentName; P2: JIBinder); cdecl;//Deprecated
    {class} procedure onServiceDisconnected(P1: JComponentName); cdecl;//Deprecated
  end;

  [JavaSignature('wangpos/sdk4/libbasebinder/a$1')]
  Ja_1 = interface(JServiceConnection)
    ['{546AE8E5-2A8C-4D53-898D-59AB7CC814F9}']
  end;
  TJa_1 = class(TJavaGenericImport<Ja_1Class, Ja_1>) end;

  Ja_2Class = interface(JIBinder_DeathRecipientClass)
    ['{F0522B3E-FF04-4A5E-B8C6-13ED2425B9DF}']
    {class} procedure binderDied; cdecl;//Deprecated
    {class} function init(P1: Jlibbasebinder_a): Ja_2; cdecl;//Deprecated
  end;

  [JavaSignature('wangpos/sdk4/libbasebinder/a$2')]
  Ja_2 = interface(JIBinder_DeathRecipient)
    ['{39DD19CE-FE1A-4DE9-B20C-EBAD000872AC}']
  end;
  TJa_2 = class(TJavaGenericImport<Ja_2Class, Ja_2>) end;

  Jlibbasebinder_a_aClass = interface(JObjectClass)
    ['{2E18D678-D39C-4D7C-B416-AB4785CF243C}']
    {class} function _Geta: TJavaArray<Byte>; cdecl;
    {class} function _Getb: JButton; cdecl;
    {class} procedure _Setb(Value: JButton); cdecl;
    {class} function _Getc: JButton; cdecl;
    {class} procedure _Setc(Value: JButton); cdecl;
    {class} function _Getd: JButton; cdecl;
    {class} procedure _Setd(Value: JButton); cdecl;
    {class} function _Gete: JButton; cdecl;
    {class} procedure _Sete(Value: JButton); cdecl;
    {class} function _Getf: JButton; cdecl;
    {class} procedure _Setf(Value: JButton); cdecl;
    {class} function _Getg: JButton; cdecl;
    {class} procedure _Setg(Value: JButton); cdecl;
    {class} function _Geth: JButton; cdecl;
    {class} procedure _Seth(Value: JButton); cdecl;
    {class} function _Geti: JButton; cdecl;
    {class} procedure _Seti(Value: JButton); cdecl;
    {class} function _Getj: JButton; cdecl;
    {class} procedure _Setj(Value: JButton); cdecl;
    {class} function _Getk: JButton; cdecl;
    {class} procedure _Setk(Value: JButton); cdecl;
    {class} function _Getl: JButton; cdecl;
    {class} procedure _Setl(Value: JButton); cdecl;
    {class} function _Getm: JButton; cdecl;
    {class} procedure _Setm(Value: JButton); cdecl;
    {class} function _Getn: JButton; cdecl;
    {class} procedure _Setn(Value: JButton); cdecl;
    {class} function _Geto: JButton; cdecl;
    {class} procedure _Seto(Value: JButton); cdecl;
    {class} function _Getp: JActivity; cdecl;
    {class} procedure _Setp(Value: JActivity); cdecl;
    {class} property a: TJavaArray<Byte> read _Geta;
    {class} property b: JButton read _Getb write _Setb;
    {class} property c: JButton read _Getc write _Setc;
    {class} property d: JButton read _Getd write _Setd;
    {class} property e: JButton read _Gete write _Sete;
    {class} property f: JButton read _Getf write _Setf;
    {class} property g: JButton read _Getg write _Setg;
    {class} property h: JButton read _Geth write _Seth;
    {class} property i: JButton read _Geti write _Seti;
    {class} property j: JButton read _Getj write _Setj;
    {class} property k: JButton read _Getk write _Setk;
    {class} property l: JButton read _Getl write _Setl;
    {class} property m: JButton read _Getm write _Setm;
    {class} property n: JButton read _Getn write _Setn;
    {class} property o: JButton read _Geto write _Seto;
    {class} property p: JActivity read _Getp write _Setp;
  end;

  [JavaSignature('wangpos/sdk4/libbasebinder/a/a')]
  Jlibbasebinder_a_a = interface(JObject)
    ['{657F4E2A-208E-4D9B-95C5-06A0FF719C18}']
  end;
  TJlibbasebinder_a_a = class(TJavaGenericImport<Jlibbasebinder_a_aClass, Jlibbasebinder_a_a>) end;

  Jlibbasebinder_bClass = interface(JObjectClass)
    ['{27149141-91C1-4F64-B413-C089D9C24D82}']
    {class} function a(P1: TJavaArray<Byte>): JString; cdecl;//Deprecated
  end;

  [JavaSignature('wangpos/sdk4/libbasebinder/b')]
  Jlibbasebinder_b = interface(JObject)
    ['{F078D172-6B72-43C5-A9F5-F90FCBE1FC7D}']
  end;
  TJlibbasebinder_b = class(TJavaGenericImport<Jlibbasebinder_bClass, Jlibbasebinder_b>) end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('JavaInterfaces.JAnimator', TypeInfo(JavaInterfaces.JAnimator));
  TRegTypes.RegisterType('JavaInterfaces.JAnimator_AnimatorListener', TypeInfo(JavaInterfaces.JAnimator_AnimatorListener));
  TRegTypes.RegisterType('JavaInterfaces.JAnimator_AnimatorPauseListener', TypeInfo(JavaInterfaces.JAnimator_AnimatorPauseListener));
  TRegTypes.RegisterType('JavaInterfaces.JKeyframe', TypeInfo(JavaInterfaces.JKeyframe));
  TRegTypes.RegisterType('JavaInterfaces.JLayoutTransition', TypeInfo(JavaInterfaces.JLayoutTransition));
  TRegTypes.RegisterType('JavaInterfaces.JLayoutTransition_TransitionListener', TypeInfo(JavaInterfaces.JLayoutTransition_TransitionListener));
  TRegTypes.RegisterType('JavaInterfaces.JPropertyValuesHolder', TypeInfo(JavaInterfaces.JPropertyValuesHolder));
  TRegTypes.RegisterType('JavaInterfaces.JStateListAnimator', TypeInfo(JavaInterfaces.JStateListAnimator));
  TRegTypes.RegisterType('JavaInterfaces.JTimeInterpolator', TypeInfo(JavaInterfaces.JTimeInterpolator));
  TRegTypes.RegisterType('JavaInterfaces.JTypeConverter', TypeInfo(JavaInterfaces.JTypeConverter));
  TRegTypes.RegisterType('JavaInterfaces.JTypeEvaluator', TypeInfo(JavaInterfaces.JTypeEvaluator));
  TRegTypes.RegisterType('JavaInterfaces.JValueAnimator', TypeInfo(JavaInterfaces.JValueAnimator));
  TRegTypes.RegisterType('JavaInterfaces.JValueAnimator_AnimatorUpdateListener', TypeInfo(JavaInterfaces.JValueAnimator_AnimatorUpdateListener));
  TRegTypes.RegisterType('JavaInterfaces.JPathMotion', TypeInfo(JavaInterfaces.JPathMotion));
  TRegTypes.RegisterType('JavaInterfaces.JScene', TypeInfo(JavaInterfaces.JScene));
  TRegTypes.RegisterType('JavaInterfaces.JTransition', TypeInfo(JavaInterfaces.JTransition));
  TRegTypes.RegisterType('JavaInterfaces.JTransition_EpicenterCallback', TypeInfo(JavaInterfaces.JTransition_EpicenterCallback));
  TRegTypes.RegisterType('JavaInterfaces.JTransition_TransitionListener', TypeInfo(JavaInterfaces.JTransition_TransitionListener));
  TRegTypes.RegisterType('JavaInterfaces.JTransitionManager', TypeInfo(JavaInterfaces.JTransitionManager));
  TRegTypes.RegisterType('JavaInterfaces.JTransitionPropagation', TypeInfo(JavaInterfaces.JTransitionPropagation));
  TRegTypes.RegisterType('JavaInterfaces.JTransitionValues', TypeInfo(JavaInterfaces.JTransitionValues));
  TRegTypes.RegisterType('JavaInterfaces.JInterpolator', TypeInfo(JavaInterfaces.JInterpolator));
  TRegTypes.RegisterType('JavaInterfaces.JToolbar_LayoutParams', TypeInfo(JavaInterfaces.JToolbar_LayoutParams));
  TRegTypes.RegisterType('JavaInterfaces.Jgertec_Logger', TypeInfo(JavaInterfaces.Jgertec_Logger));
  TRegTypes.RegisterType('JavaInterfaces.Jgertec_a_a', TypeInfo(JavaInterfaces.Jgertec_a_a));
  TRegTypes.RegisterType('JavaInterfaces.Jgertec_a_a_a', TypeInfo(JavaInterfaces.Jgertec_a_a_a));
  TRegTypes.RegisterType('JavaInterfaces.Ja_a_a_a', TypeInfo(JavaInterfaces.Ja_a_a_a));
  TRegTypes.RegisterType('JavaInterfaces.JIGEDI', TypeInfo(JavaInterfaces.JIGEDI));
  TRegTypes.RegisterType('JavaInterfaces.JGEDI', TypeInfo(JavaInterfaces.JGEDI));
  TRegTypes.RegisterType('JavaInterfaces.JGEDI_1', TypeInfo(JavaInterfaces.JGEDI_1));
  TRegTypes.RegisterType('JavaInterfaces.JGEDI_KMS_st_Control_Callbacks', TypeInfo(JavaInterfaces.JGEDI_KMS_st_Control_Callbacks));
  TRegTypes.RegisterType('JavaInterfaces.JGediNative', TypeInfo(JavaInterfaces.JGediNative));
  TRegTypes.RegisterType('JavaInterfaces.JICL', TypeInfo(JavaInterfaces.JICL));
  TRegTypes.RegisterType('JavaInterfaces.Jgedi_a', TypeInfo(JavaInterfaces.Jgedi_a));
  TRegTypes.RegisterType('JavaInterfaces.JIAUDIO', TypeInfo(JavaInterfaces.JIAUDIO));
  TRegTypes.RegisterType('JavaInterfaces.Jgedi_a_a', TypeInfo(JavaInterfaces.Jgedi_a_a));
  TRegTypes.RegisterType('JavaInterfaces.Jgedi_a_b', TypeInfo(JavaInterfaces.Jgedi_a_b));
  TRegTypes.RegisterType('JavaInterfaces.JICLOCK', TypeInfo(JavaInterfaces.JICLOCK));
  TRegTypes.RegisterType('JavaInterfaces.Jgedi_b', TypeInfo(JavaInterfaces.Jgedi_b));
  TRegTypes.RegisterType('JavaInterfaces.Jgedi_a_c', TypeInfo(JavaInterfaces.Jgedi_a_c));
  TRegTypes.RegisterType('JavaInterfaces.JICRYPT', TypeInfo(JavaInterfaces.JICRYPT));
  TRegTypes.RegisterType('JavaInterfaces.Jgedi_c', TypeInfo(JavaInterfaces.Jgedi_c));
  TRegTypes.RegisterType('JavaInterfaces.Jgedi_a_d', TypeInfo(JavaInterfaces.Jgedi_a_d));
  TRegTypes.RegisterType('JavaInterfaces.Jgedi_a_e', TypeInfo(JavaInterfaces.Jgedi_a_e));
  TRegTypes.RegisterType('JavaInterfaces.JIINFO', TypeInfo(JavaInterfaces.JIINFO));
  TRegTypes.RegisterType('JavaInterfaces.Jgedi_d', TypeInfo(JavaInterfaces.Jgedi_d));
  TRegTypes.RegisterType('JavaInterfaces.Ja_f', TypeInfo(JavaInterfaces.Ja_f));
  TRegTypes.RegisterType('JavaInterfaces.Jf_1', TypeInfo(JavaInterfaces.Jf_1));
  TRegTypes.RegisterType('JavaInterfaces.JIKBD', TypeInfo(JavaInterfaces.JIKBD));
  TRegTypes.RegisterType('JavaInterfaces.Jgedi_e', TypeInfo(JavaInterfaces.Jgedi_e));
  TRegTypes.RegisterType('JavaInterfaces.Ja_g', TypeInfo(JavaInterfaces.Ja_g));
  TRegTypes.RegisterType('JavaInterfaces.Jg_1', TypeInfo(JavaInterfaces.Jg_1));
  TRegTypes.RegisterType('JavaInterfaces.Jg_10', TypeInfo(JavaInterfaces.Jg_10));
  TRegTypes.RegisterType('JavaInterfaces.Jg_11', TypeInfo(JavaInterfaces.Jg_11));
  TRegTypes.RegisterType('JavaInterfaces.Jg_12', TypeInfo(JavaInterfaces.Jg_12));
  TRegTypes.RegisterType('JavaInterfaces.Jg_13', TypeInfo(JavaInterfaces.Jg_13));
  TRegTypes.RegisterType('JavaInterfaces.Jg_2', TypeInfo(JavaInterfaces.Jg_2));
  TRegTypes.RegisterType('JavaInterfaces.Jg_3', TypeInfo(JavaInterfaces.Jg_3));
  TRegTypes.RegisterType('JavaInterfaces.Jg_4', TypeInfo(JavaInterfaces.Jg_4));
  TRegTypes.RegisterType('JavaInterfaces.Jg_5', TypeInfo(JavaInterfaces.Jg_5));
  TRegTypes.RegisterType('JavaInterfaces.Jg_6', TypeInfo(JavaInterfaces.Jg_6));
  TRegTypes.RegisterType('JavaInterfaces.Jg_7', TypeInfo(JavaInterfaces.Jg_7));
  TRegTypes.RegisterType('JavaInterfaces.Jg_8', TypeInfo(JavaInterfaces.Jg_8));
  TRegTypes.RegisterType('JavaInterfaces.Jg_9', TypeInfo(JavaInterfaces.Jg_9));
  TRegTypes.RegisterType('JavaInterfaces.JIKMS', TypeInfo(JavaInterfaces.JIKMS));
  TRegTypes.RegisterType('JavaInterfaces.Jgedi_g', TypeInfo(JavaInterfaces.Jgedi_g));
  TRegTypes.RegisterType('JavaInterfaces.Ja_h', TypeInfo(JavaInterfaces.Ja_h));
  TRegTypes.RegisterType('JavaInterfaces.Jc_a', TypeInfo(JavaInterfaces.Jc_a));
  TRegTypes.RegisterType('JavaInterfaces.Jh_1', TypeInfo(JavaInterfaces.Jh_1));
  TRegTypes.RegisterType('JavaInterfaces.Jh_2', TypeInfo(JavaInterfaces.Jh_2));
  TRegTypes.RegisterType('JavaInterfaces.JIMSR', TypeInfo(JavaInterfaces.JIMSR));
  TRegTypes.RegisterType('JavaInterfaces.Jgedi_i', TypeInfo(JavaInterfaces.Jgedi_i));
  TRegTypes.RegisterType('JavaInterfaces.Ja_i', TypeInfo(JavaInterfaces.Ja_i));
  TRegTypes.RegisterType('JavaInterfaces.Ji_1', TypeInfo(JavaInterfaces.Ji_1));
  TRegTypes.RegisterType('JavaInterfaces.JIPM', TypeInfo(JavaInterfaces.JIPM));
  TRegTypes.RegisterType('JavaInterfaces.Jgedi_j', TypeInfo(JavaInterfaces.Jgedi_j));
  TRegTypes.RegisterType('JavaInterfaces.Ja_j', TypeInfo(JavaInterfaces.Ja_j));
  TRegTypes.RegisterType('JavaInterfaces.JIPRNTR', TypeInfo(JavaInterfaces.JIPRNTR));
  TRegTypes.RegisterType('JavaInterfaces.Jgedi_k', TypeInfo(JavaInterfaces.Jgedi_k));
  TRegTypes.RegisterType('JavaInterfaces.Ja_k', TypeInfo(JavaInterfaces.Ja_k));
  TRegTypes.RegisterType('JavaInterfaces.Jk_1', TypeInfo(JavaInterfaces.Jk_1));
  TRegTypes.RegisterType('JavaInterfaces.JISMART', TypeInfo(JavaInterfaces.JISMART));
  TRegTypes.RegisterType('JavaInterfaces.Jgedi_l', TypeInfo(JavaInterfaces.Jgedi_l));
  TRegTypes.RegisterType('JavaInterfaces.Ja_l', TypeInfo(JavaInterfaces.Ja_l));
  TRegTypes.RegisterType('JavaInterfaces.Jl_1', TypeInfo(JavaInterfaces.Jl_1));
  TRegTypes.RegisterType('JavaInterfaces.Jl_2', TypeInfo(JavaInterfaces.Jl_2));
  TRegTypes.RegisterType('JavaInterfaces.Jl_3', TypeInfo(JavaInterfaces.Jl_3));
  TRegTypes.RegisterType('JavaInterfaces.JISYS', TypeInfo(JavaInterfaces.JISYS));
  TRegTypes.RegisterType('JavaInterfaces.Jgedi_m', TypeInfo(JavaInterfaces.Jgedi_m));
  TRegTypes.RegisterType('JavaInterfaces.Ja_m', TypeInfo(JavaInterfaces.Ja_m));
  TRegTypes.RegisterType('JavaInterfaces.Ja_n', TypeInfo(JavaInterfaces.Ja_n));
  TRegTypes.RegisterType('JavaInterfaces.Ja_o', TypeInfo(JavaInterfaces.Ja_o));
  TRegTypes.RegisterType('JavaInterfaces.Jo_1', TypeInfo(JavaInterfaces.Jo_1));
  TRegTypes.RegisterType('JavaInterfaces.JGEDI_CL_e_ISO_Level', TypeInfo(JavaInterfaces.JGEDI_CL_e_ISO_Level));
  TRegTypes.RegisterType('JavaInterfaces.JGEDI_CL_e_ISO_Type', TypeInfo(JavaInterfaces.JGEDI_CL_e_ISO_Type));
  TRegTypes.RegisterType('JavaInterfaces.JGEDI_CL_e_MF_KeyType', TypeInfo(JavaInterfaces.JGEDI_CL_e_MF_KeyType));
  TRegTypes.RegisterType('JavaInterfaces.JGEDI_CL_e_MF_Type', TypeInfo(JavaInterfaces.JGEDI_CL_e_MF_Type));
  TRegTypes.RegisterType('JavaInterfaces.JGEDI_CRYPT_e_Op', TypeInfo(JavaInterfaces.JGEDI_CRYPT_e_Op));
  TRegTypes.RegisterType('JavaInterfaces.JGEDI_FS_e_Storage', TypeInfo(JavaInterfaces.JGEDI_FS_e_Storage));
  TRegTypes.RegisterType('JavaInterfaces.JGEDI_INFO_e_ControlNumber', TypeInfo(JavaInterfaces.JGEDI_INFO_e_ControlNumber));
  TRegTypes.RegisterType('JavaInterfaces.JGEDI_INFO_e_Test', TypeInfo(JavaInterfaces.JGEDI_INFO_e_Test));
  TRegTypes.RegisterType('JavaInterfaces.JGEDI_KBD_e_Key', TypeInfo(JavaInterfaces.JGEDI_KBD_e_Key));
  TRegTypes.RegisterType('JavaInterfaces.JGEDI_KBD_e_PowerKeyMode', TypeInfo(JavaInterfaces.JGEDI_KBD_e_PowerKeyMode));
  TRegTypes.RegisterType('JavaInterfaces.JGEDI_KMS_e_BLOCKTYPE', TypeInfo(JavaInterfaces.JGEDI_KMS_e_BLOCKTYPE));
  TRegTypes.RegisterType('JavaInterfaces.JGEDI_KMS_e_EncMode', TypeInfo(JavaInterfaces.JGEDI_KMS_e_EncMode));
  TRegTypes.RegisterType('JavaInterfaces.JGEDI_KMS_e_KEYPURPOSE', TypeInfo(JavaInterfaces.JGEDI_KMS_e_KEYPURPOSE));
  TRegTypes.RegisterType('JavaInterfaces.JGEDI_KMS_e_KEYTYPE', TypeInfo(JavaInterfaces.JGEDI_KMS_e_KEYTYPE));
  TRegTypes.RegisterType('JavaInterfaces.JGEDI_KMS_e_KEYTYPE_LENGTH', TypeInfo(JavaInterfaces.JGEDI_KMS_e_KEYTYPE_LENGTH));
  TRegTypes.RegisterType('JavaInterfaces.JGEDI_KMS_e_OP', TypeInfo(JavaInterfaces.JGEDI_KMS_e_OP));
  TRegTypes.RegisterType('JavaInterfaces.JGEDI_LED_e_Id', TypeInfo(JavaInterfaces.JGEDI_LED_e_Id));
  TRegTypes.RegisterType('JavaInterfaces.JGEDI_MSR_e_Status', TypeInfo(JavaInterfaces.JGEDI_MSR_e_Status));
  TRegTypes.RegisterType('JavaInterfaces.JGEDI_PRNTR_e_Alignment', TypeInfo(JavaInterfaces.JGEDI_PRNTR_e_Alignment));
  TRegTypes.RegisterType('JavaInterfaces.JGEDI_PRNTR_e_BarCodeType', TypeInfo(JavaInterfaces.JGEDI_PRNTR_e_BarCodeType));
  TRegTypes.RegisterType('JavaInterfaces.JGEDI_PRNTR_e_Status', TypeInfo(JavaInterfaces.JGEDI_PRNTR_e_Status));
  TRegTypes.RegisterType('JavaInterfaces.JGEDI_SMART_e_MemoryCardType', TypeInfo(JavaInterfaces.JGEDI_SMART_e_MemoryCardType));
  TRegTypes.RegisterType('JavaInterfaces.JGEDI_SMART_e_Slot', TypeInfo(JavaInterfaces.JGEDI_SMART_e_Slot));
  TRegTypes.RegisterType('JavaInterfaces.JGEDI_SMART_e_Status', TypeInfo(JavaInterfaces.JGEDI_SMART_e_Status));
  TRegTypes.RegisterType('JavaInterfaces.JGEDI_SMART_e_Type', TypeInfo(JavaInterfaces.JGEDI_SMART_e_Type));
  TRegTypes.RegisterType('JavaInterfaces.JGEDI_SMART_e_Voltage', TypeInfo(JavaInterfaces.JGEDI_SMART_e_Voltage));
  TRegTypes.RegisterType('JavaInterfaces.JGEDI_SYS_e_SecuritySetup', TypeInfo(JavaInterfaces.JGEDI_SYS_e_SecuritySetup));
  TRegTypes.RegisterType('JavaInterfaces.JGEDI_e_Ret', TypeInfo(JavaInterfaces.JGEDI_e_Ret));
  TRegTypes.RegisterType('JavaInterfaces.JGediException', TypeInfo(JavaInterfaces.JGediException));
  TRegTypes.RegisterType('JavaInterfaces.Jgedi_f', TypeInfo(JavaInterfaces.Jgedi_f));
  TRegTypes.RegisterType('JavaInterfaces.JILED', TypeInfo(JavaInterfaces.JILED));
  TRegTypes.RegisterType('JavaInterfaces.Jgedi_h', TypeInfo(JavaInterfaces.Jgedi_h));
  TRegTypes.RegisterType('JavaInterfaces.JIEnums', TypeInfo(JavaInterfaces.JIEnums));
  TRegTypes.RegisterType('JavaInterfaces.JGEDI_AUTH_st_Data', TypeInfo(JavaInterfaces.JGEDI_AUTH_st_Data));
  TRegTypes.RegisterType('JavaInterfaces.JGEDI_CLOCK_st_RTC', TypeInfo(JavaInterfaces.JGEDI_CLOCK_st_RTC));
  TRegTypes.RegisterType('JavaInterfaces.JGEDI_CL_st_ISO_PollingInfo', TypeInfo(JavaInterfaces.JGEDI_CL_st_ISO_PollingInfo));
  TRegTypes.RegisterType('JavaInterfaces.JGEDI_CL_st_MF_ActivateInfo', TypeInfo(JavaInterfaces.JGEDI_CL_st_MF_ActivateInfo));
  TRegTypes.RegisterType('JavaInterfaces.JGEDI_CL_st_MF_Key', TypeInfo(JavaInterfaces.JGEDI_CL_st_MF_Key));
  TRegTypes.RegisterType('JavaInterfaces.JGEDI_CL_st_ResetEMVInfo', TypeInfo(JavaInterfaces.JGEDI_CL_st_ResetEMVInfo));
  TRegTypes.RegisterType('JavaInterfaces.JGEDI_CRYPT_st_RSAKeyGen', TypeInfo(JavaInterfaces.JGEDI_CRYPT_st_RSAKeyGen));
  TRegTypes.RegisterType('JavaInterfaces.JGEDI_KBD_st_Info', TypeInfo(JavaInterfaces.JGEDI_KBD_st_Info));
  TRegTypes.RegisterType('JavaInterfaces.JGEDI_KMS_st_CapturePINBlockInfo', TypeInfo(JavaInterfaces.JGEDI_KMS_st_CapturePINBlockInfo));
  TRegTypes.RegisterType('JavaInterfaces.JGEDI_KMS_st_Control', TypeInfo(JavaInterfaces.JGEDI_KMS_st_Control));
  TRegTypes.RegisterType('JavaInterfaces.JGEDI_KMS_st_Data', TypeInfo(JavaInterfaces.JGEDI_KMS_st_Data));
  TRegTypes.RegisterType('JavaInterfaces.JGEDI_KMS_st_KB', TypeInfo(JavaInterfaces.JGEDI_KMS_st_KB));
  TRegTypes.RegisterType('JavaInterfaces.JGEDI_KMS_st_PINBlock', TypeInfo(JavaInterfaces.JGEDI_KMS_st_PINBlock));
  TRegTypes.RegisterType('JavaInterfaces.JGEDI_KMS_st_SaveKey', TypeInfo(JavaInterfaces.JGEDI_KMS_st_SaveKey));
  TRegTypes.RegisterType('JavaInterfaces.JGEDI_MSR_st_LastErrors', TypeInfo(JavaInterfaces.JGEDI_MSR_st_LastErrors));
  TRegTypes.RegisterType('JavaInterfaces.JGEDI_MSR_st_Tracks', TypeInfo(JavaInterfaces.JGEDI_MSR_st_Tracks));
  TRegTypes.RegisterType('JavaInterfaces.JGEDI_PRNTR_st_BarCodeConfig', TypeInfo(JavaInterfaces.JGEDI_PRNTR_st_BarCodeConfig));
  TRegTypes.RegisterType('JavaInterfaces.JGEDI_PRNTR_st_PictureConfig', TypeInfo(JavaInterfaces.JGEDI_PRNTR_st_PictureConfig));
  TRegTypes.RegisterType('JavaInterfaces.JGEDI_PRNTR_st_StringConfig', TypeInfo(JavaInterfaces.JGEDI_PRNTR_st_StringConfig));
  TRegTypes.RegisterType('JavaInterfaces.JGEDI_SMART_st_ResetInfo', TypeInfo(JavaInterfaces.JGEDI_SMART_st_ResetInfo));
  TRegTypes.RegisterType('JavaInterfaces.Jsdk4_a_a', TypeInfo(JavaInterfaces.Jsdk4_a_a));
  TRegTypes.RegisterType('JavaInterfaces.Jsdk4_a_a_a', TypeInfo(JavaInterfaces.Jsdk4_a_a_a));
  TRegTypes.RegisterType('JavaInterfaces.Ja_a_a', TypeInfo(JavaInterfaces.Ja_a_a));
  TRegTypes.RegisterType('JavaInterfaces.Ja_b', TypeInfo(JavaInterfaces.Ja_b));
  TRegTypes.RegisterType('JavaInterfaces.Jb_a', TypeInfo(JavaInterfaces.Jb_a));
  TRegTypes.RegisterType('JavaInterfaces.Jb_a_a', TypeInfo(JavaInterfaces.Jb_a_a));
  TRegTypes.RegisterType('JavaInterfaces.Ja_c', TypeInfo(JavaInterfaces.Ja_c));
  TRegTypes.RegisterType('JavaInterfaces.Jc_a_a', TypeInfo(JavaInterfaces.Jc_a_a));
  TRegTypes.RegisterType('JavaInterfaces.Ja_d', TypeInfo(JavaInterfaces.Ja_d));
  TRegTypes.RegisterType('JavaInterfaces.Jd_a', TypeInfo(JavaInterfaces.Jd_a));
  TRegTypes.RegisterType('JavaInterfaces.Jd_a_a', TypeInfo(JavaInterfaces.Jd_a_a));
  TRegTypes.RegisterType('JavaInterfaces.Ja_e', TypeInfo(JavaInterfaces.Ja_e));
  TRegTypes.RegisterType('JavaInterfaces.Je_a', TypeInfo(JavaInterfaces.Je_a));
  TRegTypes.RegisterType('JavaInterfaces.Je_a_a', TypeInfo(JavaInterfaces.Je_a_a));
  TRegTypes.RegisterType('JavaInterfaces.Jsdk4_b_a', TypeInfo(JavaInterfaces.Jsdk4_b_a));
  TRegTypes.RegisterType('JavaInterfaces.Jsdk4_b_a_a', TypeInfo(JavaInterfaces.Jsdk4_b_a_a));
  TRegTypes.RegisterType('JavaInterfaces.Jb_a_a_a', TypeInfo(JavaInterfaces.Jb_a_a_a));
  TRegTypes.RegisterType('JavaInterfaces.Jb_b', TypeInfo(JavaInterfaces.Jb_b));
  TRegTypes.RegisterType('JavaInterfaces.Jb_b_a', TypeInfo(JavaInterfaces.Jb_b_a));
  TRegTypes.RegisterType('JavaInterfaces.Jb_b_a_a', TypeInfo(JavaInterfaces.Jb_b_a_a));
  TRegTypes.RegisterType('JavaInterfaces.Jsdk4_c_a', TypeInfo(JavaInterfaces.Jsdk4_c_a));
  TRegTypes.RegisterType('JavaInterfaces.Jsdk4_c_a_a', TypeInfo(JavaInterfaces.Jsdk4_c_a_a));
  TRegTypes.RegisterType('JavaInterfaces.Jc_a_b', TypeInfo(JavaInterfaces.Jc_a_b));
  TRegTypes.RegisterType('JavaInterfaces.Jc_b', TypeInfo(JavaInterfaces.Jc_b));
  TRegTypes.RegisterType('JavaInterfaces.Jlibbasebinder_a', TypeInfo(JavaInterfaces.Jlibbasebinder_a));
  TRegTypes.RegisterType('JavaInterfaces.JBankCard', TypeInfo(JavaInterfaces.JBankCard));
  TRegTypes.RegisterType('JavaInterfaces.JCore', TypeInfo(JavaInterfaces.JCore));
  TRegTypes.RegisterType('JavaInterfaces.Jlibbasebinder_Printer', TypeInfo(JavaInterfaces.Jlibbasebinder_Printer));
  TRegTypes.RegisterType('JavaInterfaces.JPrinter_Align', TypeInfo(JavaInterfaces.JPrinter_Align));
  TRegTypes.RegisterType('JavaInterfaces.JPrinter_BarcodeType', TypeInfo(JavaInterfaces.JPrinter_BarcodeType));
  TRegTypes.RegisterType('JavaInterfaces.JPrinter_BarcodeWidth', TypeInfo(JavaInterfaces.JPrinter_BarcodeWidth));
  TRegTypes.RegisterType('JavaInterfaces.JPrinter_Font', TypeInfo(JavaInterfaces.JPrinter_Font));
  TRegTypes.RegisterType('JavaInterfaces.JRspCode', TypeInfo(JavaInterfaces.JRspCode));
  TRegTypes.RegisterType('JavaInterfaces.Ja_1', TypeInfo(JavaInterfaces.Ja_1));
  TRegTypes.RegisterType('JavaInterfaces.Ja_2', TypeInfo(JavaInterfaces.Ja_2));
  TRegTypes.RegisterType('JavaInterfaces.Jlibbasebinder_a_a', TypeInfo(JavaInterfaces.Jlibbasebinder_a_a));
  TRegTypes.RegisterType('JavaInterfaces.Jlibbasebinder_b', TypeInfo(JavaInterfaces.Jlibbasebinder_b));
end;

initialization
  RegisterTypes;
end.

