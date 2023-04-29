import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reallist/screens/my_checklist.dart';
import 'package:reallist/screens/my_team.dart';
import 'package:reallist/screens/overrider.dart';

import '../screens/dashboard.dart';
import '../screens/history.dart';
import '../screens/my_history.dart';
import '../screens/profile.dart';

class HomeController extends GetxController {
  var currentIndex = 0.obs;
  late PageController pageController;
  List screens = [Dashboard(), MyChecklist(),Override(),MyHistory(),MyTeam()].obs;

  @override
  void onInit() {
    pageController = PageController(initialPage: currentIndex.value);
    super.onInit();
  }

  void onItemTap(int index) {
    currentIndex.value = index;
    print("screens data ---------> $screens");
    print("bottom nav index position --------> $currentIndex");
  }

  void customizePage(key) {
    print("key check --------> $key");
    print(screens);
    if (screens.length > 2) {
      screens.removeLast();
    }
    print(screens);
    if (key == 'My Team') {
      screens.add(MyTeam());
      print(screens);
      onItemTap(1);
    } else if (key == 'My Checklist') {
      screens.add(MyChecklist());
      onItemTap(2);
    } else if (key == 'History') {
      screens.add(History());
      onItemTap(2);
    }
  }
}
