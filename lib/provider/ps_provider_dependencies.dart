import "package:flutter/material.dart";
import "package:webpoint/api/ApiService.dart";
import "package:webpoint/db/common/ps_shared_preferences.dart";
import "package:provider/provider.dart";
import "package:provider/single_child_widget.dart";
import 'package:webpoint/repository/DashboardRepository.dart';
import 'package:webpoint/repository/ThemeRepository.dart';
import 'package:webpoint/view_object/common/ValueHolder.dart';

List<SingleChildWidget> providers = <SingleChildWidget>[
  ...independentProviders,
  ..._dependentProviders,
  ..._valueProviders,
];

List<SingleChildWidget> independentProviders = <SingleChildWidget>[
  Provider<PsSharedPreferences>.value(value: PsSharedPreferences.instance!),
  Provider<ApiService>.value(value: ApiService()),
];

List<SingleChildWidget> _dependentProviders = <SingleChildWidget>[
  ProxyProvider<PsSharedPreferences, PsThemeRepository>(
    update: (_, PsSharedPreferences? ssSharedPreferences,
            PsThemeRepository? psThemeRepository) =>
        PsThemeRepository(psSharedPreferences: ssSharedPreferences!),
  ),
  ProxyProvider<ApiService, DashboardRepository>(
    update:
        (_, ApiService? apiService, DashboardRepository? appInfoRepository) =>
            DashboardRepository(apiService: apiService),
  ),
];

List<SingleChildWidget> _valueProviders = <SingleChildWidget>[
  StreamProvider<ValueHolder>(
    initialData: ValueHolder(),
    create: (BuildContext context) =>
        Provider.of<PsSharedPreferences>(context, listen: false).valueHolder,
  ),
];
