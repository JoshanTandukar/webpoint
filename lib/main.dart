import "dart:async";
import "package:easy_dynamic_theme/easy_dynamic_theme.dart";
import "package:easy_localization/easy_localization.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:webpoint/PSApp.dart";
import "package:webpoint/view_object/common/Language.dart";
import 'package:webpoint/config/Config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // GestureBinding.instance.resamplingEnabled = false;
  // if (kDebugMode) {
  //   Stetho.initialize();
  // }

  // AwesomeNotificationInit.awesomeNotificationInit();

  FlutterError.onError = (FlutterErrorDetails details) {
    Zone.current.handleUncaughtError(details.exception, details.stack!);
  };

  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Center(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "Error: ${details.summary.toDescription()}",
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  };

  final configuredApp = EasyLocalization(
    // data: data,
    // assetLoader: CsvAssetLoader(),
    path: "assets/langs",
    supportedLocales: getSupportedLanguages(),
    child: EasyDynamicThemeWidget(
      child: PSApp(),
    ),
  );

  runZonedGuarded(() => runApp(configuredApp), (error, stack) {});

  // runZonedGuarded(()
  // {
  // runApp(configuredApp);
  // }, FirebaseCrashlytics.instance.recordError);
}

List<Locale> getSupportedLanguages() {
  final List<Locale> localeList = <Locale>[];
  for (final Language lang in Config.psSupportedLanguageMap.values.toList()) {
    localeList.add(Locale(lang.languageCode!, lang.countryCode));
  }
  return localeList;
}
