// To parse this JSON data, do
//
//     final myTeamModel = myTeamModelFromJson(jsonString);

import 'dart:convert';

MyTeamModel myTeamModelFromJson(String str) =>
    MyTeamModel.fromJson(json.decode(str));

String myTeamModelToJson(MyTeamModel data) => json.encode(data.toJson());

class MyTeamModel {
  MyTeamModel({
    required this.status,
    required this.success,
    required this.message,
    required this.data,
  });

  int status;
  bool success;
  String message;
  List<Datum> data;

  factory MyTeamModel.fromJson(Map<String, dynamic> json) => MyTeamModel(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.location,
    required this.department,
    required this.division,
    required this.userRole,
  });

  Department location;
  Department department;
  Department division;
  String userRole;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        location: Department.fromJson(json["location"]),
        department: Department.fromJson(json["department"]),
        division: Department.fromJson(json["division"]),
        userRole: json["user_role"],
      );

  Map<String, dynamic> toJson() => {
        "location": location.toJson(),
        "department": department.toJson(),
        "division": division.toJson(),
        "user_role": userRole,
      };
}

class Department {
  Department({
    required this.id,
    required this.name,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int id;
  String name;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  factory Department.fromJson(Map<String, dynamic> json) => Department(
        id: json["id"],
        name: json["name"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
