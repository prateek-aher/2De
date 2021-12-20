// To parse this JSON data, do
//
//     final findTaskModel = findTaskModelFromJson(jsonString);

import 'dart:convert';

FindTaskModel findTaskModelFromJson(String str) =>
    FindTaskModel.fromJson(json.decode(str));

String findTaskModelToJson(FindTaskModel data) => json.encode(data.toJson());

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
        data: Data.fromJson(json["data"]),
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
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result?.toJson(),
      };
}

class Result {
  Result({
    this.task,
    this.packages,
  });

  Task? task;
  List<Package>? packages;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        task: Task.fromJson(json["task"]),
        packages: List<Package>.from(
            json["packages"].map((x) => Package.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "task": task?.toJson(),
        "packages": List<dynamic>.from(packages!.map((x) => x.toJson())),
      };
}

class Package {
  Package({
    this.deliveryId,
    this.orderId,
    this.type,
    this.weight,
    this.state,
    this.isCod,
    this.codAmount,
  });

  int? deliveryId;
  int? orderId;
  String? type;
  double? weight;
  String? state;
  bool? isCod;
  int? codAmount;

  factory Package.fromJson(Map<String, dynamic> json) => Package(
        deliveryId: json["delivery_id"],
        orderId: json["order_id"],
        type: json["type"],
        weight: json["weight"].toDouble(),
        state: json["state"],
        isCod: json["is_cod"],
        codAmount: json["cod_amount"],
      );

  Map<String, dynamic> toJson() => {
        "delivery_id": deliveryId,
        "order_id": orderId,
        "type": type,
        "weight": weight,
        "state": state,
        "is_cod": isCod,
        "cod_amount": codAmount,
      };
}

class Task {
  Task({
    this.taskId,
    this.taskType,
    this.schedules,
    this.latitude,
    this.longitude,
    this.pincode,
    this.id,
    this.address,
  });

  int? taskId;
  String? taskType;
  List<int>? schedules;
  double? latitude;
  double? longitude;
  String? pincode;
  dynamic id;
  Address? address;

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        taskId: json["task_id"],
        taskType: json["task_type"],
        schedules: List<int>.from(json["schedules"].map((x) => x)),
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        pincode: json["pincode"],
        id: json["id"],
        address: Address.fromJson(json["address"]),
      );

  Map<String, dynamic> toJson() => {
        "task_id": taskId,
        "task_type": taskType,
        "schedules": List<dynamic>.from(schedules!.map((x) => x)),
        "latitude": latitude,
        "longitude": longitude,
        "pincode": pincode,
        "id": id,
        "address": address?.toJson(),
      };
}

class Address {
  Address({
    this.area,
    this.city,
    this.country,
    this.pincode,
    this.latitude,
    this.longitude,
    this.landmark,
    this.flatNo,
    this.businessName,
    this.firstname,
    this.lastname,
    this.phoneNo,
    this.street,
  });

  String? area;
  String? city;
  String? country;
  int? pincode;
  double? latitude;
  double? longitude;
  String? landmark;
  String? flatNo;
  String? businessName;
  String? firstname;
  String? lastname;
  String? phoneNo;
  String? street;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        area: json["area"],
        city: json["city"],
        country: json["country"],
        pincode: json["pincode"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        landmark: json["landmark"],
        flatNo: json["flat_no"],
        businessName: json["business_name"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        phoneNo: json["phone_no"],
        street: json["street"],
      );

  Map<String, dynamic> toJson() => {
        "area": area,
        "city": city,
        "country": country,
        "pincode": pincode,
        "latitude": latitude,
        "longitude": longitude,
        "landmark": landmark,
        "flat_no": flatNo,
        "business_name": businessName,
        "firstname": firstname,
        "lastname": lastname,
        "phone_no": phoneNo,
        "street": street,
      };
}
