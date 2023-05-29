import 'package:webpoint/utils/Utils.dart';
import "package:webpoint/view_object/common/Object.dart";
import 'package:webpoint/view_object/response/DashboardResponseData.dart';

class DashboardResponse extends Object<DashboardResponse> {
  DashboardResponse({
    this.list,
  });

  List<DashboardResponseData>? list;

  @override
  String getPrimaryKey() {
    return "";
  }

  @override
  DashboardResponse? fromMap(dynamic dynamicData) {
    if (dynamicData != null) {
      return DashboardResponse(
        list: DashboardResponseData().fromMapList(dynamicData),
      );
    } else {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toMap(DashboardResponse? object) {
    if (object != null) {
      Map<String, dynamic> data = <String, dynamic>{};
      data["data"] = DashboardResponseData().toMapList(object.list);
      return data;
    } else {
      return null;
    }
  }

  @override
  List<DashboardResponse>? fromMapList(List<dynamic>? dynamicDataList) {
    Utils.cPrintRelease("from map list $dynamicDataList");
    final List<DashboardResponse> psAppInfoList = <DashboardResponse>[];
    if (dynamicDataList != null) {
      for (final dynamic json in dynamicDataList) {
        if (json != null) {
          psAppInfoList.add(fromMap(json)!);
        }
      }
    }
    return psAppInfoList;
  }

  @override
  List<Map<String, dynamic>>? toMapList(List<dynamic>? objectList) {
    Utils.cPrintRelease(
        "To map List Dashboard Response ${objectList.toString()}");
    final List<dynamic> dynamicList = <dynamic>[];
    if (objectList != null) {
      for (final dynamic data in objectList) {
        if (data != null) {
          dynamicList.add(toMap(data as DashboardResponse));
        }
      }
    }

    return dynamicList as List<Map<String, dynamic>>;
  }
}
