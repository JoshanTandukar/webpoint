import "dart:async";
import 'dart:convert';
import "package:webpoint/api/common/Resources.dart";
import "package:webpoint/api/common/Status.dart";
import 'package:webpoint/config/Config.dart';
import 'package:webpoint/utils/Utils.dart';
import "package:webpoint/view_object/common/Object.dart";
import 'package:http/http.dart' as http;

abstract class Api {
  Future<Resources<R>> doServerCallGet<T extends Object<dynamic>, R>(
    T obj,
  ) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
    };
    final result = await http.get(
      Uri.parse(Config.baseApiPlaceHolder),
      headers: requestHeaders,
    );
    if (result.body.isNotEmpty && result.statusCode == 200) {
      final dynamic hashMap = json.decode(result.body);
      if (hashMap is! Map) {
        // if it is not a map
        final List<T> tList = <T>[];
        try{
          hashMap.forEach((dynamic data) {
            Utils.cPrintRelease("Am i here $data");
            tList.add(obj.fromMap(data as dynamic) as T);
          });
        }
        catch(e){
          Utils.cPrintRelease(e.toString());
        }
        return Resources<R>(Status.SUCCESS, "", tList as R);
      } else {
        return Resources<R>(Status.SUCCESS, "", obj.fromMap(hashMap) as R);
      }
    } else {
      return Resources(Status.ERROR, Utils.getString("errorOccurred"), null);
    }
  }
}
