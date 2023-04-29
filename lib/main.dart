import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reallist/utils/routes_helper.dart';

import 'controllers/controller_binding.dart';

void main() async {
  //Get.lazyPut(() => CommonController());
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Get.key,
      initialBinding: ControllerBinding(),
      getPages: RouteHelper.routes,
      // initialRoute: GetStorage().read("gs_login_data") != null
      //     ? RouteHelper.home
      //     : RouteHelper.login,
      initialRoute: RouteHelper.splash,
    );
  }
}
