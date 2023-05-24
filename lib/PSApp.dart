import "dart:convert";

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
  @override
  Widget build(BuildContext context) {
    CustomColors.loadColor(context);
    return MultiProvider(
      providers: <SingleChildWidget>[
        ...providers,
      ],
      child: ScreenUtilInit(
        designSize: const Size(414, 896),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (child, __) {
          return GestureDetector(
            onTap: () {
              final currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus &&
                  currentFocus.focusedChild != null) {
                FocusManager.instance.primaryFocus!.unfocus();
              }
            },
            child: MaterialApp(
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
                  child: AppBuilder(
                    builder: (context) {
                      return child!;
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class AppBuilder extends StatefulWidget {
  final Widget Function(BuildContext)? builder;

  const AppBuilder({super.key, this.builder});

  @override
  AppBuilderState createState() => AppBuilderState();

  static AppBuilderState? of(BuildContext context) {
    return context.findAncestorStateOfType<AppBuilderState>();
  }
}

class AppBuilderState extends State<AppBuilder> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder!(context);
  }

  void rebuild() {
    setState(() {});
  }
}
