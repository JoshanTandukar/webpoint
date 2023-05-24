import "dart:io";

import "package:easy_localization/easy_localization.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:internet_connection_checker/internet_connection_checker.dart";

class Utils {
  Utils._();

  static String getString(String key) {
    if (key != "") {
      return tr(key);
    } else {
      return "";
    }
  }

  static DateTime? previous;

  static bool isLightMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light;
  }

  static Brightness getBrightnessForAppBar(BuildContext context) {
    if (Platform.isAndroid) {
      return Brightness.dark;
    } else {
      return Theme.of(context).brightness;
    }
  }

  static Future<bool> checkInternetConnectivity() async {
    return InternetConnectionChecker().hasConnection;
  }

  static Future<Stream<InternetConnectionStatus>>
  checkInternetConnectivityStatus() async {
    return InternetConnectionChecker().onStatusChange;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getStatusBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  static double getBottomNotchHeight(BuildContext context) {
    return MediaQuery.of(context).padding.bottom;
  }
}
