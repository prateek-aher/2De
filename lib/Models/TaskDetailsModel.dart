import 'package:delivery/Models/FindTaskModel.dart';
import 'package:delivery/Utils/enumerations.dart';
import 'package:intl/intl.dart';

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
}

class Schedule {
  Schedule({
    this.deliveryId,
    this.projectId,
    this.pickupAddress,
    this.dropAddress,
    this.productType = '',
    this.weight = 0.0,
    // this.pickupTime,
    // this.dropTime,
    // this.hasLeftForPickup,
    // this.pickupLeftForTime,
    // this.hasReachedPickup,
    // this.pickupReachedTime,
    // this.hasLeftForDrop,
    // this.dropLeftForTime,
    // this.hasReachedDrop,
    // this.dropReachedTime,
    this.state = '',
    this.projectDetails,
  });

  int? deliveryId;
  int? projectId;
  PickupAddress? pickupAddress;
  DropAddress? dropAddress;
  String? productType;
  double? weight;
  // DateTime? pickupTime;
  // DateTime? dropTime;
  // bool? hasLeftForPickup;
  // DateTime? pickupLeftForTime;
  // bool? hasReachedPickup;
  // DateTime? pickupReachedTime;
  // bool? hasLeftForDrop;
  // DateTime? dropLeftForTime;
  // bool? hasReachedDrop;
  // DateTime? dropReachedTime;
  String state;
  ProjectDetails? projectDetails;

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        deliveryId: json["delivery_id"],
        projectId: json["project_id"],
        pickupAddress:
            json["pickup_address"] == null ? null : PickupAddress.fromJson(json["pickup_address"]),
        dropAddress:
            json["drop_address"] == null ? null : DropAddress.fromJson(json["drop_address"]),
        productType: json["product_type"] == null ? '' : json["product_type"],
        weight: json["weight"] == null ? null : json["weight"].toDouble(),
        // pickupTime: DateFormat.Hm().parse(json['pickup_time']),
        // dropTime: DateFormat.Hm().parse(json["drop_time"]),
        // hasLeftForPickup: json["has_left_for_pickup"] == null ? null : json["has_left_for_pickup"],
        // pickupLeftForTime: DateFormat.Hm().parse(json["pickup_left_for_time"]),
        // hasReachedPickup: json["has_reached_pickup"] == null ? null : json["has_reached_pickup"],
        // pickupReachedTime: DateFormat.Hm().parse(json["pickup_reached_time"]),
        // hasLeftForDrop: json["has_left_for_drop"] == null ? null : json["has_left_for_drop"],
        // dropLeftForTime: DateFormat.Hm().parse(json["drop_left_for_time"]),
        // hasReachedDrop: json["has_reached_drop"] == null ? null : json["has_reached_drop"],
        // dropReachedTime: DateFormat.Hm().parse(json["drop_reached_time"]),
        state: json["state"] == null ? '' : json["state"],
        projectDetails: json["project_details"] == null
            ? null
            : ProjectDetails.fromJson(json["project_details"]),
      );
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

  String? flatNo;
  String? street;
  String? landmark;
  String? area;
  String? city;
  String? state;
  String? country;
  String? pincode;
  double? latitude;
  double? longitude;
  String? businessName;
  String? firstname;
  String? lastname;
  String? phoneNo;

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
  });

  int? taskId;
  int? teamId;
  TaskType taskType;
  List<int> schedules;
  String? creatorName;
  String? customerName;
  String? customerPhone;
  String? status;
  String? creatorPhone;
  Team? team;

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
      );
}

class Team {
  Team({
    this.teamId,
    this.name = '',
    this.type = '',
  });

  int? teamId;
  String name;
  String type;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        teamId: json["team_id"],
        name: json["name"] == null ? '' : json["name"],
        type: json["type"] == null ? '' : json["type"],
      );
}
