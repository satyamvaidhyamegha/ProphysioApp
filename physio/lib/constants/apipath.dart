class APIPath {
  static const BASEURL = "http://ritzyware.net:3016";
  static const signupApiPath = "$BASEURL/mobile/user";
  static const loginApiPath = "$BASEURL/mobile/user/login";
  static const sendotp = "$BASEURL/mobile/user/sendEmailOtp";
  static const varifyotp = "$BASEURL/mobile/user/verifyotp";
  static const resetPassword = "$BASEURL/mobile/user/resetPassword";
  static const editProfile = "$BASEURL/mobile/user";
  static const notificationList = "$BASEURL/mobile/pushnotif/list";
  static const notificationAdd = "$BASEURL/mobile/pushnotif";
  static const foodLifeList = "$BASEURL/mobile/content/ContentSectionFilter";
  static const addContentData = "$BASEURL/mobile/content/ContentSectionSave";
  static const historySessionApi = "$BASEURL/mobile/session/getHistory";
  static const upcomingApi = "$BASEURL/mobile/session/getUpcoming";
  static const upcomingList = "$BASEURL/mobile/session/getUpcomingList";
  static const getFoodLifeStyle = "$BASEURL/mobile/content/foodlifestyle";
  static const foodSearchPath = "$BASEURL/mobile/Food/list/0/10";
  static const healthConditionPath = "$BASEURL/mobile/Healthissue/list/0/10";
  static const profilePicUpload = "$BASEURL/mobile/user/profileImage";
  static const settingFirstSave = "$BASEURL/mobile/usersetting";
  static const homepageCareIdeas = "$BASEURL/mobile/content/ContentSection";
  static const welbeingCreateApi = "$BASEURL/mobile/wellbeing";
  static const welbeingPainRecoverySaveApi = "$BASEURL/mobile/recovery";

  //added to fix erros, will be configured later
  static const NOTIFICATION_LIST = "$BASEURL/mobile/pushnotif/list";
  static const NOTIFICATION_ADD = "$BASEURL/mobile/pushnotif";
  static const DEMO_NOTIFICATION_LIST =
      "$BASEURL/mobile/userNotification/list/0/10";
}
