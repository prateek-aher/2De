import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/Network/Api_Provider.dart';
import 'package:delivery/UI/Auth/NewAccount/enter_name.dart';
import 'package:delivery/UI/Auth/enter_otp.dart';
import 'package:delivery/UI/Auth/enter_password.dart';
import 'package:delivery/Utils/AppConstant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SendOtpProvider extends ChangeNotifier {
  ApiProvider _apiProvider = ApiProvider();
  String? phoneNumber;
  Future<Null> testCall(requestJson, String number, context) async {
    phoneNumber = number;
    notifyListeners();
    try {
      // check login
      showLoading();
      final response = await _apiProvider.auth(Check_Login, requestJson);
      print(response);
      if (response['status'] == "failed") {
        // new user
        try {
          final response = await _apiProvider.auth(Send_Otp, requestJson);
          if (response != null) {
            print(response);
            if (response['status'] == "success") {
              hideLoading();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EnterOtp(number: number)));
              //notifyListeners();
            }
          }
        } on Exception catch (e) {
          hideLoading();
          print(e);
        }
      } else if (response['status'] == "success") {
        hideLoading();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EnterPassword(
                      number: phoneNumber!,
                    )));
      }
    } catch (e) {
      showLoading();
    }
    return null;
  }

  Future<Null> verifyOtp(requstJson, context) async {
    try {
      showLoading();
      final response = await _apiProvider.auth(Verify_Otp, requstJson);
      if (response != null) {
        hideLoading();
        if (response['status'] == "success") {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Entername(
                        number: phoneNumber!,
                      )));
        } else {
          showMessage('Error');
        }
      }
    } on Exception catch (e) {
      showMessage(e.toString());
      hideLoading();
    }
  }
}
