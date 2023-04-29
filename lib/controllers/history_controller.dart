import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reallist/models/history_model.dart';
import 'package:reallist/models/history_view_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/login_model.dart';
import '../services/remote_service.dart';
import '../utils/helper.dart';

class HistoryController extends GetxController {
  HistoryModel? historyModel;
  LoginModel? loginModel;
  HistoryViewModel? historyViewModel;
  RxBool isLoading = false.obs;

  var loginDetails = GetStorage().read("gs_login_data") != ''
      ? GetStorage().read("gs_login_data")
      : '';

  RxBool isViewLoading = false.obs;
  RxBool listEditBtn = false.obs;
  @override
  void onInit() {
    super.onInit();
    loginModel = LoginModel.fromJson(GetStorage().read("gs_login_data"));
    permissionCheck();
    getAllHistory();
  }

  Future<void> pullRefresh() async {
    getAllHistory();
  }

  void permissionCheck() {
    try {
      listEditBtn(false);
      for (var i = 0; i < loginModel!.data!.role!.length; i++) {
        print("--------> ${loginModel!.data!.role![i]}");
        if (loginModel!.data!.role![i] != 'assessor') {
          listEditBtn(true);
        }
      }
    } catch (e) {
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
        path: '$path/$id/${loginDetails["token"]}',
      );
      if (!await launchUrl(
        toLaunch,
        mode: LaunchMode.inAppWebView,
        webViewConfiguration: WebViewConfiguration(headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${loginDetails["token"]}',
        }),
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

  void getEditOrViewWoToken(id, key) async {
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
        webViewConfiguration: WebViewConfiguration(headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${loginDetails["token"]}',
        }),
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

  void getAllHistory() async {
    try {
      isLoading(true);
      var response = await RemoteService().getAllHistory();
      if (response != null) {
        var result = jsonDecode(response.body);
        if (result["success"] == true) {
          print("-----------> ${result}");
          historyModel = HistoryModel.fromJson(result);
          update();
          isLoading(false);
        } else {
          historyModel = null;
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
