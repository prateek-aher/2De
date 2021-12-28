import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/Network/Api_Provider.dart';
import 'package:delivery/UI/Main/Homepage.dart';
import 'package:delivery/Utils/endpoints.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier {
  ApiProvider _apiProvider = ApiProvider();
  Future<Null> handleLogin(requestJson, context) async {
    showLoading();
    try {
      SharedPreferences _preferences = await SharedPreferences.getInstance();
      final response = await _apiProvider.auth(LOGIN, requestJson);
      if (response != null) {
        hideLoading();
        if (response["status"] == "success") {
          _preferences.setString(
              "token", "${response["data"]["result"]["token"]}");
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Homepage()),
              (route) => false);
        } else if (response["status"] == "failed") {
          showMessage("${response["error"]}");
        }
      }
    } on Exception catch (e) {
      hideLoading();
      showMessage(e.toString());
    }
  }
}
