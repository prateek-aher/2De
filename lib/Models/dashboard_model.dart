// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

DashboardModel welcomeFromJson(String str) => DashboardModel.fromJson(json.decode(str));

String welcomeToJson(DashboardModel data) => json.encode(data.toJson());

class DashboardModel {
  DashboardModel({
    this.status,
    this.message,
    this.error,
    this.data,
  });

  String? status;
  String? message;
  dynamic error;
  Data? data;

  factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        error: json["error"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
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
    this.teamInfo,
    this.taskInfo,
  });

  TeamInfo? teamInfo;
  TaskInfo? taskInfo;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        teamInfo: json["teaminfo"] == null ? null : TeamInfo.fromJson(json["teaminfo"]),
        taskInfo: json["taskinfo"] == null ? null : TaskInfo.fromJson(json["taskinfo"]),
      );

  Map<String, dynamic> toJson() => {
        "teaminfo": teamInfo?.toJson(),
        "taskinfo": taskInfo?.toJson(),
      };
}

class TaskInfo {
  TaskInfo({
    this.pickups = 0,
    this.drops = 0,
  });

  int pickups;
  int drops;

  factory TaskInfo.fromJson(Map<String, dynamic> json) => TaskInfo(
        pickups: json["pickups"] == null ? null : json["pickups"],
        drops: json["drops"] == null ? null : json["drops"],
      );

  Map<String, dynamic> toJson() => {
        "pickups": pickups,
        "drops": drops,
      };
}

class TeamInfo {
  TeamInfo({
    this.bikeActive = 0,
    this.bikeInactive = 0,
    this.carActive = 0,
    this.carInactive = 0,
  });

  int bikeActive;
  int bikeInactive;
  int carActive;
  int carInactive;

  factory TeamInfo.fromJson(Map<String, dynamic> json) => TeamInfo(
        bikeActive: json["bikeactive"] == null ? null : json["bikeactive"],
        bikeInactive: json["bikeinactive"] == null ? null : json["bikeinactive"],
        carActive: json["caractive"] == null ? null : json["caractive"],
        carInactive: json["carinactive"] == null ? null : json["carinactive"],
      );

  Map<String, dynamic> toJson() => {
        "bikeactive": bikeActive,
        "bikeinactive": bikeInactive,
        "caractive": carActive,
        "carinactive": carInactive,
      };
}
