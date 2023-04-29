import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reallist/models/login_model.dart';

class ProfileController extends GetxController {
  LoginModel? loginModel;
  @override
  void onInit() {
    super.onInit();
    getLoginData();
  }

  void getLoginData() {
    try {
      if (GetStorage().read("gs_login_data") != null) {
        loginModel = LoginModel.fromJson(GetStorage().read("gs_login_data"));
      }
    } catch (e) {
      print(e);
    }
  }
}
