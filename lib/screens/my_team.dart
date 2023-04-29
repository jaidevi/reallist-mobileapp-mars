import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';

import '../controllers/my_team_controller.dart';
import '../utils/app_colors.dart';
import '../utils/helper.dart';
import 'login.dart';

class MyTeam extends StatelessWidget {
  final controller = Get.put(MyTeamController());
  MyTeam({super.key});
  @override
  Widget build(BuildContext context)
  { Helper().transparent();
    //controller.getMyTeam();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        elevation: 1,
        backgroundColor: AppColors.bottomNaviBg,
        title: Column(
          children: [
            SizedBox(
              height: 60,
              width: 120,
              child: Image.asset(
                "assets/icons/logo.png",
                color: AppColors.primary,
              ),
            ),
          ],
        ),
        actions: [
          Image.asset(
            "assets/icons/setting.png",
            color: AppColors.primary,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () => {
                GetStorage().write("gs_login_data", null),
                Get.offAll(Login())
              },
              icon: Image.asset(
                "assets/icons/logout.png",
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: RefreshIndicator(
            onRefresh: () => controller.pullRefresh(),
            child: Column(
              children: [
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  color: AppColors.primary,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => Get.back(),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Image.asset(
                            "assets/icons/back.png",
                          ),
                        ),
                      ),
                      Text(
                        "MY TEAM",
                        style: TextStyle(
                            color: AppColors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Image.asset(
                          "assets/icons/back.png",
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Obx(() => controller.isLoading.isFalse
                        ? controller.myTeamModel != null
                            ? ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemCount: controller.myTeamModel!.data.length,
                                itemBuilder: (context, index) {
                                  var data =
                                      controller.myTeamModel!.data[index];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, left: 8.0, right: 8.0),
                                    child: InkWell(
                                      onTap: () => {},
                                      child: Card(
                                        elevation: 5.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(14.0),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      // Icon(
                                                      //   Icons.checklist,
                                                      //   color: AppColors.black,
                                                      // ),
                                                      Text(
                                                        "Team : ",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color: AppColors
                                                                .primary,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      ),
                                                      const SizedBox(width: 5),
                                                      Text(
                                                        "${data.location.name}_${data.department.name}_${data.division.name}",
                                                        style: TextStyle(
                                                            color:
                                                                AppColors.grey,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 10),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Role : ",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: AppColors.primary,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 5),
                                                  Text(
                                                    data.userRole,
                                                    style: TextStyle(color: AppColors.grey, fontWeight: FontWeight.w500),
                                                  )
                                                ],
                                              ),
                                              // const SizedBox(height: 5),
                                              // Row(
                                              //   children: [
                                              //     Icon(
                                              //       Icons.date_range,
                                              //       color: AppColors.black,
                                              //     ),
                                              //     const SizedBox(width: 5),
                                              //     Text(Helper()
                                              //         .convertTimestamp(data.updatedAt))
                                              //   ],
                                              // ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )
                            : Center(
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.70,
                                  height:
                                      MediaQuery.of(context).size.height * 0.70,
                                  child:
                                      Lottie.asset('assets/lottie/empty.json'),
                                ),
                              )
                        : Helper().loadingProgressBar()),
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}
