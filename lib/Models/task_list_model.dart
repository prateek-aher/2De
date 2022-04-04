// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:delivery/Models/FindTaskModel.dart';
import 'package:delivery/Utils/enumerations.dart';

TaskListModel welcomeFromJson(String str) => TaskListModel.fromJson(json.decode(str));

String welcomeToJson(TaskListModel data) => json.encode(data.toJson());

class TaskListModel {
  TaskListModel({
    this.status,
    this.message,
    this.error,
    this.data,
  });

  String? status;
  String? message;
  dynamic error;
  Data? data;

  factory TaskListModel.fromJson(Map<String, dynamic> json) => TaskListModel(
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
    this.drops = const [],
    this.pickups = const [],
  });

  List<Drop> drops;
  List<Pickup> pickups;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        drops: json["drops"] == null
            ? []
            : List<Drop>.from(json["drops"].map((x) => Drop.fromJson(x))),
        pickups: json["pickups"] == null
            ? []
            : List<Pickup>.from(json["pickups"].map((x) => Pickup.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "drops": List<dynamic>.from(drops.map((x) => x.toJson())),
        "pickups": List<dynamic>.from(pickups.map((x) => x.toJson())),
      };
}

class Pickup {
  Pickup({
    this.taskId,
    this.teamId,
    this.taskType,
    this.schedules = const [],
    this.address,
    this.status,
    this.team,
    this.id,
  });

  int? taskId;
  int? teamId;
  TaskType? taskType;
  List<int> schedules;
  Address? address;
  String? status;
  Team? team;
  dynamic id;

  factory Pickup.fromJson(Map<String, dynamic> json) => Pickup(
        taskId: json["task_id"] == null ? null : json["task_id"],
        teamId: json["team_id"] == null ? null : json["team_id"],
        taskType: jsonToTaskType(json),
        schedules: json["schedules"] == null ? [] : List<int>.from(json["schedules"].map((x) => x)),
        address: json["address"] == null ? null : Address.fromJson(json["address"]),
        status: json["status"],
        team: json["team"] == null ? null : Team.fromJson(json["team"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "task_id": taskId == null ? null : taskId,
        "team_id": teamId == null ? null : teamId,
        "task_type": taskType == null ? null : taskTypeToJson(taskType!),
        "schedules": List<dynamic>.from(schedules.map((x) => x)),
        "address": address?.toJson(),
        "status": status,
        "team": team?.toJson(),
        "id": id,
      };
}

class Drop {
  Drop({
    this.taskId,
    this.teamId,
    this.taskType,
    this.schedules = const [],
    this.address,
    this.status,
    this.team,
    this.id,
  });

  int? taskId;
  int? teamId;
  TaskType? taskType;
  List<int> schedules;
  Address? address;
  String? status;
  Team? team;
  dynamic id;

  factory Drop.fromJson(Map<String, dynamic> json) => Drop(
        taskId: json["task_id"] == null ? null : json["task_id"],
        teamId: json["team_id"] == null ? null : json["team_id"],
        taskType: jsonToTaskType(json),
        schedules: json["schedules"] == null ? [] : List<int>.from(json["schedules"].map((x) => x)),
        address: json["address"] == null ? null : Address.fromJson(json["address"]),
        status: json["status"],
        team: json["team"] == null ? null : Team.fromJson(json["team"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "task_id": taskId == null ? null : taskId,
        "team_id": teamId == null ? null : teamId,
        "task_type": taskType == null ? null : taskTypeToJson(taskType!),
        "schedules": List<dynamic>.from(schedules.map((x) => x)),
        "address": address?.toJson(),
        "status": status,
        "team": team?.toJson(),
        "id": id,
      };
}

class Address {
  Address({
    this.flatNo,
    this.street,
    this.area,
    this.city,
    this.state,
    this.country,
    this.latitude,
    this.longitude,
    this.pincode,
    this.location,
    this.landmark,
  });

  String? flatNo;
  String? street;
  String? area;
  String? city;
  String? state;
  String? country;
  double? latitude;
  double? longitude;
  String? pincode;
  String? location;
  String? landmark;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        flatNo: json["flat_no"],
        street: json["street"],
        area: json["area"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        pincode: json["pincode"],
        location: json["location"],
        landmark: json["landmark"],
      );

  Map<String, dynamic> toJson() => {
        "flat_no": flatNo,
        "street": street,
        "area": area,
        "city": city,
        "state": state,
        "country": country,
        "latitude": latitude,
        "longitude": longitude,
        "pincode": pincode,
        "location": location,
        "landmark": landmark,
      };
}

// enum Area { NARHE }
//
// final areaValues = EnumValues({"Narhe": Area.NARHE});
//
// enum City { PUNE }
//
// final cityValues = EnumValues({"Pune": City.PUNE});
//
// enum Country { INDIA }
//
// final countryValues = EnumValues({"India": Country.INDIA});
//
// enum FlatNo { FLAT_NO_303 }
//
// final flatNoValues = EnumValues({"Flat no 303": FlatNo.FLAT_NO_303});
//
// enum Landmark { TULZA_BHAVANI_MANDIR }
//
// final landmarkValues =
//     EnumValues({"Tulza bhavani mandir": Landmark.TULZA_BHAVANI_MANDIR});
//
// enum Location { SANT_SHILP_BUILDING_ABHINAV_PHARMACY_COLLAGE_ROAD_NARHE_PUNE }
//
// final locationValues = EnumValues({
//   "Sant Shilp Building, Abhinav Pharmacy collage Road, Narhe, Pune":
//       Location.SANT_SHILP_BUILDING_ABHINAV_PHARMACY_COLLAGE_ROAD_NARHE_PUNE
// });
//
// enum State { MAHARASHTRA }
//
// final stateValues = EnumValues({"Maharashtra": State.MAHARASHTRA});
//
// enum Street { SANT_SHILP_BUILDING }
//
// final streetValues =
//     EnumValues({"Sant Shilp Building": Street.SANT_SHILP_BUILDING});
//
// enum Status { ASSIGNED }
//
// final statusValues = EnumValues({"assigned": Status.ASSIGNED});
//
// enum TaskType { PICKUP }
//
// final taskTypeValues = EnumValues({"pickup": TaskType.PICKUP});

class Team {
  Team({
    this.teamTeamId,
    this.name,
    this.type = VehicleType.none,
    // this.id,
    // this.teamId,
  });

  int? teamTeamId;
  String? name;
  VehicleType type;
  // Id? id;
  // Id? teamId;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        teamTeamId: json["team_id"] == null ? null : json["team_id"],
        name: json["name"],
        type: convertToVehicleType(json["type"]),
        // id: json["_id"] == null ? null : idValues.map[json["_id"]],
        // teamId: json["id"] == null ? null : idValues.map[json["id"]],
      );

  Map<String, dynamic> toJson() => {
        "team_id": teamTeamId == null ? null : teamTeamId,
        "name": name,
        "type": convertFromVehicleType(type),
        // "_id": id == null ? null : idValues.reverse[id],
        // "id": teamId == null ? null : idValues.reverse[teamId],
      };
}

VehicleType convertToVehicleType(json) {
  switch (json) {
    case '2wheeler':
      return VehicleType.twoWheeler;
    case '4wheeler':
      return VehicleType.fourWheeler;
    default:
      return VehicleType.none;
  }
}

String? convertFromVehicleType(VehicleType type) {
  switch (type) {
    case VehicleType.none:
      return null;
    case VehicleType.twoWheeler:
      return '2wheeler';
    case VehicleType.fourWheeler:
      return '4wheeler';
  }
}

// enum Id {
//   THE_6245_C887_D942_B55_A3_EAD80_C1,
//   THE_6245_C907_D942_B55_A3_EAD80_C5
// }

// final idValues = EnumValues({
//   "6245c887d942b55a3ead80c1": Id.THE_6245_C887_D942_B55_A3_EAD80_C1,
//   "6245c907d942b55a3ead80c5": Id.THE_6245_C907_D942_B55_A3_EAD80_C5
// });

// enum Name { SWAMIRAJ_GUNJAL, SUBHOD_KUMAR }
//
// final nameValues = EnumValues({
//   "Subhod Kumar": Name.SUBHOD_KUMAR,
//   "Swamiraj Gunjal": Name.SWAMIRAJ_GUNJAL
// });

enum VehicleType { twoWheeler, fourWheeler, none }

// final typeValues = EnumValues(
//     {"2wheeler": VehicleType.twoWheeler, "4wheeler": VehicleType.fourWheeler});

// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }
