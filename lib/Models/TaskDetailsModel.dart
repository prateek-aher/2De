import 'FindTaskModel.dart';

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
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result?.toJson(),
      };
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

  Map<String, dynamic> toJson() => {
        "task": task?.toJson(),
        "schedules": List<dynamic>.from(schedules.map((x) => x.toJson())),
      };
}

class Schedule {
  Schedule({
    this.deliveryId,
    this.projectId,
    this.pickupAddress,
    this.dropAddress,
    this.productType,
    this.weight,
    this.pickupTime,
    this.dropTime,
    this.state,
    this.id,
  });

  int? deliveryId;
  int? projectId;
  Address? pickupAddress;
  Address? dropAddress;
  String? productType;
  double? weight;
  DateTime? pickupTime;
  DateTime? dropTime;
  String? state;
  dynamic id;

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        deliveryId: json["delivery_id"] == null ? null : json["delivery_id"],
        projectId: json["project_id"] == null ? null : json["project_id"],
        pickupAddress:
            json["pickup_address"] == null ? null : Address.fromJson(json["pickup_address"]),
        dropAddress: json["drop_address"] == null ? null : Address.fromJson(json["drop_address"]),
        productType: json["product_type"] == null ? null : json["product_type"],
        weight: json["weight"] == null ? null : json["weight"].toDouble(),
        pickupTime: json["pickup_time"] == null ? null : DateTime.parse(json["pickup_time"]),
        dropTime: json["drop_time"] == null ? null : DateTime.parse(json["drop_time"]),
        state: json["state"] == null ? null : json["state"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "delivery_id": deliveryId == null ? null : deliveryId,
        "project_id": projectId == null ? null : projectId,
        "pickup_address": pickupAddress?.toJson(),
        "drop_address": dropAddress?.toJson(),
        "product_type": productType == null ? null : productType,
        "weight": weight == null ? null : weight,
        "pickup_time": pickupTime?.toIso8601String(),
        "drop_time": dropTime?.toIso8601String(),
        "state": state == null ? null : state,
        "id": id,
      };
}
//
// class PAddress {
//   PAddress({
//     this.firstname,
//     this.lastname,
//     this.flatNo,
//     this.street,
//     this.area,
//     this.city,
//     this.landmark,
//     this.country,
//     this.pincode,
//     this.phoneNo,
//     this.state,
//     this.businessName,
//   });
//
//   String firstname;
//   String lastname;
//   String flatNo;
//   String street;
//   String area;
//   String city;
//   String landmark;
//   String country;
//   int pincode;
//   String phoneNo;
//   String state;
//   String businessName;
//
//   factory PAddress.fromJson(Map<String, dynamic> json) => PAddress(
//         firstname: json["firstname"] == null ? null : json["firstname"],
//         lastname: json["lastname"] == null ? null : json["lastname"],
//         flatNo: json["flat_no"] == null ? null : json["flat_no"],
//         street: json["street"] == null ? null : json["street"],
//         area: json["area"] == null ? null : json["area"],
//         city: json["city"] == null ? null : json["city"],
//         landmark: json["landmark"] == null ? null : json["landmark"],
//         country: json["country"] == null ? null : json["country"],
//         pincode: json["pincode"] == null ? null : json["pincode"],
//         phoneNo: json["phone_no"] == null ? null : json["phone_no"],
//         state: json["state"] == null ? null : json["state"],
//         businessName: json["business_name"] == null ? null : json["business_name"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "firstname": firstname == null ? null : firstname,
//         "lastname": lastname == null ? null : lastname,
//         "flat_no": flatNo == null ? null : flatNo,
//         "street": street == null ? null : street,
//         "area": area == null ? null : area,
//         "city": city == null ? null : city,
//         "landmark": landmark == null ? null : landmark,
//         "country": country == null ? null : country,
//         "pincode": pincode == null ? null : pincode,
//         "phone_no": phoneNo == null ? null : phoneNo,
//         "state": state == null ? null : state,
//         "business_name": businessName == null ? null : businessName,
//       };
// }
//
// class Task {
//   Task({
//     this.taskId,
//     this.teamId,
//     this.taskType,
//     this.schedules,
//     this.address,
//     this.status,
//     this.team,
//     this.id,
//   });
//
//   int taskId;
//   int teamId;
//   String taskType;
//   List<int> schedules;
//   Address address;
//   String status;
//   Team team;
//   dynamic id;
//
//   factory Task.fromJson(Map<String, dynamic> json) => Task(
//         taskId: json["task_id"] == null ? null : json["task_id"],
//         teamId: json["team_id"] == null ? null : json["team_id"],
//         taskType: json["task_type"] == null ? null : json["task_type"],
//         schedules:
//             json["schedules"] == null ? null : List<int>.from(json["schedules"].map((x) => x)),
//         address: json["address"] == null ? null : Address.fromJson(json["address"]),
//         status: json["status"] == null ? null : json["status"],
//         team: json["team"] == null ? null : Team.fromJson(json["team"]),
//         id: json["id"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "task_id": taskId == null ? null : taskId,
//         "team_id": teamId == null ? null : teamId,
//         "task_type": taskType == null ? null : taskType,
//         "schedules": schedules == null ? null : List<dynamic>.from(schedules.map((x) => x)),
//         "address": address == null ? null : address.toJson(),
//         "status": status == null ? null : status,
//         "team": team == null ? null : team.toJson(),
//         "id": id,
//       };
// }
//
// class Address {
//   Address({
//     this.flatNo,
//     this.street,
//     this.area,
//     this.city,
//     this.state,
//     this.country,
//     this.latitude,
//     this.longitude,
//     this.pincode,
//     this.location,
//     this.landmark,
//   });
//
//   String flatNo;
//   String street;
//   String area;
//   String city;
//   String state;
//   String country;
//   double latitude;
//   double longitude;
//   String pincode;
//   String location;
//   String landmark;
//
//   factory Address.fromJson(Map<String, dynamic> json) => Address(
//         flatNo: json["flat_no"] == null ? null : json["flat_no"],
//         street: json["street"] == null ? null : json["street"],
//         area: json["area"] == null ? null : json["area"],
//         city: json["city"] == null ? null : json["city"],
//         state: json["state"] == null ? null : json["state"],
//         country: json["country"] == null ? null : json["country"],
//         latitude: json["latitude"] == null ? null : json["latitude"].toDouble(),
//         longitude: json["longitude"] == null ? null : json["longitude"].toDouble(),
//         pincode: json["pincode"] == null ? null : json["pincode"],
//         location: json["location"] == null ? null : json["location"],
//         landmark: json["landmark"] == null ? null : json["landmark"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "flat_no": flatNo == null ? null : flatNo,
//         "street": street == null ? null : street,
//         "area": area == null ? null : area,
//         "city": city == null ? null : city,
//         "state": state == null ? null : state,
//         "country": country == null ? null : country,
//         "latitude": latitude == null ? null : latitude,
//         "longitude": longitude == null ? null : longitude,
//         "pincode": pincode == null ? null : pincode,
//         "location": location == null ? null : location,
//         "landmark": landmark == null ? null : landmark,
//       };
// }

// class Team {
//   Team({
//     this.teamTeamId,
//     this.name,
//     this.type,
//     this.id,
//     this.teamId,
//   });
//
//   int teamTeamId;
//   String name;
//   String type;
//   String id;
//   String teamId;
//
//   factory Team.fromJson(Map<String, dynamic> json) => Team(
//         teamTeamId: json["team_id"] == null ? null : json["team_id"],
//         name: json["name"] == null ? null : json["name"],
//         type: json["type"] == null ? null : json["type"],
//         id: json["_id"] == null ? null : json["_id"],
//         teamId: json["id"] == null ? null : json["id"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "team_id": teamTeamId == null ? null : teamTeamId,
//         "name": name == null ? null : name,
//         "type": type == null ? null : type,
//         "_id": id == null ? null : id,
//         "id": teamId == null ? null : teamId,
//       };
// }
