import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/Network/Api_Provider.dart';
import 'package:delivery/UI/Auth/NewAccount/successfully_registerd.dart';
import 'package:delivery/Utils/AppConstant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserRegistrationProvider extends ChangeNotifier {
  final ApiProvider _apiProvider = ApiProvider();

  Future<Null> registerUser(requestJson, context) async {
    try {
      showLoading();
      final response = await _apiProvider.auth(Register_User, requestJson);
      print(response);
      if (response != null) {
        if (response['status'] == "failed") {
          hideLoading();
          showMessage("${response["error"]}");
        } else if (response['status'] == "success") {
          hideLoading();
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => SuccessfullyRegistered()),
              (route) => false);
        }
      }
    } on Exception catch (e) {
      hideLoading();
      showMessage(e.toString());
    }
  }
}
