// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

UpdateDeliveryStatusModel welcomeFromJson(String str) =>
    UpdateDeliveryStatusModel.fromJson(json.decode(str));

String welcomeToJson(UpdateDeliveryStatusModel data) =>
    json.encode(data.toJson());

class UpdateDeliveryStatusModel {
  UpdateDeliveryStatusModel({
    this.status,
    this.message,
    this.error,
    this.data,
  });

  String? status;
  String? message;
  dynamic error;
  Data? data;

  factory UpdateDeliveryStatusModel.fromJson(Map<String, dynamic> json) =>
      UpdateDeliveryStatusModel(
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
    this.pickupTime,
    this.message,
    this.minutes,
    this.seconds,
    this.totalSecondsLeft,
  });

  DateTime? pickupTime;
  String? message;
  int? minutes;
  int? seconds;
  int? totalSecondsLeft;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        pickupTime: json["pickup_time"] == null
            ? null
            : DateTime.parse(json["pickup_time"]),
        message: json["Message"] == null ? null : json["Message"],
        minutes: json["minutes"] == null ? null : json["minutes"],
        seconds: json["seconds"] == null ? null : json["seconds"],
        totalSecondsLeft:
            json["totalSecondsLeft"] == null ? null : json["totalSecondsLeft"],
      );

  Map<String, dynamic> toJson() => {
        "pickup_time": pickupTime?.toIso8601String(),
        "Message": message == null ? null : message,
        "minutes": minutes == null ? null : minutes,
        "seconds": seconds == null ? null : seconds,
        "totalSecondsLeft": totalSecondsLeft == null ? null : totalSecondsLeft,
      };
}
