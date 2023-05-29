import 'package:webpoint/api/common/Api.dart';
import 'package:webpoint/api/common/Resources.dart';
import 'package:webpoint/view_object/response/DashboardResponseData.dart';

class ApiService extends Api {
  ///
  Future<Resources<List<DashboardResponseData>>>
      doFetchDashboardApiCall() async {
    return doServerCallGet<DashboardResponseData, List<DashboardResponseData>>(
      DashboardResponseData(),
    );
  }
}
