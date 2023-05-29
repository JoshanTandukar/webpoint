import 'package:device_preview/device_preview.dart';
import "package:easy_dynamic_theme/easy_dynamic_theme.dart";
import "package:easy_localization/easy_localization.dart";
import "package:flutter/material.dart";
import "package:flutter_localizations/flutter_localizations.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:webpoint/config/Router.dart" as router;
import "package:provider/provider.dart";
import "package:provider/single_child_widget.dart";
import 'package:webpoint/config/CustomColors.dart';
import 'package:webpoint/provider/ps_provider_dependencies.dart';

class PSApp extends StatelessWidget {
  const PSApp({super.key});

  @override
  Widget build(BuildContext context) {
    CustomColors.loadColor(context);
    return MultiProvider(
      providers: <SingleChildWidget>[
        ...providers,
      ],
      child: DevicePreview(
        enabled: false,
        builder: (context) => ScreenUtilInit(
          designSize: const Size(414, 896),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (child, __) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: "Web Point Demo",
              theme: ThemeData.light(),
              darkTheme: ThemeData.dark(),
              themeMode: EasyDynamicTheme.of(context).themeMode,
              localizationsDelegates: <LocalizationsDelegate<dynamic>>[
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                EasyLocalization.of(context)!.delegate,
              ],
              supportedLocales: EasyLocalization.of(context)!.supportedLocales,
              locale: EasyLocalization.of(context)!.locale,
              initialRoute: "/",
              routes: router.routes,
              builder: (BuildContext? context, Widget? child) {
                return MediaQuery(
                  data: MediaQuery.of(context!).copyWith(textScaleFactor: 1),
                  child: child!,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
