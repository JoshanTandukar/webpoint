import "package:webpoint/db/common/ps_shared_preferences.dart";

class Repository {
  void loadValueHolder() {
    PsSharedPreferences.instance!.loadValueHolder();
  }

  void replaceUserId(String loginUserId) {
    PsSharedPreferences.instance!.replaceUserId(loginUserId);
  }

  String? getUserId() {
    return PsSharedPreferences.instance!.getUserId() ?? "";
  }

  void replaceId(String id) {
    PsSharedPreferences.instance!.replaceId(id);
  }

  String? getId() {
    return PsSharedPreferences.instance!.getId() ?? "";
  }

  void replaceBody(String body) {
    PsSharedPreferences.instance!.replaceBody(body);
  }

  String? getBody() {
    return PsSharedPreferences.instance!.getBody() ?? "";
  }

  void replaceTitle(String title) {
    PsSharedPreferences.instance!.replaceTitle(title);
  }

  String? getTitle() {
    return PsSharedPreferences.instance!.getTitle() ?? "";
  }
}
