import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:reallist/models/login_model.dart';

import 'app_colors.dart';
import 'app_string.dart';

class Helper {
  convertTimestamp(time) {
    var strToDateTime = DateTime.parse(time.toString());
    final convertLocal = strToDateTime.toLocal();
    var newFormat = DateFormat("dd-MM-yyyy hh:mm aaa");
    String date = newFormat.format(convertLocal);
    return date;
  }

  loginResponse() {
    late LoginModel loginModel;
    loginModel = LoginModel.fromJson(GetStorage().read("gs_login_data") != ''
        ? GetStorage().read("gs_login_data")
        : '');
    return loginModel;
  }

  successAlert(text) {
    return CoolAlert.show(
        context: Get.context!,
        type: CoolAlertType.success,
        text: text,
        autoCloseDuration: const Duration(seconds: 3),
        barrierDismissible: false);
  }

  warningAlert(text) {
    return CoolAlert.show(
        context: Get.context!,
        type: CoolAlertType.warning,
        text: text,
        autoCloseDuration: const Duration(seconds: 3),
        barrierDismissible: false);
  }

  errorAlert(text) {
    return CoolAlert.show(
        context: Get.context!,
        type: CoolAlertType.error,
        text: text,
        autoCloseDuration: const Duration(seconds: 3),
        barrierDismissible: false);
  }

  infoAlert(text) {
    return CoolAlert.show(
        context: Get.context!,
        type: CoolAlertType.info,
        text: text,
        autoCloseDuration: const Duration(seconds: 3),
        barrierDismissible: false);
  }

  confirmAlert(text) {
    return CoolAlert.show(
      context: Get.context!,
      type: CoolAlertType.confirm,
      text: text,
      confirmBtnText: AppString.alertYes,
      cancelBtnText: AppString.alertNo,
      confirmBtnColor: AppColors.alertBtnSucess,
    );
  }

  authTransparent() {
    return SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xff161d27),
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }

  transparent() {
    return SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: AppColors.bottomNaviBg,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }

  snackBar(head, content) {
    return SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: head,
        message: content,
        contentType: ContentType.failure,
      ),
    );
  }

  loadingProgressBar() {
    return SizedBox(
      width: 30,
      height: 30,
      child: CircularProgressIndicator(
        backgroundColor: Colors.grey,
        color: AppColors.primary,
      ),
    );
  }

  empty() {
    return Lottie.asset('assets/lottie/empty.json');
  }
}
