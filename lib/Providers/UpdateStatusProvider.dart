import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/Network/Api_Provider.dart';
import 'package:delivery/Utils/constants/endpoints.dart';
import 'package:flutter/cupertino.dart';

class UpdateStatusProvider extends ChangeNotifier {
  ApiProvider _apiProvider = ApiProvider();
  String? _getStatus;
  String? get getStatus => _getStatus;
  Future<Null> updateStatus(requestJson) async {
    showLoading();
    final response = await _apiProvider.post(UPDATE_STATUS, requestJson);
    print(response);
    if (response != null) {
      hideLoading();
      if (response["status"] == "success") {
        _getStatus = "success";
        notifyListeners();
      }
    }
  }
}
