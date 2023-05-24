import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webpoint/config/CustomColors.dart';
import 'package:webpoint/provider/dashboard_provider/DasboardProvider.dart';
import 'package:webpoint/repository/DashboardRepository.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({
    super.key,
  });

  @override
  DashboardViewState createState() => DashboardViewState();
}

class DashboardViewState extends State<DashboardView> {
  DashboardRepository dashboardRepository;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.mainColor,
      body: ChangeNotifierProvider<DashboardProvider>(
        lazy: false,
        create: (BuildContext context) {
          appInfoProvider = AppInfoProvider(
              repository: appInfoRepository, valueHolder: valueHolder);
          // checkForNewVersion();
          return appInfoProvider!;
        },
        child: Consumer<AppInfoProvider>(
          builder: (BuildContext? context,
              AppInfoProvider? clearAllDataProvider, Widget? child) {
            return Container();
          },
        ),
      ),
    );
  }
}
