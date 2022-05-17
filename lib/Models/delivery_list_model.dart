class DeliveryListModel {
  DeliveryListModel({
    this.status,
    this.message,
    this.error,
    this.data,
  });

  String? status;
  String? message;
  dynamic error;
  Data? data;

  factory DeliveryListModel.fromJson(Map<String, dynamic> json) => DeliveryListModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        error: json["error"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );
}

class Data {
  Data({
    this.count = 0,
    this.result = const <Delivery>[],
  });

  int? count;
  List<Delivery>? result;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        count: json["count"] == null ? 0 : json["count"],
        result: json["result"] == null
            ? <Delivery>[]
            : List<Delivery>.from(json["result"].map((x) => Delivery.fromJson(x))),
      );
}

class Delivery {
  Delivery({
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
    this.state,
    // this.id,
    this.exData,
    this.exData1,
    this.dropDate,
    this.dropSlot,
  });

  int? deliveryId;
  int? projectId;
  int? paymentId;
  int? teamId;
  PickupAddress? pickupAddress;
  DropAddress? dropAddress;
  String? productType;
  double? weight;
  DateTime? pickupTime;
  DateTime? dropTime;
  String? state;
  // dynamic id;
  DateTime? exData;
  DateTime? exData1;
  String? dropDate;
  String? dropSlot;

  factory Delivery.fromJson(Map<String, dynamic> json) => Delivery(
        deliveryId: json["delivery_id"] == null ? null : json["delivery_id"],
        projectId: json["project_id"] == null ? null : json["project_id"],
        paymentId: json["payment_id"] == null ? null : json["payment_id"],
        teamId: json["team_id"] == null ? null : json["team_id"],
        pickupAddress:
            json["pickup_address"] == null ? null : PickupAddress.fromJson(json["pickup_address"]),
        dropAddress:
            json["drop_address"] == null ? null : DropAddress.fromJson(json["drop_address"]),
        productType: json["product_type"] == null ? null : json["product_type"],
        weight: json["weight"] == null ? null : json["weight"].toDouble(),
        pickupTime: json["pickup_time"] == null ? null : DateTime.parse(json["pickup_time"]),
        dropTime: json["drop_time"] == null ? null : DateTime.parse(json["drop_time"]),
        state: json["state"],
        // id: json["id"],
        exData: json["exData"] == null ? null : DateTime.parse(json["exData"]),
        exData1: json["exData1"] == null ? null : DateTime.parse(json["exData1"]),
        dropDate: json["drop_date"] == null ? null : json["drop_date"],
        dropSlot: json["drop_slot"] == null ? null : json["drop_slot"],
      );
}

class DropAddress {
  DropAddress({
    this.firstname,
    this.lastname,
    this.flatNo,
    this.street,
    this.area,
    this.city,
    this.landmark,
    this.country,
    this.pincode,
    this.phoneNo,
  });

  String? firstname;
  String? lastname;
  String? flatNo;
  String? street;
  String? area;
  String? city;
  String? landmark;
  String? country;
  int? pincode;
  String? phoneNo;

  factory DropAddress.fromJson(Map<String, dynamic> json) => DropAddress(
        firstname: json["firstname"] == null ? null : json["firstname"],
        lastname: json["lastname"] == null ? null : json["lastname"],
        flatNo: json["flat_no"] == null ? null : json["flat_no"],
        street: json["street"] == null ? null : json["street"],
        area: json["area"] == null ? null : json["area"],
        city: json["city"],
        landmark: json["landmark"] == null ? null : json["landmark"],
        country: json["country"],
        pincode: json["pincode"] == null ? null : json["pincode"],
        phoneNo: json["phone_no"] == null ? null : json["phone_no"],
      );
}

class PickupAddress {
  PickupAddress({
    this.area,
    this.city,
    this.state,
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
    this.serviceArea,
  });

  String? area;
  String? city;
  String? state;
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
  String? serviceArea;

  factory PickupAddress.fromJson(Map<String, dynamic> json) => PickupAddress(
        area: json["area"] == null ? null : json["area"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        pincode: json["pincode"] == null ? null : json["pincode"],
        latitude: json["latitude"] == null ? null : json["latitude"].toDouble(),
        longitude: json["longitude"] == null ? null : json["longitude"].toDouble(),
        landmark: json["landmark"] == null ? null : json["landmark"],
        flatNo: json["flat_no"] == null ? null : json["flat_no"],
        businessName: json["business_name"] == null ? null : json["business_name"],
        firstname: json["firstname"] == null ? null : json["firstname"],
        lastname: json["lastname"] == null ? null : json["lastname"],
        phoneNo: json["phone_no"] == null ? null : json["phone_no"],
        street: json["street"] == null ? null : json["street"],
        serviceArea: json["service_area"] == null ? null : json["service_area"],
      );
}
