import 'dart:convert';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reallist/models/dashboard_data_model.dart';
import 'package:reallist/models/login_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/chart_model.dart';
import '../screens/qr_result.dart';
import '../services/remote_service.dart';
import '../utils/helper.dart';

class DashboardController extends GetxController {
  DashboardDataModel? dashboardDataModel;
  LoginModel? loginModel;
  int touchedIndex = -1;
  var isLoading = false.obs;
  AnimationController? animationController;

  late TooltipBehavior tooltip;

  var qrRespone;

  List<_ChartData>? chartData;

  List<DoughnutSeries<ChartSampleData, String>> getDefaultDoughnutSeries() {
    return <DoughnutSeries<ChartSampleData, String>>[
      DoughnutSeries<ChartSampleData, String>(
        radius: '80%',
        explode: true,
        explodeOffset: '10%',
        dataSource: <ChartSampleData>[
          ChartSampleData(x: 'Newly added', y: 19, text: '19%'),
          ChartSampleData(x: 'Filled', y: 34.5, text: '34.5%'),
          ChartSampleData(x: 'Pending', y: 20.7, text: '20.7%'),
          ChartSampleData(x: 'Report', y: 3.7, text: '3.7%'),
          ChartSampleData(x: 'Completed', y: 25.9, text: '25.9%'),
        ],
        xValueMapper: (ChartSampleData data, _) => data.x as String,
        yValueMapper: (ChartSampleData data, _) => data.y,
        dataLabelMapper: (ChartSampleData data, _) => data.text,
        dataLabelSettings: const DataLabelSettings(isVisible: true),
      )
    ];
  }

  /// The method returns dashed line series to chart.
  List<LineSeries<_ChartData, num>> getDashedLineSeries() {
    return <LineSeries<_ChartData, num>>[
      LineSeries<_ChartData, num>(
          animationDuration: 2500,

          /// The property uses to render a line with dashes.
          dashArray: <double>[15, 3, 3, 3],
          dataSource: chartData!,
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y,
          width: 2,
          name: 'Newly added',
          markerSettings: const MarkerSettings(isVisible: true)),
      LineSeries<_ChartData, num>(
          animationDuration: 2500,
          dataSource: chartData!,
          dashArray: <double>[15, 3, 3, 3],
          width: 2,
          name: 'No filled',
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y2,
          markerSettings: const MarkerSettings(isVisible: true)),
      LineSeries<_ChartData, num>(
          animationDuration: 2500,
          dataSource: chartData!,
          width: 2,
          dashArray: <double>[15, 3, 3, 3],
          name: 'Pending',
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y3,
          markerSettings: const MarkerSettings(isVisible: true)),
      LineSeries<_ChartData, num>(
          animationDuration: 2500,
          dataSource: chartData!,
          width: 2,
          dashArray: <double>[15, 3, 3, 3],
          name: 'Completed',
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y4,
          markerSettings: const MarkerSettings(isVisible: true)),
    ];
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loginModel = LoginModel.fromJson(GetStorage().read("gs_login_data") != ''
        ? GetStorage().read("gs_login_data")
        : '');
    tooltip = TooltipBehavior(enable: true, format: 'point.x : point.y%');
    chartData = <_ChartData>[
      _ChartData(2010, 6.6, 9.0, 15.1, 18.8),
      _ChartData(2011, 6.3, 9.3, 15.5, 18.5),
      _ChartData(2012, 6.7, 10.2, 14.5, 17.6),
      _ChartData(2013, 6.7, 10.2, 13.9, 16.1),
      _ChartData(2014, 6.4, 10.9, 13, 17.2),
      _ChartData(2015, 6.8, 9.3, 13.4, 18.9),
      _ChartData(2016, 7.7, 10.1, 14.2, 19.4),
    ];
    update();
    getDashboardData();
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!Get.context!.mounted) return;

    qrRespone = int.parse(barcodeScanRes);
    print("-----------------> $qrRespone");
    if (qrRespone != -1) {
      Get.to(QrResult(), arguments: qrRespone);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    chartData!.clear();
  }

  void getDashboardData() async {
    try {
      isLoading(true);
      var response = await RemoteService().getDashboardService();
      print("dash -----------> ${response}");
      if (response != null) {
        var result = jsonDecode(response.body);
        print("dash -----------> ${result}");
        if (result["success"] == true) {
          print("dash -----------> ${result}");
          dashboardDataModel = DashboardDataModel.fromJson(result);
          update();
          isLoading(false);
        } else {
          dashboardDataModel = null;
          update();
          isLoading(false);
        }
      } else {
        ScaffoldMessenger.of(Get.context!)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            Helper().snackBar("On Snap !", "something went to wrong"),
          );
        isLoading(false);
      }
    } catch (err) {
      ScaffoldMessenger.of(Get.context!)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          Helper().snackBar("On Snap !", "something went to wrong"),
        );
      isLoading(false);
    }
  }
}

class _ChartData {
  _ChartData(this.x, this.y, this.y2, this.y3, this.y4);
  final double x;
  final double y;
  final double y2;
  final double y3;
  final double y4;
}
