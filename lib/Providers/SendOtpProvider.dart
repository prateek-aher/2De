import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/CommonWidget/CustomSnackBar.dart';
import 'package:delivery/Network/Api_Provider.dart';
import 'package:delivery/UI/Auth/NewAccount/enter_name.dart';
import 'package:delivery/UI/Auth/enter_otp.dart';
import 'package:delivery/UI/Auth/enter_password.dart';
import 'package:delivery/Utils/constants/endpoints.dart';
import 'package:flutter/material.dart';

class SendOtpProvider extends ChangeNotifier {
  ApiProvider _apiProvider = ApiProvider();
  String? _phoneNumber;
  set phoneNum(String text) {
    _phoneNumber = text;
    notifyListeners();
  }

  Future<Null> testCall(requestJson, String number, BuildContext context,
      [bool resend = false]) async {
    _phoneNumber = number;
    notifyListeners();
    try {
      // check login
      // if (!resend) {
      showLoading();
      // }
      final response = await _apiProvider.auth(CHECK_LOGIN, requestJson);
      print(response);
      if (response['status'] == "failed") {
        // new user
        try {
          final response = await _apiProvider.auth(SEND_OTP, requestJson);
          if (response != null) {
            print(response);
            if (response['status'] == "success") {
              hideLoading();
              if (!resend) {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => EnterOtp(number: number)));
              } else {
                showCustomSnackBar(context, Text('An OTP has been sent to $number'));
              }
            }
          }
        } on Exception catch (e) {
          hideLoading();
          print(e);
        }
      } else if (response['status'] == "success") {
        hideLoading();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => EnterPassword(number: _phoneNumber!)));
      }
    } catch (e) {
      showLoading();
    }
    return null;
  }

  Future<Null> verifyOtp(requestJson, context) async {
    showLoading();
    try {
      final response = await _apiProvider.auth(VERIFY_OTP, requestJson);
      if (response != null) {
        if (response['status'] == "success") {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EnterName(
                        number: _phoneNumber!,
                      )));
        } else {
          print(response);
          showMessage(response['message'] ?? response['data']['result']['Error'] ?? 'Error');
        }
      }
    } on Exception catch (e) {
      showMessage(e.toString());
    }
    hideLoading();
  }
}
