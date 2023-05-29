import "package:flutter/foundation.dart";
import "package:webpoint/config/Config.dart";
import "package:webpoint/repository/Common/Repository.dart";

class Provider extends ChangeNotifier {
  Provider(this.psRepository, int limit) {
    if (limit != 0) {
      this.limit = limit;
    }
  }

  bool isConnectedToInternet = false;
  bool isLoading = false;
  Repository psRepository;

  int offset = 0;
  int limit = Config.DEFAULT_LOADING_LIMIT;
  int _cacheDataLength = 0;
  int maxDataLoadingCount = 0;
  int maxDataLoadingCountLimit = 4;
  bool isReachMaxData = false;
  bool isDispose = false;

  void updateOffset(int dataLength) {
    if (offset == 0) {
      isReachMaxData = false;
      maxDataLoadingCount = 0;
    }
    if (dataLength == _cacheDataLength) {
      maxDataLoadingCount++;
      if (maxDataLoadingCount == maxDataLoadingCountLimit) {
        isReachMaxData = true;
      }
    } else {
      maxDataLoadingCount = 0;
    }

    offset = dataLength;
    _cacheDataLength = dataLength;
  }

  Future<void> loadValueHolder() async {
    psRepository.loadValueHolder();
  }

  Future<void> replaceUserId(String loginUserId) async {
    psRepository.replaceUserId(loginUserId);
  }

  String? getUserId() {
    return psRepository.getUserId();
  }

  Future<void> replaceId(String id) async {
    psRepository.replaceId(id);
  }

  String? getId() {
    return psRepository.getId();
  }

  Future<void> replaceBody(String replaceBody) async {
    psRepository.replaceBody(replaceBody);
  }

  String? getBody() {
    return psRepository.getBody();
  }

  Future<void> replaceTitle(String title) async {
    psRepository.replaceTitle(title);
  }

  String? getTitle() {
    return psRepository.getTitle();
  }
}
