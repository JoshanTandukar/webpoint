import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webpoint/config/CustomColors.dart';
import 'package:webpoint/constant/Dimens.dart';
import 'package:webpoint/view_object/response/DashboardResponse.dart';

class PlaceHolderItem extends StatelessWidget {
  const PlaceHolderItem({
    super.key,
    required this.dashboardResponse,
  });

  final DashboardResponse dashboardResponse;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: CustomColors.white,
      child: TextButton(
        onPressed: () {},
        child: Container(
          margin: EdgeInsets.fromLTRB(
            Dimens.space0.w,
            Dimens.space0.h,
            Dimens.space0.w,
            Dimens.space0.h,
          ),
          padding: EdgeInsets.fromLTRB(
            Dimens.space0.w,
            Dimens.space0.h,
            Dimens.space0.w,
            Dimens.space0.h,
          ),
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                dashboardResponse.title!,
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
              Text(
                dashboardResponse.body!,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: CustomColors.textSecondaryColor,
                      fontSize: Dimens.space16.sp,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
