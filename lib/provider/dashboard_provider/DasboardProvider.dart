
import 'package:provider/provider.dart';
import 'package:webpoint/api/common/Resources.dart';
import 'package:webpoint/api/common/Status.dart';
import 'package:webpoint/utils/Utils.dart';
import 'package:webpoint/view_object/common/ValueHolder.dart';
import 'package:webpoint/view_object/response/DashboardResponse.dart';

class DashboardProvider extends Provider {
  DashboardProvider({this.repository, this.valueHolder, int limit = 0})
      : super(repository!, limit);

  DashboardRepository? repository;
  ValueHolder? valueHolder;

  final Resources<DashboardResponse> appInfo =
      Resources<DashboardResponse>(Status.NO_ACTION, "", null);

  Resources<DashboardResponse> get categoryList => appInfo;

  Future<Resources<DashboardResponse>> doDashboardApiCall() async {
    bool isConnectedToInternet = await Utils.checkInternetConnectivity();
    final Resources<DashboardResponse> psAppInfo =
        await repository!.doDashboardApiCall(isConnectedToInternet);

    return psAppInfo;
  }
}
