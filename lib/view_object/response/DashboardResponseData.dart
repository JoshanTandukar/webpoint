import "package:webpoint/view_object/common/Object.dart";

class DashboardResponseData extends Object<DashboardResponseData> {
  DashboardResponseData({
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
  DashboardResponseData? fromMap(dynamic dynamicData) {
    if (dynamicData != null) {
      return DashboardResponseData(
        id: dynamicData["id"],
        userId: dynamicData["userId"],
        body: dynamicData["body"].toString(),
        title: dynamicData["title"].toString(),
      );
    } else {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toMap(DashboardResponseData? object) {
    if (object != null) {
      final Map<String, dynamic> data = <String, dynamic>{};
      data["id"] = id;
      data["userId"] = userId;
      data["body"] = body;
      data["title"] = title;
      return data;
    } else {
      return null;
    }
  }

  @override
  List<DashboardResponseData>? fromMapList(List<dynamic>? dynamicDataList) {
    final List<DashboardResponseData> psAppInfoList = <DashboardResponseData>[];
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
          dynamicList.add(toMap(data as DashboardResponseData));
        }
      }
    }

    return dynamicList as List<Map<String, dynamic>>;
  }
}
