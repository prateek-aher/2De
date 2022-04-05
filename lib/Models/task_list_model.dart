import 'package:delivery/Models/FindTaskModel.dart';

import '../Utils/enumerations.dart';

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
        status: json["status"],
        message: json["message"],
        error: json["error"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
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
    this.drops = const <Drop>[],
    this.pickups = const <Pickup>[],
  });

  List<Drop> drops;
  List<Pickup> pickups;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        drops: json["drops"] == null ? <Drop>[] : List<Drop>.from(json["drops"].map((x) => x)),
        pickups: json["pickups"] == null
            ? <Pickup>[]
            : List<Pickup>.from(json["pickups"].map((x) => Pickup.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "drops": List<dynamic>.from(drops.map((x) => x)),
        "pickups": List<dynamic>.from(pickups.map((x) => x.toJson())),
      };
}

class Pickup {
  Pickup({
    this.taskId,
    this.teamId,
    this.taskType = TaskType.none,
    this.schedules = const <int>[],
    this.creatorName = '',
    this.customerName = '',
    this.customerPhone = '',
    this.status,
    this.creatorPhone = '',
    this.team,
    this.id,
  });

  int? taskId;
  int? teamId;
  TaskType taskType;
  List<int> schedules;
  String creatorName;
  String customerName;
  String customerPhone;
  String? status;
  String creatorPhone;
  Team? team;
  dynamic id;

  factory Pickup.fromJson(Map<String, dynamic> json) => Pickup(
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
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "task_id": taskId,
        "team_id": teamId,
        "task_type": taskTypeToJson(taskType),
        "schedules": List<dynamic>.from(schedules.map((x) => x)),
        "creator_name": creatorName,
        "customer_name": customerName,
        "customer_phone": customerPhone,
        "status": status,
        "creator_phone": creatorPhone,
        "team": team?.toJson(),
        "id": id,
      };
}

class Drop {
  Drop({
    this.taskId,
    this.teamId,
    this.taskType = TaskType.none,
    this.schedules = const <int>[],
    this.creatorName = '',
    this.customerName = '',
    this.customerPhone = '',
    this.status,
    this.creatorPhone = '',
    this.team,
    this.id,
  });

  int? taskId;
  int? teamId;
  TaskType taskType;
  List<int> schedules;
  String creatorName;
  String customerName;
  String customerPhone;
  String? status;
  String creatorPhone;
  Team? team;
  dynamic id;

  factory Drop.fromJson(Map<String, dynamic> json) => Drop(
        taskId: json["task_id"] == null ? null : json["task_id"],
        teamId: json["team_id"] == null ? null : json["team_id"],
        taskType: jsonToTaskType(json["task_type"]),
        schedules:
            json["schedules"] == null ? <int>[] : List<int>.from(json["schedules"].map((x) => x)),
        creatorName: json["creator_name"],
        customerName: json["customer_name"],
        customerPhone: json["customer_phone"],
        status: json["status"],
        creatorPhone: json["creator_phone"],
        team: json["team"] == null ? null : Team.fromJson(json["team"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "task_id": taskId == null ? null : taskId,
        "team_id": teamId == null ? null : teamId,
        "task_type": taskTypeToJson(taskType),
        "schedules": List<int>.from(schedules.map((x) => x)),
        "creator_name": creatorName,
        "customer_name": customerName,
        "customer_phone": customerPhone,
        "status": status,
        "creator_phone": creatorPhone,
        "team": team?.toJson(),
        "id": id,
      };
}

class Team {
  Team({
    this.teamId,
    this.name = '',
    this.type,
    // this.id,
    this.id,
  });

  int? teamId;
  String name;
  String? type;
  // String id;
  String? id;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        teamId: json["team_id"] == null ? null : json["team_id"],
        name: json["name"] == null ? null : json["name"],
        type: json["type"] == null ? null : json["type"],
        // id: json["_id"] == null ? null : json["_id"],
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "team_id": teamId == null ? null : teamId,
        "name": name == null ? null : name,
        "type": type == null ? null : type,
        // "_id": id == null ? null : id,
        "id": id == null ? null : id,
      };
}
