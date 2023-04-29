import 'package:get/get.dart';
import 'package:reallist/screens/splash.dart';

import '../screens/home.dart';
import '../screens/login.dart';

class RouteHelper {
  static const String splash = '/';
  static const String home = '/home';
  static const String login = '/login';

  static List<GetPage> routes = [
    GetPage(name: splash, page: () => Splash()),
    GetPage(name: login, page: () => Login()),
    GetPage(name: home, page: () => Home())
  ];
}
