import "package:flutter/material.dart";
import "package:webpoint/provider/common/ps_provider.dart";
import "package:webpoint/repository/ThemeRepository.dart";

class ThemeProvider extends Provider {
  ThemeProvider({required themeRepository, int limit = 0})
      : super(themeRepository, limit);

  late PsThemeRepository? themeRepository;

  Future<dynamic> updateTheme(bool isDarkTheme) {
    return themeRepository!.updateTheme(isDarkTheme);
  }

  ThemeData getTheme() {
    return themeRepository!.getTheme();
  }
}
