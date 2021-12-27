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
    this.deliveryId,
    this.pickupAddress,
    this.dropAddress,
  });

  int? deliveryId;
  Address? pickupAddress;
  Address? dropAddress;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        deliveryId: json["delivery_id"],
        pickupAddress: Address.fromJson(json["pickup_address"]),
        dropAddress: Address.fromJson(json["drop_address"]),
      );

  Map<String, dynamic> toJson() => {
        "delivery_id": deliveryId,
        "pickup_address": pickupAddress?.toJson(),
        "drop_address": dropAddress?.toJson(),
      };
}

class Address {
  Address({
    this.firstname,
    this.lastname,
    this.street,
    this.area,
    this.city,
    this.landmark,
    this.country,
    this.pinCode,
    this.phoneNo,
    this.state,
    this.businessName,
  });

  String? firstname;
  String? lastname;
  String? street;
  String? area;
  String? city;
  String? landmark;
  String? country;
  int? pinCode;
  String? phoneNo;
  String? state;
  String? businessName;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        firstname: json["firstname"],
        lastname: json["lastname"],
        street: json["street"],
        area: json["area"],
        city: json["city"],
        landmark: json["landmark"],
        country: json["country"],
        pinCode: json["pincode"],
        phoneNo: json["phone_no"],
        state: json["state"] == null ? null : json["state"],
        businessName:
            json["business_name"] == null ? null : json["business_name"],
      );

  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
        "street": street,
        "area": area,
        "city": city,
        "landmark": landmark,
        "country": country,
        "pincode": pinCode,
        "phone_no": phoneNo,
        "state": state == null ? null : state,
        "business_name": businessName == null ? null : businessName,
      };
}
