import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reallist/models/my_team_model.dart';

import '../services/remote_service.dart';
import '../utils/helper.dart';

class MyTeamController extends GetxController {
  MyTeamModel? myTeamModel;
  var isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    getMyTeam();
  }

  Future<void> pullRefresh() async {
    getMyTeam();
  }

  void getMyTeam() async {
    try {
      print("trye calling --------->");
      isLoading(true);
      var response = await RemoteService().getMyTeamService();
      print("----------------> $response");
      if (response != null) {
        var result = jsonDecode(response.body);
        if (result["success"] == true) {
          print("-----------> ${result}");
          myTeamModel = MyTeamModel.fromJson(result);
          update();
          isLoading(false);
        } else {
          myTeamModel = null;
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
}
