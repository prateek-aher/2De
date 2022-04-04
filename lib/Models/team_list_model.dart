class TeamListModel {
  TeamListModel({
    this.status,
    this.message,
    this.error,
    this.data,
  });

  String? status;
  String? message;
  dynamic error;
  Data? data;

  factory TeamListModel.fromJson(Map<String, dynamic> json) => TeamListModel(
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
    this.count = 0,
    this.result = const <TeamMember>[],
  });

  int count;
  List<TeamMember> result;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        count: json["count"] == null ? null : json["count"],
        result: json["result"] == null
            ? <TeamMember>[]
            : List<TeamMember>.from(json["result"].map((x) => TeamMember.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class TeamMember {
  TeamMember({
    this.teamId,
    this.name,
    this.startTime,
    this.endTime,
    this.type,
    this.walletAmount = 0,
    this.status,
    this.id,
  });

  int? teamId;
  String? name;
  int? startTime;
  int? endTime;
  String? type;
  int walletAmount;
  bool? status;
  dynamic id;

  factory TeamMember.fromJson(Map<String, dynamic> json) => TeamMember(
        teamId: json["team_id"] == null ? null : json["team_id"],
        name: json["name"] == null ? null : json["name"],
        startTime: json["start_time"] == null ? null : json["start_time"],
        endTime: json["end_time"] == null ? null : json["end_time"],
        type: json["type"] == null ? null : json["type"],
        walletAmount: json["wallet_amount"] == null ? null : json["wallet_amount"],
        status: json["status"] == null ? null : json["status"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "team_id": teamId == null ? null : teamId,
        "name": name == null ? null : name,
        "start_time": startTime == null ? null : startTime,
        "end_time": endTime == null ? null : endTime,
        "type": type == null ? null : type,
        "wallet_amount": walletAmount,
        "status": status == null ? null : status,
        "id": id,
      };
}
