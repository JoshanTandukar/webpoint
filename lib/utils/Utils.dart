import "dart:io";

import "package:easy_localization/easy_localization.dart";
import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import "package:internet_connection_checker/internet_connection_checker.dart";
import 'package:webpoint/constant/Dimens.dart';

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

  static Future<void> showToastMessage(String message) async {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: Dimens.space14.sp,
    );
  }

  static Future<void> cPrintRelease(String object) async {
    const int defaultPrintLength = 1020;
    if (object.length <= defaultPrintLength) {
      print(object);
    } else {
      final String log = object;
      int start = 0;
      int endIndex = defaultPrintLength;
      final int logLength = log.length;
      int tmpLogLength = log.length;
      while (endIndex < logLength) {
        print(log.substring(start, endIndex));
        endIndex += defaultPrintLength;
        start += defaultPrintLength;
        tmpLogLength -= defaultPrintLength;
      }
      if (tmpLogLength > 0) {
        print(log.substring(start, logLength));
      }
    }
  }
}
