import 'package:webpoint/api/common/Api.dart';
import 'package:webpoint/api/common/Resources.dart';
import 'package:webpoint/view_object/response/DashboardResponse.dart';

class ApiService extends Api {
  ///
  Future<Resources<List<DashboardResponse>>> doFetchDashboardApiCall() async {
    return doServerCallGet<DashboardResponse, List<DashboardResponse>>(
      DashboardResponse(),
    );
  }
}
