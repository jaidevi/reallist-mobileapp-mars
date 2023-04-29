import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reallist/models/login_model.dart';
import 'package:reallist/screens/home.dart';
import 'package:reallist/services/remote_service.dart';
import 'package:reallist/utils/helper.dart';

class AuthController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final loginIdController = TextEditingController().obs;
  final loginPassController = TextEditingController().obs;

  var isLoading = false.obs;
  var passObscure = true.obs;

  LoginModel? loginModel;

  login() async {
    try {
      isLoading(true);
      var queryParams = {
        "emp_id": loginIdController.value.text,
        "password": loginPassController.value.text
      };
      var response = await RemoteService().login(queryParams);
      if (response != null) {
        var result = jsonDecode(response.body);
        if (result["success"] == true) {
          loginModel = LoginModel.fromJson(result);
          GetStorage().write("gs_login_data", result);
          isLoading(false);
          Get.offAll(Home());
        } else {
          ScaffoldMessenger.of(Get.context!)
            ..hideCurrentSnackBar()
            ..showSnackBar(Helper().snackBar('On Snap!', result["message"]));
          isLoading(false);
        }
      } else {
        ScaffoldMessenger.of(Get.context!)
          ..hideCurrentSnackBar()
          ..showSnackBar(Helper()
              .snackBar('On Snap!', 'something went to wrong while login'));
        isLoading(false);
      }
    } catch (err) {
      ScaffoldMessenger.of(Get.context!)
        ..hideCurrentSnackBar()
        ..showSnackBar(Helper()
            .snackBar('On Snap!', 'something went to wrong while login'));
      isLoading(false);
    }
  }
}
