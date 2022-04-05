class TaskReassignModel {
  TaskReassignModel({
    this.status,
    this.message,
    this.error,
    // this.data,
  });

  String? status;
  String? message;
  dynamic error;
  // Data? data;

  factory TaskReassignModel.fromJson(Map<String, dynamic> json) => TaskReassignModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        error: json["error"],
        // data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "error": error,
        // "data": data?.toJson(),
      };
}

// class Data {
//   Data({
//     this.result,
//   });
//
//   Result? result;
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         result: json["result"] == null ? null : Result.fromJson(json["result"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "result": result?.toJson(),
//       };
// }

// class Result {
//   Result({
//     this.task,
//   });
//
//   Task task;
//
//   factory Result.fromJson(Map<String, dynamic> json) => Result(
//         task: json["task"] == null ? null : Task.fromJson(json["task"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "task": task == null ? null : task.toJson(),
//       };
// }

// class Task {
//   Task({
//     this.taskTaskId,
//     this.teamId,
//     this.taskType,
//     this.schedules,
//     this.latitude,
//     this.longitude,
//     this.pincode,
//     this.city,
//     this.state,
//     this.isTouchpoint,
//     this.status,
//     this.isActive,
//     this.createdDate,
//     this.updatedDate,
//     this.isDeleted,
//     this.partner,
//     this.id,
//     this.creatorName,
//     this.creatorPhone,
//     this.customerName,
//     this.customerPhone,
//     this.taskId,
//   });
//
//   int taskTaskId;
//   int teamId;
//   String taskType;
//   List<int> schedules;
//   double latitude;
//   double longitude;
//   String pincode;
//   String city;
//   String state;
//   bool isTouchpoint;
//   String status;
//   bool isActive;
//   DateTime createdDate;
//   DateTime updatedDate;
//   bool isDeleted;
//   String partner;
//   String id;
//   String creatorName;
//   String creatorPhone;
//   String customerName;
//   String customerPhone;
//   String taskId;
//
//   factory Task.fromJson(Map<String, dynamic> json) => Task(
//         taskTaskId: json["task_id"] == null ? null : json["task_id"],
//         teamId: json["team_id"] == null ? null : json["team_id"],
//         taskType: json["task_type"] == null ? null : json["task_type"],
//         schedules:
//             json["schedules"] == null ? null : List<int>.from(json["schedules"].map((x) => x)),
//         latitude: json["latitude"] == null ? null : json["latitude"].toDouble(),
//         longitude: json["longitude"] == null ? null : json["longitude"].toDouble(),
//         pincode: json["pincode"] == null ? null : json["pincode"],
//         city: json["city"] == null ? null : json["city"],
//         state: json["state"] == null ? null : json["state"],
//         isTouchpoint: json["is_touchpoint"] == null ? null : json["is_touchpoint"],
//         status: json["status"] == null ? null : json["status"],
//         isActive: json["is_active"] == null ? null : json["is_active"],
//         createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
//         updatedDate: json["updated_date"] == null ? null : DateTime.parse(json["updated_date"]),
//         isDeleted: json["is_deleted"] == null ? null : json["is_deleted"],
//         partner: json["partner"] == null ? null : json["partner"],
//         id: json["_id"] == null ? null : json["_id"],
//         creatorName: json["creator_name"] == null ? null : json["creator_name"],
//         creatorPhone: json["creator_phone"] == null ? null : json["creator_phone"],
//         customerName: json["customer_name"] == null ? null : json["customer_name"],
//         customerPhone: json["customer_phone"] == null ? null : json["customer_phone"],
//         taskId: json["id"] == null ? null : json["id"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "task_id": taskTaskId == null ? null : taskTaskId,
//         "team_id": teamId == null ? null : teamId,
//         "task_type": taskType == null ? null : taskType,
//         "schedules": schedules == null ? null : List<dynamic>.from(schedules.map((x) => x)),
//         "latitude": latitude == null ? null : latitude,
//         "longitude": longitude == null ? null : longitude,
//         "pincode": pincode == null ? null : pincode,
//         "city": city == null ? null : city,
//         "state": state == null ? null : state,
//         "is_touchpoint": isTouchpoint == null ? null : isTouchpoint,
//         "status": status == null ? null : status,
//         "is_active": isActive == null ? null : isActive,
//         "created_date": createdDate == null ? null : createdDate.toIso8601String(),
//         "updated_date": updatedDate == null ? null : updatedDate.toIso8601String(),
//         "is_deleted": isDeleted == null ? null : isDeleted,
//         "partner": partner == null ? null : partner,
//         "_id": id == null ? null : id,
//         "creator_name": creatorName == null ? null : creatorName,
//         "creator_phone": creatorPhone == null ? null : creatorPhone,
//         "customer_name": customerName == null ? null : customerName,
//         "customer_phone": customerPhone == null ? null : customerPhone,
//         "id": taskId == null ? null : taskId,
//       };
// }
