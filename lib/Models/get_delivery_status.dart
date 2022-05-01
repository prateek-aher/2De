// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:delivery/Models/FindTaskModel.dart';

class DeliveryStatusModel {
  DeliveryStatusModel({
    this.status,
    this.message,
    this.error,
    this.data,
  });

  String? status;
  dynamic message;
  dynamic error;
  Data? data;

  factory DeliveryStatusModel.fromJson(Map<String, dynamic> json) => DeliveryStatusModel(
        status: json["status"],
        message: json["message"],
        error: json["error"],
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  Data({
    this.result,
  });

  Result? result;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        result: Result.fromJson(json["result"]),
      );
}

class Result {
  Result({
    this.state,
    this.pickupAddress,
    this.dropAddress,
  });

  String? state;
  Address? pickupAddress;
  Address? dropAddress;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        state: json["state"],
        pickupAddress: Address.fromJson(json["pickup_address"]),
        dropAddress: Address.fromJson(json["drop_address"]),
      );
}
