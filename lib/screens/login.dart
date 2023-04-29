import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import '../utils/app_colors.dart';
import '../utils/helper.dart';

class Login extends StatelessWidget {
  final authController = Get.put(AuthController());
  Login({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: AppColors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
    return Obx(
      () => Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(30.0),
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
                        child: SizedBox(
                          width: MediaQuery.of(Get.context!).size.width * 0.80,
                          child: Form(
                            key: authController.loginFormKey,
                            autovalidateMode: AutovalidateMode.always,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: Image.asset(
                                    "assets/logo.png",
                                    color: AppColors.primary,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller:
                                      authController.loginIdController.value,
                                  validator: (registerMobileController) {
                                    if (registerMobileController!.isEmpty) {
                                      return 'Emp ID required *';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: "Emp ID *",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      borderSide:
                                          BorderSide(color: AppColors.grey),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      borderSide:
                                          BorderSide(color: AppColors.grey),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      borderSide:
                                          BorderSide(color: AppColors.primary),
                                    ),
                                    prefixIcon: Icon(Icons.person,
                                        color: AppColors.black),
                                    labelStyle:
                                        TextStyle(color: AppColors.black),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                TextFormField(
                                  controller:
                                      authController.loginPassController.value,
                                  obscureText: authController.passObscure.value,
                                  validator: (loginIdController) {
                                    if (loginIdController!.isEmpty) {
                                      return 'Password Required';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: "Password",
                                    suffixIcon: authController
                                                .passObscure.value ==
                                            true
                                        ? IconButton(
                                            onPressed: () => {
                                              authController.passObscure.value =
                                                  !authController
                                                      .passObscure.value
                                            },
                                            icon: Icon(
                                              Icons.visibility_off,
                                              color: AppColors.black,
                                            ),
                                          )
                                        : IconButton(
                                            onPressed: () => {
                                              authController.passObscure.value =
                                                  !authController
                                                      .passObscure.value
                                            },
                                            icon: Icon(
                                              Icons.visibility,
                                              color: AppColors.primary,
                                            ),
                                          ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      borderSide:
                                          BorderSide(color: AppColors.grey),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      borderSide:
                                          BorderSide(color: AppColors.grey),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      borderSide:
                                          BorderSide(color: AppColors.primary),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.key,
                                      color: AppColors.black,
                                    ),
                                    labelStyle: TextStyle(
                                      color: AppColors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 24),
                                authController.isLoading.isFalse
                                    ? Container(
                                        height: 40,
                                        width: double.infinity,
                                        margin: const EdgeInsets.only(
                                            left: 60, right: 60),
                                        child: ElevatedButton(
                                          onPressed: () async {
                                            if (authController
                                                .loginFormKey.currentState!
                                                .validate()) {
                                              authController.login();
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                ..hideCurrentSnackBar()
                                                ..showSnackBar(
                                                  Helper().snackBar('On Snap!',
                                                      'please fill all the fields'),
                                                );
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: AppColors.primary,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                          child: Text(
                                            "Login",
                                            style: TextStyle(
                                              color: AppColors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      )
                                    : Helper().loadingProgressBar(),
                                const SizedBox(height: 24)
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: [
                                //     Text(
                                //       "copyrights @",
                                //       style: TextStyle(color: AppColors.black),
                                //     ),
                                //     TextButton(
                                //       onPressed: () {
                                //         //Get.offAllNamed(RouteHelper.auth);
                                //       },
                                //       child: Text(
                                //         "Real List",
                                //         style: TextStyle(
                                //           color: AppColors.primary,
                                //           fontWeight: FontWeight.bold,
                                //         ),
                                //       ),
                                //     ),
                                //   ],
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
