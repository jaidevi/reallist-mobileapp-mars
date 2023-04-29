import 'package:get/get.dart';

import 'permission_controller.dart';

class MyBinding implements Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => LocationController());
    Get.lazyPut(() => PermissionController());
    // Get.lazyPut(() => DashboardController());
    // Get.lazyPut(() => HomeController());
  }
}
