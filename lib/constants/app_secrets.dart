// ignore_for_file: constant_identifier_names

class AppSecrets {
  AppSecrets._();
  static const bool production = true;

  static const String BASE_URL =
      production ? "https://azureapi.indiahealthlink.com" : "https://devserver.indiahealthlink.com";

  static const String BASE_URL_VAPT = "https://azureapiv2.indiahealthlink.com";

  static const String MICROSOFT_BASE_URL = "https://graph.microsoft.com";

  static const String RAZORPAY_PAYMENT_KEY =
      production ? "rzp_live_keRAkk0ilTO72f" : "rzp_test_OCp8bDk51p2f96";

  static const String ONE_TIME_SERVER_TOKEN =
      "hZH2vKcf1BPjROFM/DY0XAt89wo/09DXqsAzoCQC5QHYpXttcd5DNPOkFuhrPWcyT57DFFR9MnAdRAXoVw1j5yupkl+ps7+Z1UoM6uOrTxUBAA==";

  // static final Config oauthConfig = Config(
  //   tenant: 'common',
  //   clientId: 'e61ccb73-be25-4f31-a708-0156bd0dda6d',
  //   scope: 'User.Read',
  //   redirectUri: 'https://dashboard.indiahealthlink.com/ssoload/',
  //   navigatorKey: navigatorKey,
  // );
}
