import 'package:get/get.dart';
import 'package:reallist/controllers/auth_controller.dart';
import 'package:reallist/controllers/history_controller.dart';
import 'package:reallist/controllers/home_controller.dart';

class ControllerBinding implements Bindings {
// default dependency
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<AuthController>(() => AuthController(), fenix: true);
    Get.lazyPut<HistoryController>(() => HistoryController(), fenix: true);
  }
}
