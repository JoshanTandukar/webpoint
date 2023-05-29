import "package:webpoint/view_object/common/Object.dart";

class DashboardResponse extends Object<DashboardResponse> {
  DashboardResponse({
    this.id,
    this.userId,
    this.title,
    this.body,
  });

  int? id;
  int? userId;
  String? title;
  String? body;

  @override
  String getPrimaryKey() {
    return "";
  }

  @override
  DashboardResponse? fromMap(dynamic dynamicData) {
    if (dynamicData != null) {
      return DashboardResponse(
        id: dynamicData["id"] as int,
        userId: dynamicData["userId"] as int,
        body: dynamicData["body"].toString(),
        title: dynamicData["title"].toString(),
      );
    } else {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toMap(DashboardResponse? object) {
    if (object != null) {
      final Map<String, dynamic> data = <String, dynamic>{};
      data["id"] = object.id;
      data["userId"] = object.userId;
      data["body"] = object.body;
      data["title"] = object.title;
      return data;
    } else {
      return null;
    }
  }

  @override
  List<DashboardResponse>? fromMapList(List<dynamic>? dynamicDataList) {
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
