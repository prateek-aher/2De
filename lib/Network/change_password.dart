import 'dart:convert';

import 'package:delivery/Models/change_password_model.dart';
import 'package:delivery/Network/Api_Provider.dart';
import 'package:delivery/Utils/endpoints.dart';

class ChangePasswordService {
  static ApiProvider _apiProvider = ApiProvider();

  static Future<ChangePasswordModel?> change(dynamic requestJson) async {
    ChangePasswordModel? model;
    try {
      final response =
          await _apiProvider.post(CHANGE_PASSWORD, jsonEncode(requestJson));
      print(response);
      if (response != null) {
        print(response);
        model = ChangePasswordModel.fromJson(response);
      }
      return model;
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
