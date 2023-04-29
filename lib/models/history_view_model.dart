// To parse this JSON data, do
//
//     final historyViewModel = historyViewModelFromJson(jsonString);

import 'dart:convert';

HistoryViewModel historyViewModelFromJson(String str) =>
    HistoryViewModel.fromJson(json.decode(str));

String historyViewModelToJson(HistoryViewModel data) =>
    json.encode(data.toJson());

class HistoryViewModel {
  HistoryViewModel({
    required this.title,
    required this.historyData,
  });

  String title;
  List<List<HistoryDatum>> historyData;

  factory HistoryViewModel.fromJson(Map<String, dynamic> json) =>
      HistoryViewModel(
        title: json["title"],
        historyData: List<List<HistoryDatum>>.from(json["history_data"].map(
            (x) => List<HistoryDatum>.from(
                x.map((x) => HistoryDatum.fromJson(x))))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "history_data": List<dynamic>.from(historyData
            .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
      };
}

class HistoryDatum {
  HistoryDatum({
    required this.type,
    required this.label,
    required this.column,
    this.subtype,
    this.name,
    this.value,
    this.required,
    this.className,
    this.isClientEmail,
    this.other,
    this.inline,
    this.values,
    this.chartType,
    this.isEnableChart,
  });

  dynamic type;
  dynamic label;
  dynamic column;
  dynamic subtype;
  dynamic name;
  dynamic value;
  dynamic required;
  dynamic className;
  dynamic isClientEmail;
  dynamic other;
  dynamic inline;
  List<Value>? values;
  dynamic chartType;
  bool? isEnableChart;

  factory HistoryDatum.fromJson(Map<String, dynamic> json) => HistoryDatum(
        type: json["type"],
        label: json["label"],
        column: json["column"],
        subtype: json["subtype"],
        name: json["name"],
        value: json["value"],
        required: json["required"],
        className: json["className"],
        isClientEmail: json["is_client_email"],
        other: json["other"],
        inline: json["inline"],
        values: json["values"] == null
            ? []
            : List<Value>.from(json["values"]!.map((x) => Value.fromJson(x))),
        chartType: json["chart_type"],
        isEnableChart: json["is_enable_chart"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "label": label,
        "column": column,
        "subtype": subtype,
        "name": name,
        "value": value,
        "required": required,
        "className": className,
        "is_client_email": isClientEmail,
        "other": other,
        "inline": inline,
        "values": values == null
            ? []
            : List<dynamic>.from(values!.map((x) => x.toJson())),
        "chart_type": chartType,
        "is_enable_chart": isEnableChart,
      };
}

class Value {
  Value({
    required this.label,
    required this.value,
    this.selected,
  });

  String label;
  String value;
  int? selected;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        label: json["label"],
        value: json["value"],
        selected: json["selected"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "value": value,
        "selected": selected,
      };
}
