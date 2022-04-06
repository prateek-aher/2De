// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'FindTaskModel.dart';

MyBagModel welcomeFromJson(String str) => MyBagModel.fromJson(json.decode(str));

String welcomeToJson(MyBagModel data) => json.encode(data.toJson());

class MyBagModel {
  MyBagModel({
    this.status = 'false',
    this.message,
    this.error,
    this.data,
  });

  String status;
  String? message;
  dynamic error;
  Data? data;

  factory MyBagModel.fromJson(Map<String, dynamic> json) => MyBagModel(
        status: json["status"],
        message: json["message"],
        error: json["error"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message == null ? '' : message,
        "error": error,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    this.count,
    this.result = const <BagItem>[],
  });

  int? count;
  List<BagItem> result;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        count: json["count"],
        result: json["result"] == null
            ? []
            : List<BagItem>.from(json["result"].map((x) => BagItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class BagItem {
  BagItem({
    this.deliveryId,
    this.projectId,
    this.paymentId,
    this.teamId,
    this.pickupAddress,
    this.dropAddress,
    this.productType,
    this.weight,
    this.pickupTime,
    this.dropTime,
    this.pickupImages = const <String>[],
    this.state,
    this.id,
    this.exData,
    this.exData1,
    this.dropDate,
    this.dropSlot,
  });

  int? deliveryId;
  int? projectId;
  int? paymentId;
  int? teamId;
  Address? pickupAddress;
  Address? dropAddress;
  String? productType;
  double? weight;
  DateTime? pickupTime;
  DateTime? dropTime;
  List<String> pickupImages;
  String? state;
  dynamic id;
  DateTime? exData;
  DateTime? exData1;
  String? dropDate;
  String? dropSlot;

  factory BagItem.fromJson(Map<String, dynamic> json) => BagItem(
        deliveryId: json["delivery_id"],
        projectId: json["project_id"],
        paymentId: json["payment_id"],
        teamId: json["team_id"],
        pickupAddress:
            json["pickup_address"] == null ? null : Address.fromJson(json["pickup_address"]),
        dropAddress: json["drop_address"] == null ? null : Address.fromJson(json["drop_address"]),
        productType: json["product_type"],
        weight: json["weight"],
        pickupTime: json["pickup_time"] == null ? null : DateTime.parse(json["pickup_time"]),
        dropTime: json["drop_time"] == null ? null : DateTime.parse(json["drop_time"]),
        pickupImages: json["pickup_images"] == null
            ? []
            : List<String>.from(json["pickup_images"].map((x) => x)),
        state: json["state"],
        id: json["id"],
        exData: json["exData"] == null ? null : DateTime.parse(json["exData"]),
        exData1: json["exData1"] == null ? null : DateTime.parse(json["exData1"]),
        dropDate: json["drop_date"],
        dropSlot: json["drop_slot"],
      );

  Map<String, dynamic> toJson() => {
        "delivery_id": deliveryId,
        "project_id": projectId,
        "payment_id": paymentId,
        "team_id": teamId,
        "pickup_address": pickupAddress?.toJson(),
        "drop_address": dropAddress?.toJson(),
        "product_type": productType,
        "weight": weight,
        "pickup_time": pickupTime?.toIso8601String(),
        "drop_time": dropTime?.toIso8601String(),
        "pickup_images": pickupImages == [] ? null : List<dynamic>.from(pickupImages.map((x) => x)),
        "state": state,
        "id": id,
        "exData": exData?.toIso8601String(),
        "exData1": exData1?.toIso8601String(),
        "drop_date": dropDate,
        "drop_slot": dropSlot,
      };
}
