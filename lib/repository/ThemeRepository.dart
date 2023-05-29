import "package:flutter/material.dart";
import "package:webpoint/config/ThemeData.dart";
import "package:webpoint/constant/Constants.dart";
import "package:webpoint/db/common/ps_shared_preferences.dart";
import 'package:webpoint/repository/Common/Repository.dart';

class PsThemeRepository extends Repository {
  PsThemeRepository({required PsSharedPreferences psSharedPreferences}) {
    _psSharedPreferences = psSharedPreferences;
  }

  late PsSharedPreferences? _psSharedPreferences;

  Future<void> updateTheme(bool isDarkTheme) async {
    await _psSharedPreferences!.shared!
        .setBool(Const.THEME_IS_DARK_THEME, isDarkTheme);
  }

  ThemeData getTheme() {
    final bool isDarkTheme =
        _psSharedPreferences!.shared!.getBool(Const.THEME_IS_DARK_THEME) ??
            false;
    if (isDarkTheme) {
      return themeData(ThemeData.dark());
    } else {
      return themeData(ThemeData.light());
    }
  }
}
