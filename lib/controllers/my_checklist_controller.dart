import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reallist/models/my_checklist_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/check_list_model.dart';
import '../services/remote_service.dart';
import '../utils/helper.dart';

class MyChecklistController extends GetxController {
  MyChecklistModel? myChecklistModel;

  var isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    getMyChecklist();
  }

  Future<void> pullRefresh() async {
    getMyChecklist();
  }

  void getMyChecklist() async {
    try {
      isLoading(true);
      var response = await RemoteService().getMyChecklistService();
      print("my checklist data -----------> $response");
      if (response != null) {
        var result = jsonDecode(response.body);
        print("my checklist data -----------> $result");
        if (result["success"] == true) {
          print("checklist response -----------> ${result}");
          myChecklistModel = MyChecklistModel.fromJson(result);

          update();
          isLoading(false);
        } else {
          myChecklistModel = null;
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

  void viewHistory(id) async {
    try {
      //isIntentOn.value = true;
      final Uri toLaunch = Uri(
        scheme: 'https',
        host: 'checklist.medicall.in',
        path: '/app/show/feedback/$id',
      );
      print("----------> $toLaunch");
      if (!await launchUrl(
        toLaunch,
        mode: LaunchMode.inAppWebView,
        webViewConfiguration: const WebViewConfiguration(
            headers: <String, String>{'my_header_key': 'my_header_value'}),
      )) {
        throw Exception('Could not launch $toLaunch');
      }
    } catch (e) {
      print("----------> $e");
    }
  }
}
