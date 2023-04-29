import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:reallist/controllers/my_checklist_controller.dart';
import 'package:reallist/models/check_list_model.dart';
import 'package:reallist/screens/spotscreen.dart';

import '../utils/app_colors.dart';
import '../utils/helper.dart';
import 'history_view.dart';
import 'login.dart';

class MyChecklist extends StatelessWidget {
  final controller = Get.put(MyChecklistController());
  MyChecklist({super.key});


  @override
  Widget build(BuildContext context) {
    Helper().transparent();
    //controller.getMyChecklist();
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
                "assets/logo.png",
                color: AppColors.primary,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.settings,
              color: AppColors.primary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () => {
                GetStorage().write("gs_login_data", null),
                Get.offAll(Login())
              },
              icon: Icon(
                Icons.logout,
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
                      "MY CHECKLIST",
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
                      ? controller.myChecklistModel != null
                          ? ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount:
                                  controller.myChecklistModel!.data.data.length,
                              itemBuilder: (context, index) {
                                var data = controller
                                    .myChecklistModel!.data.data[index];

                                return Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, left: 8.0, right: 8.0),
                                  child: InkWell(
                                    onTap: () => {
                                      //Get.to(HistoryView(), arguments: data.id),
                                     // controller.viewHistory(data.id)
                                    Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                    builder: (context) => Spotscreen(),
                                    // Pass the arguments as part of the RouteSettings. The
                                    // DetailScreen reads the arguments from these settings.
                                    // settings: RouteSettings(
                                    // arguments: todos[index],
                                    // ),
                                    ),
                                    )
                                    },
                                    child: Card(
                                      elevation: 5.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
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
                                                    // const SizedBox(width: 5),
                                                    Text(
                                                      data.title,
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    )
                                                  ],
                                                ),
                                                // Wrap(
                                                //   spacing: 12,
                                                //   children: <Widget>[
                                                //     Obx(
                                                //       () => Visibility(
                                                //         visible: controller
                                                //             .listEditBtn.value,
                                                //         child: InkWell(
                                                //           onTap: () => {
                                                //             controller.getEditOrView(
                                                //                 data.id, "edit")
                                                //           },
                                                //           child:
                                                //               const Icon(Icons.edit),
                                                //         ),
                                                //       ),
                                                //     ),
                                                //   ],
                                                // ),
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
                                width: MediaQuery.of(context).size.width * 0.70,
                                height:
                                    MediaQuery.of(context).size.height * 0.70,
                                child: Lottie.asset('assets/lottie/empty.json'),
                              ),
                            )
                      : Helper().loadingProgressBar()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
