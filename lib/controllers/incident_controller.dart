import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IncidentController extends GetxController {
  var widgetType = 0.obs;
  var list = [].obs;

  final title = TextEditingController().obs;
  final description = TextEditingController().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  screenInit(argument) {
    widgetType.value = argument;
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
