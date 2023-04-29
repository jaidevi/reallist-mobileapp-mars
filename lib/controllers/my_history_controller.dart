import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/my_history_model.dart';
import '../services/remote_service.dart';
import '../utils/helper.dart';

class MyHistroyController extends GetxController {
  MyHistoryModel? myHistoryModel;
  var isLoading = false.obs;

  final List<String> items = ['view', 'edit'];

  @override
  void onInit() {
    super.onInit();
    getMyHistory();
  }

  Future<void> pullRefresh() async {
    getMyHistory();
  }

  void getMyHistory() async {
    try {
      isLoading(true);
      var response = await RemoteService().getMyHistoryService();
      if (response != null) {
        var result = jsonDecode(response.body);
        print("decode result ---------> $result");
        if (result["success"] == true) {
          print("-----------> ${result}");
          myHistoryModel = MyHistoryModel.fromJson(result);
          update();
          isLoading(false);
        } else {
          myHistoryModel = null;
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
