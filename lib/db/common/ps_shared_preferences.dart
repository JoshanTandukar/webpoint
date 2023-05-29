import "dart:async";
import "package:shared_preferences/shared_preferences.dart";
import 'package:webpoint/constant/Constants.dart';
import 'package:webpoint/view_object/common/ValueHolder.dart';

class PsSharedPreferences {
  PsSharedPreferences() {
    futureShared = SharedPreferences.getInstance();
    futureShared?.then((SharedPreferences shared) {
      this.shared = shared;
      loadValueHolder();
    });
  }

  Future<SharedPreferences>? futureShared;
  SharedPreferences? shared;

// Singleton instance
  static final PsSharedPreferences _singleton = PsSharedPreferences();

  // Singleton accessor
  static PsSharedPreferences? get instance => _singleton;

  final StreamController<ValueHolder> _valueController =
      StreamController<ValueHolder>();

  Stream<ValueHolder>? get valueHolder => _valueController.stream;

  void loadValueHolder() {
    final String? title = shared!.getString(Const.VALUE_HOLDER_TITLE);
    final int? id = shared!.getInt(Const.VALUE_HOLDER_ID);
    final int? userId = shared!.getInt(Const.VALUE_HOLDER_USER_ID);
    final String? body = shared!.getString(Const.VALUE_HOLDER_BODY);

    final ValueHolder valueHolder = ValueHolder(
      body: body,
      id: id,
      title: title,
      userId: userId,
    );

    _valueController.add(valueHolder);
  }

  Future<dynamic> replaceUserId(String userID) async {
    await shared!.setString(Const.VALUE_HOLDER_USER_ID, userID);

    loadValueHolder();
  }

  String? getUserId() {
    return shared!.getString(Const.VALUE_HOLDER_USER_ID);
  }

  Future<dynamic> replaceId(String id) async {
    await shared!.setString(Const.VALUE_HOLDER_ID, id);

    loadValueHolder();
  }

  String? getId() {
    return shared!.getString(Const.VALUE_HOLDER_ID);
  }

  Future<dynamic> replaceBody(String body) async {
    await shared!.setString(Const.VALUE_HOLDER_BODY, body);

    loadValueHolder();
  }

  String? getBody() {
    return shared!.getString(Const.VALUE_HOLDER_BODY);
  }

  Future<dynamic> replaceTitle(String title) async {
    await shared!.setString(Const.VALUE_HOLDER_TITLE, title);

    loadValueHolder();
  }

  String? getTitle() {
    return shared!.getString(Const.VALUE_HOLDER_TITLE);
  }
}
