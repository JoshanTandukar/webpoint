import 'package:webpoint/view_Object/common/Language.dart';

class Config {
  Config._();

  // Font Family
  static const String heeboRegular = "HeeboRegular";
  static const String heeboMedium = "HeeboMedium";
  static const String heeboBlack = "HeeboBlack";
  static const String heeboBold = "HeeboBold";
  static const String heeboExtraBold = "HeeboExtraBold";
  static const String heeboLight = "HeeboLight";
  static const String heeboThin = "HeeboThin";
  static const String manropeRegular = "ManropeRegular";
  static const String manropeMedium = "ManropeMedium";
  static const String manropeBold = "ManropeBold";
  static const String manropeExtraBold = "ManropeExtraBold";
  static const String manropeLight = "ManropeLight";
  static const String manropeSemiBold = "ManropeSemiBold";
  static const String manropeThin = "ManropeThin";
  static const bool checkOverFlow = false;

  static const String app_db_name = "webpoint_demo.db";

  static final Language defaultLanguage =
      Language(languageCode: "en", countryCode: "US", name: "English US");

  static final Map<String, Language> psSupportedLanguageMap = {
    "en": Language(languageCode: "en", countryCode: "US", name: "English US"),
    "fr": Language(languageCode: "fr", countryCode: "FR", name: "French"),
    "de": Language(languageCode: "de", countryCode: "DE", name: "German"),
    "da": Language(languageCode: "da", countryCode: "DK", name: "Danish"),
    "es": Language(languageCode: "es", countryCode: "ES", name: "Spanish"),
  };
}
