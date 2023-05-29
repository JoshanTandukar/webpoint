import "dart:async";

import "package:webpoint/api/ApiService.dart";
import "package:webpoint/api/common/Resources.dart";
import "package:webpoint/api/common/Status.dart";
import "package:webpoint/repository/Common/Repository.dart";
import 'package:webpoint/utils/Utils.dart';
import 'package:webpoint/view_object/response/DashboardResponse.dart';

class DashboardRepository extends Repository {
  DashboardRepository({required this.apiService}) : super();

  ApiService? apiService;

  Future<Resources<List<DashboardResponse>>> doDashboardApiCall(
    bool isConnectedToInternet, {
    bool isLoadFromServer = true,
  }) async {
    if (isConnectedToInternet) {
      final Resources<List<DashboardResponse>> resource =
          await apiService!.doFetchDashboardApiCall();
      if (resource.status == Status.SUCCESS) {
        if (resource.data!.isNotEmpty) {
          return Resources(Status.SUCCESS, "", resource.data);
        } else {
          return Resources(
            Status.SUCCESS,
            Utils.getString("errorOccurred"),
            null,
          );
        }
      } else {
        return Resources(
          Status.SUCCESS,
          Utils.getString("errorOccurred"),
          null,
        );
      }
    } else {
      return Resources(
        Status.SUCCESS,
        Utils.getString("errorOccurred"),
        null,
      );
    }
  }
}
