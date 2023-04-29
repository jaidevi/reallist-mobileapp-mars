import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reallist/models/override_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../services/remote_service.dart';
import '../utils/helper.dart';

class OverrideController extends GetxController {
  OverRideModel? overRideModel;
  var isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    getOverRide();
  }

  Future<void> pullRefresh() async {
    getOverRide();
  }

  void getOverRide() async {
    try {
      print("trye calling --------->");
      isLoading(true);
      var response = await RemoteService().getOverRideService();
      print("----------------> $response");
      if (response != null) {
        var result = jsonDecode(response.body);
        if (result["success"] == true) {
          print("-----------> ${result}");
          overRideModel = OverRideModel.fromJson(result);
          update();
          isLoading(false);
        } else {
          overRideModel = null;
          isLoading(false);
        }
      } else {
        ScaffoldMessenger.of(Get.context!)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            Helper().snackBar("", "something went to wrong"),
          );
        isLoading(false);
      }
    } catch (err) {
      print("catch calling ---------> $err");
      ScaffoldMessenger.of(Get.context!)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          Helper().snackBar("On Snap !", "something went to wrong"),
        );
      isLoading(false);
    }
  }

  void getEditOrView(id, key) async {
    try {
      var path = '';
      if (key == 'edit') {
        path = '/app/edit/feedback';
      } else {
        path = '/app/show/feedback';
      }
      final Uri toLaunch = Uri(
        scheme: 'https',
        host: 'checklist.medicall.in',
        path: '$path/$id',
      );
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
      ScaffoldMessenger.of(Get.context!)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          Helper().snackBar("On Snap !", "something went to wrong"),
        );
      isLoading(false);
    }
  }
}
