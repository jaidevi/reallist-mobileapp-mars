import 'dart:convert';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reallist/controllers/history_controller.dart';
import 'package:reallist/controllers/my_history_controller.dart';
import 'package:reallist/screens/home.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/check_list_model.dart';
import '../models/login_model.dart';
import '../services/remote_service.dart';
import '../utils/helper.dart';

class QrResultController extends GetxController {
  RxList formList = [].obs;
  dynamic qrID;
  dynamic formRespon;
  RxBool isLoading = false.obs;
  RxBool isIntentOn = false.obs;
  CheckListModel? checkListModel;
  LoginModel? loginModel;
  RxBool isItAssessor = false.obs;

  @override
  void onInit() {
    super.onInit();
    Get.put(HistoryController());
    Get.put(MyHistroyController());
    loginModel = LoginModel.fromJson(GetStorage().read("gs_login_data"));
    roleCheck();
  }

  pullRefresh() async {
    print("pull and refresh calling ---------->");
    Get.find<HistoryController>().getAllHistory();
    getCheckListForm();
    update();
  }

  roleCheck() {
    try {
      for (var i = 0; i < loginModel!.data!.role!.length; i++) {
        if (loginModel!.data!.role![i] == 'assessor') {
          isItAssessor(true);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  var loginDetails = GetStorage().read("gs_login_data") != ''
      ? GetStorage().read("gs_login_data")
      : '';

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    Get.offAll(Home());
    return true;
  }

  void receiveData(result) {
    qrID = result;
    getCheckListForm();
  }

  void getCheckListForm() async {
    try {
      isLoading(true);
      var response = await RemoteService().getCheckListForm(qrID);
      if (response != null) {
        var result = jsonDecode(response.body);
        print("decode response ----------> ${result}");
        if (result["success"] == true) {
          checkListModel = CheckListModel.fromJson(result);
          update();
          isLoading(false);
        } else {
          checkListModel = null;
          ScaffoldMessenger.of(Get.context!)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              Helper().snackBar("On Snap !", result["message"]),
            );
          isLoading(false);
        }
      } else {
        ScaffoldMessenger.of(Get.context!)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            Helper().snackBar("On Snap !", "remote catch found"),
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

  void getFormBrow(id) async {
    try {
      print("-----------> asdsad ${loginDetails["token"]}");
      final Uri toLaunch = Uri(
        scheme: 'https',
        host: 'checklist.medicall.in',
        path: '/view/checklist/$id/$qrID/${loginDetails["token"]}',
      );
      print("form url ---------> ${toLaunch}");
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
