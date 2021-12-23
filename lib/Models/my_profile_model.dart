// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

MyProfileModel welcomeFromJson(String str) =>
    MyProfileModel.fromJson(json.decode(str));

String welcomeToJson(MyProfileModel data) => json.encode(data.toJson());

class MyProfileModel {
  MyProfileModel({
    this.status,
    this.message,
    this.error,
    this.data,
  });

  String? status;
  dynamic message;
  dynamic error;
  Data? data;

  factory MyProfileModel.fromJson(Map<String, dynamic> json) => MyProfileModel(
        status: json["status"],
        message: json["message"],
        error: json["error"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message,
        "error": error,
        "data": data == null ? null : data!.toJson(),
      };
}

class Data {
  Data({
    this.result,
  });

  Result? result;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result == null ? null : result!.toJson(),
      };
}

class Result {
  Result({
    this.name,
    this.email,
    this.onboardDate,
    this.phoneNo,
  });

  String? name;
  String? email;
  String? onboardDate;
  String? phoneNo;
  String? alternatePhoneNo;
  String? address;
  String? relativePhoneNo;
  String? relationship;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        onboardDate: json["onboard_date"] == null ? null : json["onboard_date"],
        phoneNo: json["phone_no"] == null ? null : json["phone_no"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "onboard_date": onboardDate == null ? null : onboardDate,
        "phone_no": phoneNo == null ? null : phoneNo,
      };
}
