import 'package:delivery/Models/FindTaskModel.dart';
import 'package:delivery/Utils/enumerations.dart';

class TaskDetailsModel {
  TaskDetailsModel({
    this.status,
    this.message,
    this.error,
    this.data,
  });

  String? status;
  String? message;
  dynamic error;
  Data? data;

  factory TaskDetailsModel.fromJson(Map<String, dynamic> json) => TaskDetailsModel(
        status: json["status"],
        message: json["message"],
        error: json["error"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  // Map<String, dynamic> toJson() => {
  //       "status": status,
  //       "message": message,
  //       "error": error,
  //       "data": data?.toJson(),
  //     };
}

class Data {
  Data({
    this.result,
  });

  Result? result;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
      );

  // Map<String, dynamic> toJson() => {
  //       "result": result?.toJson(),
  //     };
}

class Result {
  Result({
    this.task,
    this.schedules = const <Schedule>[],
  });

  Task? task;
  List<Schedule> schedules;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        task: json["task"] == null ? null : Task.fromJson(json["task"]),
        schedules: json["schedules"] == null
            ? <Schedule>[]
            : List<Schedule>.from(json["schedules"].map((x) => Schedule.fromJson(x))),
      );

  // Map<String, dynamic> toJson() => {
  //       "task": task?.toJson(),
  //       "schedules": List<dynamic>.from(schedules.map((x) => x.toJson())),
  //     };
}

class Schedule {
  Schedule({
    this.deliveryId,
    this.projectId,
    this.pickupAddress,
    this.dropAddress,
    this.productType = '',
    this.weight = 0,
    // this.pickupTime,
    // this.dropTime,
    this.hasLeftForPickup,
    // this.pickupLeftForTime,
    this.hasReachedPickup,
    // this.pickupReachedTime,
    this.hasLeftForDrop,
    // this.dropLeftForTime,
    this.hasReachedDrop,
    // this.dropReachedTime,
    this.state = '',
    this.projectDetails,
    // this.id,
  });

  int? deliveryId;
  int? projectId;
  PickupAddress? pickupAddress;
  DropAddress? dropAddress;
  String productType;
  double weight;
  // DateTime? pickupTime;
  // DateTime? dropTime;
  bool? hasLeftForPickup;
  // DateTime? pickupLeftForTime;
  bool? hasReachedPickup;
  // DateTime? pickupReachedTime;
  bool? hasLeftForDrop;
  // DateTime? dropLeftForTime;
  bool? hasReachedDrop;
  // DateTime? dropReachedTime;
  String state;
  ProjectDetails? projectDetails;
  // dynamic id;

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        deliveryId: json["delivery_id"] == null ? null : json["delivery_id"],
        projectId: json["project_id"] == null ? null : json["project_id"],
        pickupAddress:
            json["pickup_address"] == null ? null : PickupAddress.fromJson(json["pickup_address"]),
        dropAddress:
            json["drop_address"] == null ? null : DropAddress.fromJson(json["drop_address"]),
        productType: json["product_type"] == null ? '' : json["product_type"],
        weight: json["weight"] == null ? null : json["weight"].toDouble(),
        // pickupTime: json["pickup_time"] == null ? null : json["pickup_time"],
        // dropTime: json["drop_time"] == null ? null : json["drop_time"],
        hasLeftForPickup: json["has_left_for_pickup"] == null ? null : json["has_left_for_pickup"],
        // pickupLeftForTime:
        //     json["pickup_left_for_time"] == null ? null : json["pickup_left_for_time"],
        hasReachedPickup: json["has_reached_pickup"] == null ? null : json["has_reached_pickup"],
        // pickupReachedTime: json["pickup_reached_time"] == null ? null : json["pickup_reached_time"],
        hasLeftForDrop: json["has_left_for_drop"] == null ? null : json["has_left_for_drop"],
        // dropLeftForTime: json["drop_left_for_time"] == null ? null : json["drop_left_for_time"],
        hasReachedDrop: json["has_reached_drop"] == null ? null : json["has_reached_drop"],
        // dropReachedTime: json["drop_reached_time"] == null ? null : json["drop_reached_time"],
        state: json["state"] == null ? '' : json["state"],
        projectDetails: json["project_details"] == null
            ? null
            : ProjectDetails.fromJson(json["project_details"]),
        // id: json["id"],
      );

  // Map<String, dynamic> toJson() => {
  //       "delivery_id": deliveryId == null ? null : deliveryId,
  //       "project_id": projectId == null ? null : projectId,
  //       "pickup_address": pickupAddress == null ? null : pickupAddress.toJson(),
  //       "drop_address": dropAddress == null ? null : dropAddress.toJson(),
  //       "product_type": productType == null ? null : productType,
  //       "weight": weight == null ? null : weight,
  //       "pickup_time": pickupTime == null ? null : pickupTime,
  //       "drop_time": dropTime == null ? null : dropTime,
  //       "has_left_for_pickup": hasLeftForPickup == null ? null : hasLeftForPickup,
  //       "pickup_left_for_time": pickupLeftForTime == null ? null : pickupLeftForTime,
  //       "has_reached_pickup": hasReachedPickup == null ? null : hasReachedPickup,
  //       "pickup_reached_time": pickupReachedTime == null ? null : pickupReachedTime,
  //       "has_left_for_drop": hasLeftForDrop == null ? null : hasLeftForDrop,
  //       "drop_left_for_time": dropLeftForTime == null ? null : dropLeftForTime,
  //       "has_reached_drop": hasReachedDrop == null ? null : hasReachedDrop,
  //       "drop_reached_time": dropReachedTime == null ? null : dropReachedTime,
  //       "state": state == null ? null : state,
  //       "project_details": projectDetails == null ? null : projectDetails.toJson(),
  //       "id": id,
  //     };
}

class DropAddress {
  DropAddress({
    this.firstname = '',
    this.lastname = '',
    this.flatNo = '',
    this.street = '',
    this.area = '',
    this.city = '',
    this.landmark = '',
    this.country = '',
    this.pincode = '',
    this.phoneNo = '',
  });

  String firstname;
  String lastname;
  String flatNo;
  String street;
  String area;
  String city;
  String landmark;
  String country;
  String pincode;
  String phoneNo;

  factory DropAddress.fromJson(Map<String, dynamic> json) => DropAddress(
        firstname: json["firstname"] == null ? '' : json["firstname"],
        lastname: json["lastname"] == null ? '' : json["lastname"],
        flatNo: json["flat_no"] == null ? '' : json["flat_no"],
        street: json["street"] == null ? '' : json["street"],
        area: json["area"] == null ? '' : json["area"],
        city: json["city"] == null ? '' : json["city"],
        landmark: json["landmark"] == null ? '' : json["landmark"],
        country: json["country"] == null ? '' : json["country"],
        pincode: json["pincode"] == null ? '' : json["pincode"].toString(),
        phoneNo: json["phone_no"] == null ? '' : json["phone_no"],
      );

  // Map<String, dynamic> toJson() => {
  //       "firstname": firstname == null ? null : firstname,
  //       "lastname": lastname == null ? null : lastname,
  //       "flat_no": flatNo == null ? null : flatNo,
  //       "street": street == null ? null : street,
  //       "area": area == null ? null : area,
  //       "city": city == null ? null : city,
  //       "landmark": landmark == null ? null : landmark,
  //       "country": country == null ? null : country,
  //       "pincode": pincode == null ? null : pincode,
  //       "phone_no": phoneNo == null ? null : phoneNo,
  //     };
}

class PickupAddress {
  PickupAddress({
    this.flatNo = '',
    this.street = '',
    this.landmark = '',
    this.area = '',
    this.city = '',
    this.state = '',
    this.country = '',
    // TODO: pincode sometimes is of type string and sometimes int. See if Ravi sir has fixed this
    this.pincode = '',
    this.latitude,
    this.longitude,
    this.businessName = '',
    this.firstname = '',
    this.lastname = '',
    this.phoneNo = '',
  });

  String flatNo;
  String street;
  String landmark;
  String area;
  String city;
  String state;
  String country;
  String pincode;
  double? latitude;
  double? longitude;
  String businessName;
  String firstname;
  String lastname;
  String phoneNo;

  factory PickupAddress.fromJson(Map<String, dynamic> json) => PickupAddress(
        flatNo: json["flat_no"] == null ? '' : json["flat_no"],
        street: json["street"] == null ? '' : json["street"],
        landmark: json["landmark"] == null ? '' : json["landmark"],
        area: json["area"] == null ? '' : json["area"],
        city: json["city"] == null ? '' : json["city"],
        state: json["state"] == null ? '' : json["state"],
        country: json["country"] == null ? '' : json["country"],
        pincode: json["pincode"] == null ? '' : json["pincode"].toString(),
        latitude: json["latitude"] == null ? null : json["latitude"].toDouble(),
        longitude: json["longitude"] == null ? null : json["longitude"].toDouble(),
        businessName: json["business_name"] == null ? '' : json["business_name"],
        firstname: json["firstname"] == null ? '' : json["firstname"],
        lastname: json["lastname"] == null ? '' : json["lastname"],
        phoneNo: json["phone_no"] == null ? '' : json["phone_no"],
      );

  // Map<String, dynamic> toJson() => {
  //       "flat_no": flatNo == null ? null : flatNo,
  //       "street": street == null ? null : street,
  //       "landmark": landmark == null ? null : landmark,
  //       "area": area == null ? null : area,
  //       "city": city == null ? null : city,
  //       "state": state == null ? null : state,
  //       "country": country == null ? null : country,
  //       "pincode": pincode == null ? null : pincode,
  //       "latitude": latitude == null ? null : latitude,
  //       "longitude": longitude == null ? null : longitude,
  //       "business_name": businessName == null ? null : businessName,
  //       "firstname": firstname == null ? null : firstname,
  //       "lastname": lastname == null ? null : lastname,
  //       "phone_no": phoneNo == null ? null : phoneNo,
  //     };
}

class ProjectDetails {
  ProjectDetails({
    this.projectId,
    this.name = '',
    this.quantity,
    this.weight = 0,
    this.address,
    this.firstname = '',
    this.lastname = '',
    this.phoneNo = '',
    this.id = '',
    this.totals,
    this.projectDetailsId = '',
  });

  int? projectId;
  String name;
  int? quantity;
  double weight;
  Address? address;
  String firstname;
  String lastname;
  String phoneNo;
  String id;
  Totals? totals;
  String projectDetailsId;

  factory ProjectDetails.fromJson(Map<String, dynamic> json) => ProjectDetails(
        projectId: json["project_id"] == null ? null : json["project_id"],
        name: json["name"] == null ? null : json["name"],
        quantity: json["quantity"] == null ? null : json["quantity"],
        weight: json["weight"] == null ? null : json["weight"].toDouble(),
        address: json["address"] == null ? null : Address.fromJson(json["address"]),
        firstname: json["firstname"] == null ? null : json["firstname"],
        lastname: json["lastname"] == null ? null : json["lastname"],
        phoneNo: json["phone_no"] == null ? null : json["phone_no"],
        id: json["_id"] == null ? null : json["_id"],
        totals: json["totals"] == null ? null : Totals.fromJson(json["totals"]),
        projectDetailsId: json["id"] == null ? '' : json["id"],
      );

  // Map<String, dynamic> toJson() => {
  //       "project_id": projectId == null ? null : projectId,
  //       "name": name == null ? null : name,
  //       "quantity": quantity == null ? null : quantity,
  //       "weight": weight == null ? null : weight,
  //       "address": address?.toJson(),
  //       "firstname": firstname == null ? null : firstname,
  //       "lastname": lastname == null ? null : lastname,
  //       "phone_no": phoneNo == null ? null : phoneNo,
  //       "_id": id == null ? null : id,
  //       "totals": totals?.toJson(),
  //       "id": projectDetailsId == null ? null : projectDetailsId,
  //     };
}

class Address {
  Address({
    this.flatNo = '',
    this.street = '',
    this.area = '',
    this.city = '',
    this.state = '',
    this.country = '',
    this.latitude,
    this.longitude,
    this.pincode = '',
    this.location = '',
    this.landmark = '',
  });

  String flatNo;
  String street;
  String area;
  String city;
  String state;
  String country;
  double? latitude;
  double? longitude;
  String pincode;
  String? location;
  String landmark;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        flatNo: json["flat_no"] == null ? '' : json["flat_no"],
        street: json["street"] == null ? '' : json["street"],
        area: json["area"] == null ? '' : json["area"],
        city: json["city"] == null ? '' : json["city"],
        state: json["state"] == null ? '' : json["state"],
        country: json["country"] == null ? '' : json["country"],
        latitude: json["latitude"] == null ? null : json["latitude"].toDouble(),
        longitude: json["longitude"] == null ? null : json["longitude"].toDouble(),
        pincode: json["pincode"] == null ? '' : json["pincode"].toString(),
        location: json["location"] == null ? '' : json["location"],
        landmark: json["landmark"] == null ? '' : json["landmark"],
      );

  // Map<String, dynamic> toJson() => {
  //       "flat_no": flatNo == null ? null : flatNo,
  //       "street": street == null ? null : street,
  //       "area": area == null ? null : area,
  //       "city": city == null ? null : city,
  //       "state": state == null ? null : state,
  //       "country": country == null ? null : country,
  //       "latitude": latitude == null ? null : latitude,
  //       "longitude": longitude == null ? null : longitude,
  //       "pincode": pincode == null ? null : pincode,
  //       "location": location == null ? null : location,
  //       "landmark": landmark == null ? null : landmark,
  //     };
}

class Totals {
  Totals({
    this.product = 0,
    this.shipping = 0,
    this.discount = 0,
    this.tax = 0,
  });

  int product;
  int shipping;
  int discount;
  int tax;

  factory Totals.fromJson(Map<String, dynamic> json) => Totals(
        product: json["product"] == null ? 0 : json["product"],
        shipping: json["shipping"] == null ? 0 : json["shipping"],
        discount: json["discount"] == null ? 0 : json["discount"],
        tax: json["tax"] == null ? 0 : json["tax"],
      );

  Map<String, dynamic> toJson() => {
        "product": product,
        "shipping": shipping,
        "discount": discount,
        "tax": tax,
      };
}

class Task {
  Task({
    this.taskId,
    this.teamId,
    this.taskType = TaskType.none,
    this.schedules = const <int>[],
    this.creatorName = '',
    this.customerName = '',
    this.customerPhone = '',
    this.status = '',
    this.creatorPhone = '',
    this.team,
    // this.id,
  });

  int? taskId;
  int? teamId;
  TaskType taskType;
  List<int> schedules;
  String creatorName;
  String customerName;
  String customerPhone;
  String status;
  String creatorPhone;
  Team? team;
  // dynamic id;

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        taskId: json["task_id"],
        teamId: json["team_id"],
        taskType: jsonToTaskType(json["task_type"]),
        schedules:
            json["schedules"] == null ? <int>[] : List<int>.from(json["schedules"].map((x) => x)),
        creatorName: json["creator_name"],
        customerName: json["customer_name"],
        customerPhone: json["customer_phone"],
        status: json["status"],
        creatorPhone: json["creator_phone"],
        team: json["team"] == null ? null : Team.fromJson(json["team"]),
        // id: json["id"],
      );

  // Map<String, dynamic> toJson() => {
  //       "task_id": taskId,
  //       "team_id": teamId,
  //       "task_type": taskTypeToJson(taskType),
  //       "schedules": List<dynamic>.from(schedules.map((x) => x)),
  //       "creator_name": creatorName,
  //       "customer_name": customerName,
  //       "customer_phone": customerPhone,
  //       "status": status,
  //       "creator_phone": creatorPhone,
  //       "team": team?.toJson(),
  //       "id": id,
  //     };
}

class Team {
  Team({
    this.teamId,
    this.name = '',
    this.type = '',
    // this.id,
    // this.teamId,
  });

  int? teamId;
  String name;
  String type;
  // String id;
  // String teamId;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        teamId: json["team_id"],
        name: json["name"] == null ? '' : json["name"],
        type: json["type"] == null ? '' : json["type"],
        // id: json["_id"] == null ? null : json["_id"],
        // teamId: json["id"] == null ? null : json["id"],
      );

  // Map<String, dynamic> toJson() => {
  //       "team_id": teamId,
  //       "name": name,
  //       "type": type,
  //       // "_id": id == null ? null : id,
  //       // "id": teamId == null ? null : teamId,
  //     };
}
