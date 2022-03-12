// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

ParcelPickupModel welcomeFromJson(String str) =>
    ParcelPickupModel.fromJson(json.decode(str));

String welcomeToJson(ParcelPickupModel data) => json.encode(data.toJson());

class ParcelPickupModel {
  ParcelPickupModel({
    this.status,
    this.message,
    this.error,
    this.data,
  });

  String? status;
  String? message;
  dynamic error;
  Data? data;

  factory ParcelPickupModel.fromJson(Map<String, dynamic> json) =>
      ParcelPickupModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        error: json["error"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "error": error,
        "data": data?.toJson(),
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
        "result": result?.toJson(),
      };
}

class Result {
  Result({
    this.message = '',
  });

  String message;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        message: json["Message"] == null ? null : json["Message"],
      );

  Map<String, dynamic> toJson() => {
        "Message": message,
      };
}
