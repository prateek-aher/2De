import 'package:delivery/Exceptions/Custom_Excaption.dart';
import 'package:delivery/Utils/constants/endpoints.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class ApiProvider {
  String? _baseUrl = BASE_URL;

  //future get
  Future<dynamic> get(String url) async {
    var responseJson;
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? token = _prefs.getString('token');
    try {
      print(token);
      //showLoading();
      final response = await http.get(Uri.parse(_baseUrl! + url), headers: {
        "Authorization": token!,
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      });
      responseJson = _response(response);
      print(_baseUrl! + url);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  //future post
  Future<dynamic> post(String url, requestJson) async {
    var responseJson;
    print(requestJson);
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? token = _prefs.getString('token');
    try {
      final response = await http
          .post(Uri.parse(_baseUrl! + url), body: requestJson, headers: {
        "Authorization": token!,
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      });

      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> auth(String url, requestJson) async {
    var responseJson;
    print(requestJson);
    try {
      final response = await http.post(Uri.parse(_baseUrl! + url),
          body: requestJson,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          });

      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  //future put
  Future<dynamic> put(String url, requestJson) async {
    var responseJson;
    //String token = await getToken();
    print(_baseUrl! + url);
    try {
      final response = await http
          .put(Uri.parse(_baseUrl! + url), body: requestJson, headers: {
        //"Authorization": token,
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      });

      responseJson = _response(response);
    } on SocketException {
      //Get.defaultDialog(title: 'No Internet connection',middleText: 'I guess your Internet is not availble!');
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    //BuildContext context;
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(utf8.decode(response.bodyBytes));
        // print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:

      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:

      case 500:

      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
