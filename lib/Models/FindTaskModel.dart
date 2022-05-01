// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:io';

import 'package:delivery/Utils/enumerations.dart';

class FindTaskModel {
  FindTaskModel({
    this.status,
    this.message,
    this.error,
    this.data,
  });

  String? status;
  String? message;
  dynamic error;
  Data? data;

  factory FindTaskModel.fromJson(Map<String, dynamic> json) => FindTaskModel(
        status: json["status"],
        message: json["message"],
        error: json["error"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );
}

class Data {
  Data({
    this.result,
  });

  Result? result;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
      );
}

class Result {
  Result({
    this.task,
    this.packages = const <Package>[],
  });

  Task? task;
  List<Package> packages;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        task: json["task"] == null ? null : Task.fromJson(json["task"]),
        packages: json["packages"] == null
            ? []
            : List<Package>.from(json["packages"].map((x) => Package.fromJson(x))),
      );
}

class Package {
  Package({
    this.deliveryId,
    this.orderId,
    this.type,
    this.weight = 0.0,
    this.state,
    this.isCod,
    this.codAmount,
    this.barCode = '',

    // for frontend use
    this.file,
  });

  int? deliveryId;
  int? orderId;
  String? type;
  double? weight;
  String? state;
  bool? isCod;
  int? codAmount;
  String? barCode;

  //for frontend use
  File? file;

  factory Package.fromJson(Map<String, dynamic> json) => Package(
        deliveryId: json["delivery_id"],
        orderId: json["order_id"],
        type: json["type"],
        weight: json["weight"]?.toDouble(),
        state: json["state"],
        isCod: json["is_cod"],
        codAmount: json["cod_amount"],
        barCode: json["barcode"],
      );
}

class Task {
  Task({
    this.taskId,
    this.taskType = TaskType.none,
    this.schedules = const <int>[],
    this.latitude,
    this.longitude,
    this.pincode,
    // this.id,
    this.address,
    this.status,
    this.dis,
  });

  int? taskId;
  TaskType taskType;
  List<int> schedules;
  double? latitude;
  double? longitude;
  String? pincode;
  // dynamic id;
  Address? address;
  String? status;
  double? dis;

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        taskId: json["task_id"],
        taskType: jsonToTaskType(json["task_type"]),
        schedules:
            json["schedules"] == null ? <int>[] : List<int>.from(json["schedules"].map((x) => x)),
        latitude: json["latitude"] == null ? null : json["latitude"].toDouble(),
        longitude: json["longitude"] == null ? null : json["longitude"].toDouble(),
        pincode: json["pincode"] == null ? null : json["pincode"],
        // id: json["id"],
        address: json["address"] == null ? null : Address.fromJson(json["address"]),
        status: json["status"],
        dis: json["dis"] == null ? null : json["dis"].toDouble(),
      );
}

TaskType jsonToTaskType(json) {
  switch (json) {
    case 'pickup':
      return TaskType.pickup;
    case 'drop':
      return TaskType.drop;
    case 'hub_drop':
      return TaskType.hubDrop;
    case 'hub_pickup':
      return TaskType.hubPickup;
    default:
      return TaskType.none;
  }
}

String? taskTypeToJson(TaskType type) {
  switch (type) {
    case TaskType.none:
      return null;
    case TaskType.pickup:
      return 'pickup';
    case TaskType.drop:
      return 'drop';
    case TaskType.hubPickup:
      return 'hub_pickup';
    case TaskType.hubDrop:
      return 'hub_drop';
  }
}

class Address {
  Address({
    this.street,
    this.flatNumber,
    this.area,
    this.city,
    this.state,
    this.country,
    this.businessName,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.landmark,
    this.pincode,
  });

  String? street;
  String? flatNumber;
  String? area;
  String? city;
  String? state;
  String? country;
  String? businessName;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? landmark;
  int? pincode;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"],
        flatNumber: json["flat_no"],
        area: json["area"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        businessName: json["business_name"],
        firstName: json["firstname"],
        lastName: json["lastname"],
        phoneNumber: json["phone_no"],
        landmark: json["landmark"],
        pincode: json["pincode"],
      );
}
