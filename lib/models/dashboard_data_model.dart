// To parse this JSON data, do
//
//     final dashboardDataModel = dashboardDataModelFromJson(jsonString);

import 'dart:convert';

DashboardDataModel dashboardDataModelFromJson(String str) =>
    DashboardDataModel.fromJson(json.decode(str));

String dashboardDataModelToJson(DashboardDataModel data) =>
    json.encode(data.toJson());

class DashboardDataModel {
  DashboardDataModel({
    required this.status,
    required this.success,
    required this.message,
    required this.data,
  });

  int status;
  bool success;
  String message;
  Data data;

  factory DashboardDataModel.fromJson(Map<String, dynamic> json) =>
      DashboardDataModel(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.totalChecklist,
    required this.totalSpot,
    required this.assignedChecklist,
    required this.assignedSpot,
    required this.completedChecklist,
    required this.pendingChecklist,
    required this.upcomingChecklist,
    required this.upcomingSpot,
  });

  int totalChecklist;
  int totalSpot;
  int assignedChecklist;
  int assignedSpot;
  int completedChecklist;
  int pendingChecklist;
  int upcomingChecklist;
  int upcomingSpot;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        totalChecklist: json["total_checklist"],
        totalSpot: json["total_spot"],
        assignedChecklist: json["assigned_checklist"],
        assignedSpot: json["assigned_spot"],
        completedChecklist: json["completed_checklist"],
        pendingChecklist: json["pending_checklist"],
        upcomingChecklist: json["upcoming_checklist"],
        upcomingSpot: json["upcoming_spot"],
      );

  Map<String, dynamic> toJson() => {
        "total_checklist": totalChecklist,
        "total_spot": totalSpot,
        "assigned_checklist": assignedChecklist,
        "assigned_spot": assignedSpot,
        "completed_checklist": completedChecklist,
        "pending_checklist": pendingChecklist,
        "upcoming_checklist": upcomingChecklist,
        "upcoming_spot": upcomingSpot,
      };
}
