// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

class MyBagModel {
  MyBagModel({
    this.status,
    this.message,
    this.error,
    this.data,
  });

  String? status;
  String? message;
  dynamic error;
  Data? data;

  factory MyBagModel.fromJson(Map<String, dynamic> json) => MyBagModel(
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
    this.result = const <dynamic>[],
  });

  List<dynamic> result;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        result: List<dynamic>.from(json["result"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result.map((x) => x)),
      };
}
