import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:webpoint/api/common/Status.dart';
import 'package:webpoint/config/CustomColors.dart';
import 'package:webpoint/constant/Dimens.dart';
import 'package:webpoint/provider/dashboard_provider/DasboardProvider.dart';
import 'package:webpoint/repository/DashboardRepository.dart';
import 'package:webpoint/utils/Utils.dart';
import 'package:webpoint/view_object/common/ValueHolder.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({
    super.key,
  });

  @override
  DashboardViewState createState() => DashboardViewState();
}

class DashboardViewState extends State<DashboardView> {
  late DashboardRepository dashboardRepository;
  late DashboardProvider dashboardProvider;
  late ValueHolder valueHolder;

  @override
  void initState() {
    super.initState();
    valueHolder = Provider.of<ValueHolder>(
      context,
      listen: false,
    );
    dashboardRepository = Provider.of<DashboardRepository>(
      context,
      listen: false,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: CustomColors.baseColor,
        appBar: AppBar(
          toolbarHeight: kToolbarHeight.h,
          automaticallyImplyLeading: true,
          backgroundColor: CustomColors.baseColor,
          iconTheme: IconThemeData(
            color: CustomColors.baseColor,
          ),
          titleSpacing: 0,
          title: Text(
            Utils.getString("demoProject"),
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: CustomColors.textBoldColor,
                  fontSize: Dimens.space20.sp,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal,
                ),
          ),
          centerTitle: true,
          elevation: 5,
        ),
        body: ChangeNotifierProvider<DashboardProvider>(
          lazy: false,
          create: (BuildContext context) {
            dashboardProvider = DashboardProvider(
              dashboardRepository: dashboardRepository,
              valueHolder: valueHolder,
            );
            dashboardProvider.doDashboardApiCall();
            return dashboardProvider;
          },
          child: Consumer<DashboardProvider>(
            builder: (BuildContext context, DashboardProvider dashboardProvider,
                Widget? child) {
              return Container(
                width: MediaQuery.of(context).size.width.w,
                height: MediaQuery.of(context).size.height.h,
                color:
                    dashboardProvider.dashboardResponse.status == Status.SUCCESS
                        ? CustomColors.callAcceptColor
                        : CustomColors.callDeclineColor,
              );
            },
          ),
        ),
      ),
    );
  }
}
