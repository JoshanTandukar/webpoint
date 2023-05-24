import "dart:async";
import "dart:io";

import "package:mvp/api/ApiService.dart";
import "package:mvp/api/common/Resources.dart";
import "package:mvp/api/common/Status.dart";
import "package:mvp/config/Config.dart";
import "package:mvp/repository/Common/Respository.dart";
import "package:mvp/viewObject/model/appRegister/AppRegister.dart";
import "package:mvp/viewObject/model/appRegister/AppRegisterResponse.dart";
import 'package:webpoint/api/ApiService.dart';
import 'package:webpoint/api/common/Resources.dart';
import 'package:webpoint/api/common/Status.dart';
import 'package:webpoint/view_object/response/DashboardResponse.dart';

class DashboardRepository extends Repository {
  DashboardRepository({required this.apiService}) : super();

  ApiService? apiService;

  Future<Resources<DashboardResponse>> doDashboardApiCall(
    bool isConnectedToInternet, {
    bool isLoadFromServer = true,
  }) async {
    if (isConnectedToInternet) {
      final Resources<DashboardResponse> resource =
          await apiService!.doFetchDashboardApiCall();
      if (resource.status == Status.SUCCESS) {
        if (resource.data!.list!.error != null) {
          return Resources(Status.SUCCESS, "", appInfo);
        } else {
          return Resources(
            Status.SUCCESS,
            "",
            resource.data!.appRegisterResponseData!.appVersion,
          );
        }
      } else {
        final AppRegister appInfo = AppRegister(
          versionForceUpdate: false,
          versionNeedClearData: false,
          versionNo: Config.appVersion,
        );
        return Resources(Status.SUCCESS, "", appInfo);
      }
    } else {
      final AppRegister appInfo = AppRegister(
        versionForceUpdate: false,
        versionNeedClearData: false,
        versionNo: Config.appVersion,
      );
      return Resources(Status.SUCCESS, "", appInfo);
    }
  }
}
