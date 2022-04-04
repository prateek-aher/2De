import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/CommonWidget/Snackbar.dart';
import 'package:delivery/Network/Api_Provider.dart';
import 'package:delivery/UI/AdminConsole/dashboard.dart';
import 'package:delivery/UI/Main/Home/Homepage.dart';
import 'package:delivery/Utils/constants/endpoints.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier {
  ApiProvider _apiProvider = ApiProvider();
  Future<Null> handleLogin(requestJson, context) async {
    showLoading();
    try {
      SharedPreferences _preferences = await SharedPreferences.getInstance();
      final response = await _apiProvider.auth(LOGIN, requestJson);
      print(response);
      if (response != null) {
        hideLoading();
        if (response["status"] == "success") {
          _preferences.setString(
              "token", "${response["data"]["result"]["token"]}");
          _preferences.setString(
              "avatar", "${response["data"]["result"]["avatar"]}");
          _preferences.setString(
              "name", "${response["data"]["result"]["name"]}");
          _preferences.setString(
              "phone_no", "${response["data"]["result"]["phone_no"]}");
          _preferences.setString(
              "role", "${response["data"]["result"]["role"]}");

          if (response["data"]["result"]["role"] == "manager") {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Dashboard()),
                (route) => false);
          } else {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Homepage()),
                (route) => false);
          }
        } else if (response["status"] == "failed") {
          showCustomSnackBar(
              context, Text("${response["error"].toString().split(' || ')[1]}"),
              backgroundColor:
                  response["error"].toString().toLowerCase().contains('error')
                      ? Colors.red
                      : Theme.of(context).primaryColor);
        }
      }
    } on Exception catch (e) {
      hideLoading();
      showMessage(e.toString());
    }
  }
}
