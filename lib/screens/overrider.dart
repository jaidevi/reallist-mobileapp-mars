import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:reallist/controllers/override_controller.dart';

import '../utils/app_colors.dart';
import '../utils/helper.dart';
import 'login.dart';

class Override extends StatelessWidget {
  final controller = Get.put(OverrideController());
  Override({super.key});

  @override
  Widget build(BuildContext context) {
    Helper().transparent();
    //controller.getOverRide();
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
                        "OVERRIDE HISTORY",
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
                        ? controller.overRideModel != null
                            ? ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemCount:
                                    controller.overRideModel!.data!.length,
                                itemBuilder: (context, index) {
                                  var data =
                                      controller.overRideModel!.data![index];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, left: 8.0, right: 8.0),
                                    child: InkWell(
                                      onTap: () => {
                                        //Get.to(HistoryView(), arguments: data.id)
                                        //Get.find<HistoryController>().viewHistory(data.id)
                                        controller.getEditOrView(
                                            data.id, "view")

                                      },
                                      child: Card(
                                        elevation: 5.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                            children: [
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Column(

                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            data.checklist!.title
                                                                .toString(),
                                                            style: const TextStyle(
                                                                fontWeight:
                                                                    FontWeight.w500,
                                                                overflow: TextOverflow
                                                                    .ellipsis),
                                                          ),
                                                        ],
                                                      ),

                                                      Padding(
                                                        padding: const EdgeInsets.fromLTRB(0,8.0,0,0),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text(
                                                              data.user!.name.toString(),
                                                              style: const TextStyle(
                                                                  fontSize: 12),
                                                            ),
                                                            Text(
                                                              data.user!.empId.toString(),
                                                              style: const TextStyle(
                                                                  fontSize: 12),
                                                            ),
                                                            Text(
                                                              Helper().convertTimestamp(
                                                                  data.updatedAt),
                                                              style: const TextStyle(
                                                                  fontSize: 12),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(width: 5),

                                                    ],
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 10),
                                              Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Column(
                                                        children: [
                                                          Row(
                                                           children: [
                                                             Text(
                                                               "${data.campus?.location!.name}_${data.campus?.building!.name}_${data.campus?.floor!.name}_${data.campus?.zone!.name}_${data.campus?.spot!.name}",
                                                               style: const TextStyle(
                                                                   fontSize: 12),
                                                             ),
                                                           ],
                                                          ),




                                                        ],


                                                      ),


                                                      const SizedBox(width: 10)
                                                    ],
                                                  ),
                                                ],
                                              ),
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
            )),
      ),
    );
  }

  alertDialog(data) {
    return showDialog<String>(
      context: Get.context!,
      builder: (BuildContext context) =>
          AlertDialog(
        content: const Text('Do you really want to edit this checklist ?'),
        actions: <Widget>[
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context, 'No'),
                  child: Card(
                    elevation: 1,
                    color: AppColors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: AppColors.sPrimary, width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0, top: 2.0, bottom: 2.0),
                      child: Text(
                        "No",
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => {
                    Navigator.pop(context, 'Yes'),
                    controller.getEditOrView(data.id, "edit")
                  },
                  child: Card(
                    elevation: 1,
                    color: AppColors.sPrimary,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: AppColors.sPrimary, width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0, top: 2.0, bottom: 2.0),
                      child: Text(
                        "Yes",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
