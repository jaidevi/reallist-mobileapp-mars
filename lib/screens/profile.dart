import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reallist/controllers/profile_controller.dart';
import 'package:reallist/utils/app_colors.dart';

import 'login.dart';

class Profile extends StatelessWidget {
  final controller = Get.put(ProfileController());
  Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        ClipPath(
          clipper: getClipper(),
          child: Container(color: AppColors.primary),
        ),
        Positioned(
          width: MediaQuery.of(context).size.width,
          top: MediaQuery.of(context).size.height / 10,
          child: Column(
            children: <Widget>[
              Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: const BoxDecoration(
                      color: Colors.red,
                      image: DecorationImage(
                          image: AssetImage('assets/profile.png'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.all(Radius.circular(75.0)),
                      boxShadow: [
                        BoxShadow(blurRadius: 7.0, color: Colors.black)
                      ])),
              const SizedBox(height: 20.0),
              Text(
                controller.loginModel!.data!.name.toString(),
                style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat'),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Role :',
                              style: TextStyle(
                                  fontSize: 17.0,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Montserrat'),
                            ),
                            Text(
                              controller.loginModel!.data!.role![0],
                              style: const TextStyle(
                                  fontSize: 17.0,
                                  fontStyle: FontStyle.italic,
                                  fontFamily: 'Montserrat'),
                            ),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Employee Id :',
                              style: TextStyle(
                                  fontSize: 17.0,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Montserrat'),
                            ),
                            Text(
                              controller.loginModel!.data!.code.toString(),
                              style: const TextStyle(
                                  fontSize: 17.0,
                                  fontStyle: FontStyle.italic,
                                  fontFamily: 'Montserrat'),
                            ),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Name :',
                              style: TextStyle(
                                  fontSize: 17.0,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Montserrat'),
                            ),
                            Text(
                              controller.loginModel!.data!.name.toString(),
                              style: const TextStyle(
                                  fontSize: 17.0,
                                  fontStyle: FontStyle.italic,
                                  fontFamily: 'Montserrat'),
                            ),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Date of join :',
                              style: TextStyle(
                                  fontSize: 17.0,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Montserrat'),
                            ),
                            Text(
                              controller.loginModel!.data!.doj.toString(),
                              style: const TextStyle(
                                  fontSize: 17.0,
                                  fontStyle: FontStyle.italic,
                                  fontFamily: 'Montserrat'),
                            ),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Phone No :',
                              style: TextStyle(
                                  fontSize: 17.0,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Montserrat'),
                            ),
                            Text(
                              controller.loginModel!.data!.phone.toString(),
                              style: const TextStyle(
                                  fontSize: 17.0,
                                  fontStyle: FontStyle.italic,
                                  fontFamily: 'Montserrat'),
                            ),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Department :',
                              style: TextStyle(
                                  fontSize: 17.0,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Montserrat'),
                            ),
                            Text(
                              controller.loginModel!.data!.department
                                  .toString(),
                              style: const TextStyle(
                                  fontSize: 17.0,
                                  fontStyle: FontStyle.italic,
                                  fontFamily: 'Montserrat'),
                            ),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Division :',
                              style: TextStyle(
                                  fontSize: 17.0,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Montserrat'),
                            ),
                            Text(
                              controller.loginModel!.data!.division.toString(),
                              style: const TextStyle(
                                  fontSize: 17.0,
                                  fontStyle: FontStyle.italic,
                                  fontFamily: 'Montserrat'),
                            ),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Location :',
                              style: TextStyle(
                                  fontSize: 17.0,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Montserrat'),
                            ),
                            Text(
                              controller.loginModel!.data!.location.toString(),
                              style: const TextStyle(
                                  fontSize: 17.0,
                                  fontStyle: FontStyle.italic,
                                  fontFamily: 'Montserrat'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25.0),
              InkWell(
                onTap: () => {
                  GetStorage().write("gs_login_data", null),
                  Get.offAll(Login())
                },
                child: SizedBox(
                  height: 35.0,
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Colors.redAccent,
                    color: Colors.red,
                    elevation: 7.0,
                    child: const Center(
                      child: Text(
                        'Log out',
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'Montserrat'),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}

class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 3.0);
    path.lineTo(size.width + 25, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
