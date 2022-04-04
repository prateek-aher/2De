class TeamStatusChangeModel {
  TeamStatusChangeModel({
    this.status,
    this.message,
    this.error,
    this.data,
  });

  String? status;
  String? message;
  dynamic error;
  Data? data;

  factory TeamStatusChangeModel.fromJson(Map<String, dynamic> json) => TeamStatusChangeModel(
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
    this.teams,
  });

  Teams? teams;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        teams: json["teams"] == null ? null : Teams.fromJson(json["teams"]),
      );

  Map<String, dynamic> toJson() => {
        "teams": teams?.toJson(),
      };
}

class Teams {
  Teams({
    this.statusCode,
    // this.result,
  });

  int? statusCode;
  // ResultClass? result;

  factory Teams.fromJson(Map<String, dynamic> json) => Teams(
        statusCode: json["StatusCode"] == null ? null : json["StatusCode"],
        // result: json["Result"] == null ? null : ResultClass.fromJson(json["Result"]),
      );

  Map<String, dynamic> toJson() => {
        "StatusCode": statusCode == null ? null : statusCode,
        // "Result": result?.toJson(),
      };
}

// class ResultClass {
//   ResultClass({
//     this.teamId,
//     this.hubId,
//     this.email,
//     this.avatar,
//     this.phoneNo,
//     this.password,
//     this.name,
//     this.role,
//     this.startTime,
//     this.endTime,
//     this.latitude,
//     this.longitude,
//     this.currentLatitude,
//     this.currentLongitude,
//     this.type,
//     this.walletAmount,
//     this.isActive,
//     this.createdDate,
//     this.updatedDate,
//     this.context,
//     this.status,
//     this.isDeleted,
//     this.otp,
//     this.isVerified,
//     this.partner,
//     this.id,
//     this.v,
//     this.resultId,
//   });
//
//   int teamId;
//   int hubId;
//   String email;
//   String avatar;
//   String phoneNo;
//   String password;
//   String name;
//   String role;
//   int startTime;
//   int endTime;
//   int latitude;
//   int longitude;
//   int currentLatitude;
//   int currentLongitude;
//   String type;
//   int walletAmount;
//   bool isActive;
//   DateTime createdDate;
//   DateTime updatedDate;
//   dynamic context;
//   bool status;
//   bool isDeleted;
//   int otp;
//   bool isVerified;
//   String partner;
//   String id;
//   int v;
//   String resultId;
//
//   factory ResultClass.fromJson(Map<String, dynamic> json) => ResultClass(
//         teamId: json["team_id"] == null ? null : json["team_id"],
//         hubId: json["hub_id"] == null ? null : json["hub_id"],
//         email: json["email"] == null ? null : json["email"],
//         avatar: json["avatar"] == null ? null : json["avatar"],
//         phoneNo: json["phone_no"] == null ? null : json["phone_no"],
//         password: json["password"] == null ? null : json["password"],
//         name: json["name"] == null ? null : json["name"],
//         role: json["role"] == null ? null : json["role"],
//         startTime: json["start_time"] == null ? null : json["start_time"],
//         endTime: json["end_time"] == null ? null : json["end_time"],
//         latitude: json["latitude"] == null ? null : json["latitude"],
//         longitude: json["longitude"] == null ? null : json["longitude"],
//         currentLatitude: json["current_latitude"] == null ? null : json["current_latitude"],
//         currentLongitude: json["current_longitude"] == null ? null : json["current_longitude"],
//         type: json["type"] == null ? null : json["type"],
//         walletAmount: json["wallet_amount"] == null ? null : json["wallet_amount"],
//         isActive: json["is_active"] == null ? null : json["is_active"],
//         createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
//         updatedDate: json["updated_date"] == null ? null : DateTime.parse(json["updated_date"]),
//         context: json["context"],
//         status: json["status"] == null ? null : json["status"],
//         isDeleted: json["is_deleted"] == null ? null : json["is_deleted"],
//         otp: json["otp"] == null ? null : json["otp"],
//         isVerified: json["is_verified"] == null ? null : json["is_verified"],
//         partner: json["partner"] == null ? null : json["partner"],
//         id: json["_id"] == null ? null : json["_id"],
//         v: json["__v"] == null ? null : json["__v"],
//         resultId: json["id"] == null ? null : json["id"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "team_id": teamId == null ? null : teamId,
//         "hub_id": hubId == null ? null : hubId,
//         "email": email == null ? null : email,
//         "avatar": avatar == null ? null : avatar,
//         "phone_no": phoneNo == null ? null : phoneNo,
//         "password": password == null ? null : password,
//         "name": name == null ? null : name,
//         "role": role == null ? null : role,
//         "start_time": startTime == null ? null : startTime,
//         "end_time": endTime == null ? null : endTime,
//         "latitude": latitude == null ? null : latitude,
//         "longitude": longitude == null ? null : longitude,
//         "current_latitude": currentLatitude == null ? null : currentLatitude,
//         "current_longitude": currentLongitude == null ? null : currentLongitude,
//         "type": type == null ? null : type,
//         "wallet_amount": walletAmount == null ? null : walletAmount,
//         "is_active": isActive == null ? null : isActive,
//         "created_date": createdDate == null ? null : createdDate.toIso8601String(),
//         "updated_date": updatedDate == null ? null : updatedDate.toIso8601String(),
//         "context": context,
//         "status": status == null ? null : status,
//         "is_deleted": isDeleted == null ? null : isDeleted,
//         "otp": otp == null ? null : otp,
//         "is_verified": isVerified == null ? null : isVerified,
//         "partner": partner == null ? null : partner,
//         "_id": id == null ? null : id,
//         "__v": v == null ? null : v,
//         "id": resultId == null ? null : resultId,
//       };
// }
