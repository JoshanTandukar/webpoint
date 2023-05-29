import 'dart:async';

import 'package:webpoint/api/common/Resources.dart';
import 'package:webpoint/api/common/Status.dart';
import 'package:webpoint/provider/common/ps_provider.dart';
import 'package:webpoint/repository/DashboardRepository.dart';
import 'package:webpoint/utils/Utils.dart';
import 'package:webpoint/view_object/common/ValueHolder.dart';
import 'package:webpoint/view_object/response/DashboardResponse.dart';

class DashboardProvider extends Provider {
  DashboardProvider({this.dashboardRepository, this.valueHolder, int limit = 0})
      : super(dashboardRepository!, limit) {
    streamControllerDashboardResponse =
        StreamController<Resources<List<DashboardResponse>>>.broadcast();
    subscriptionDashboardResponse = streamControllerDashboardResponse!.stream
        .listen((Resources<List<DashboardResponse>> resource) {
      if (resource.status != Status.BLOCK_LOADING &&
          resource.status != Status.PROGRESS_LOADING) {
        _dashboardResponse = resource;
        isLoading = false;
      }

      if (!isDispose) {
        notifyListeners();
      }
    });
  }

  DashboardRepository? dashboardRepository;
  ValueHolder? valueHolder;

  Resources<List<DashboardResponse>> _dashboardResponse =
      Resources<List<DashboardResponse>>(Status.NO_ACTION, "", null);

  Resources<List<DashboardResponse>> get dashboardResponse =>
      _dashboardResponse;

  StreamController<Resources<List<DashboardResponse>>>?
      streamControllerDashboardResponse;
  StreamSubscription<Resources<List<DashboardResponse>>>?
      subscriptionDashboardResponse;

  Future<Resources<List<DashboardResponse>>> doDashboardApiCall() async {
    bool isConnectedToInternet = await Utils.checkInternetConnectivity();
    final Resources<List<DashboardResponse>> psAppInfo =
        await dashboardRepository!.doDashboardApiCall(isConnectedToInternet);

    streamControllerDashboardResponse!.sink.add(psAppInfo);
    return psAppInfo;
  }
}
