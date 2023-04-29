import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:lottie/lottie.dart';
import 'package:reallist/screens/login.dart';
import 'package:reallist/screens/my_checklist.dart';
import 'package:reallist/screens/my_history.dart';
import 'package:reallist/screens/my_team.dart';
import 'package:reallist/screens/overrider.dart';
import 'package:reallist/screens/profile.dart';
import 'package:reallist/utils/app_string.dart';
import 'package:reallist/utils/helper.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../controllers/dashboard_controller.dart';
import '../utils/app_colors.dart';

class Dashboard extends StatelessWidget {
  final controller = Get.put(DashboardController());
  Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    Helper().transparent();
    return Scaffold(
      backgroundColor: AppColors.white,
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
          IconButton(onPressed: (){
           // Get.offAll(const Notification());
          }, icon: Image.asset(
            "assets/icons/notification.png",
            color: AppColors.primary,
          )),
          IconButton(onPressed: (){
            Get.offAll(Profile());
          }, icon: Image.asset(
            "assets/icons/Paths.png",
            color: AppColors.primary,
          )),

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
                )),
          ),
        ],
      ),
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text(AppString.leaveMsg),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 14.0, right: 14.0, top: 14.0, bottom: 14.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      controller.loginModel!.data!.name == ''
                          ? AppString.alterCompayName
                          : "Hello ${controller.loginModel!.data!.name}",
                      style: TextStyle(
                        color: AppColors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Card(
                //   elevation: 1,
                //   color: AppColors.sPrimary,
                //   shape: RoundedRectangleBorder(
                //     side: BorderSide(color: AppColors.sPrimary, width: 1),
                //     borderRadius: BorderRadius.circular(5),
                //   ),
                //   child: Padding(
                //     padding: const EdgeInsets.only(
                //         left: 8.0, right: 8.0, top: 2.0, bottom: 2.0),
                //     child: Text(
                //       "",
                //       style: TextStyle(
                //         color: AppColors.white,
                //         fontSize: 14,
                //         fontWeight: FontWeight.w500,
                //       ),
                //     ),
                //   ),
                // ),
                InkWell(
                  onTap: () async {
                    controller.scanQR();
                  },
                  child: SizedBox(
                    height: 250,
                    width: 250,
                    child: Lottie.asset('assets/lottie/qr_scan.json'),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 10,
                  width: MediaQuery.of(context).size.width,
                  child: GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4, crossAxisSpacing: 10),
                    children: [
                      // InkWell(
                      //   onTap: () => {Get.to(MyTeam())},
                      //   child: Card(
                      //     elevation: 1.0,
                      //     color: AppColors.sPrimary,
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(16.0),
                      //     ),
                      //     child: Column(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         Image.asset(
                      //           "assets/icons/people.png",
                      //         ),
                      //         const SizedBox(height: 5),
                      //         const Text("My Team",
                      //             style: TextStyle(
                      //                 fontSize: 12, color: Colors.white),
                      //             textAlign: TextAlign.center)
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // InkWell(
                      //   onTap: () => {Get.to(MyChecklist())},
                      //   child: Card(
                      //     elevation: 5.0,
                      //     color: AppColors.sPrimary,
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(16.0),
                      //     ),
                      //     child: Column(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         Image.asset(
                      //           "assets/icons/checklist.png",
                      //         ),
                      //         const SizedBox(height: 5),
                      //         const Text("My Checklist",
                      //             style: TextStyle(
                      //                 fontSize: 12, color: Colors.white),
                      //             textAlign: TextAlign.center)
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // InkWell(
                      //   onTap: () => {Get.to(MyHistory())},
                      //   child: Card(
                      //     elevation: 1.0,
                      //     color: AppColors.sPrimary,
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(16.0),
                      //     ),
                      //     child: Column(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         SizedBox(
                      //           height: 40,
                      //           width: 40,
                      //           child: Image.asset(
                      //             "assets/icons/histor.png",
                      //             color: AppColors.white,
                      //           ),
                      //         ),
                      //         const SizedBox(height: 5),
                      //         const Text("History",
                      //             style: TextStyle(
                      //                 fontSize: 12, color: Colors.white),
                      //             textAlign: TextAlign.center)
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // InkWell(
                      //   onTap: () => {Get.to(Override())},
                      //   child: Card(
                      //     elevation: 1.0,
                      //     color: AppColors.sPrimary,
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(16.0),
                      //     ),
                      //     child: Column(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         Image.asset(
                      //           "assets/icons/doc.png",
                      //         ),
                      //         const SizedBox(height: 5),
                      //         const Text("Override",
                      //             style: TextStyle(
                      //                 fontSize: 12, color: Colors.white),
                      //             textAlign: TextAlign.center)
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(child:
                        Card(
                          elevation: 5.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child:Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Column(
                              children: [
                                Text(
                                  'My Dashboard',
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                SizedBox(
                                  height: 200,
                                  width: 200,
                                  child: LiquidCircularProgressIndicator(
                                    value: 0.55, // Defaults to 0.5.
                                    valueColor: const AlwaysStoppedAnimation(Color(0xffb7ebb48)), // Defaults to the current Theme's accentColor.
                                    backgroundColor: Color(0xffbfce8e9),
                                    borderColor: Colors.brown[100],
                                    borderWidth: 5.0,
                                    direction: Axis.vertical,
                                    center: const Text(
                                      "55 %",
                                      style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromARGB(250, 100, 153, 57),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(8.0,5.0,0,0),
                                  child: Text(
                                    "keep working on it!you've achieved 55% today.",
                                    style: TextStyle(
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            ),
                          ),
                         ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child:
                              Card(
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: GetBuilder(
                                  init: controller,
                                  builder: (_) => SizedBox(
                                    height:310 ,
                                    width: MediaQuery.of(context).size.width,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GridView(
                                        gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 8,
                                          childAspectRatio: MediaQuery.of(context)
                                              .size
                                              .width /
                                              (MediaQuery.of(context).size.height / 3.5),
                                        ),
                                        children: [
                                          Card(
                                            elevation: 1.0,
                                            color: Color(0xffb69c6e6),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10.0),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Total",
                                                    style: TextStyle(
                                                        color: AppColors.white,
                                                        fontWeight: FontWeight.w400),
                                                  ),
                                                  Divider(color: AppColors.white),
                                                  IntrinsicHeight(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        Column(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.center,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                const Icon(
                                                                    Icons
                                                                        .document_scanner,
                                                                    size: 10,
                                                                    color: Colors.white),
                                                                const SizedBox(width: 2),
                                                                Text(
                                                                  "Checklist",
                                                                  style: TextStyle(
                                                                    color:
                                                                    AppColors.white,
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            const SizedBox(height: 5),
                                                            Text(
                                                              "${controller.dashboardDataModel?.data.totalChecklist}",
                                                              style: TextStyle(
                                                                color: AppColors.white,
                                                                fontSize: 18,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        VerticalDivider(
                                                            color: AppColors.white),
                                                        Column(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.center,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                const Icon(
                                                                  Icons.people,
                                                                  size: 10,
                                                                  color: Colors.white,
                                                                ),
                                                                const SizedBox(width: 2),
                                                                Text(
                                                                  "Spot",
                                                                  style: TextStyle(
                                                                    color:
                                                                    AppColors.white,
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            const SizedBox(height: 5),
                                                            Text(
                                                              "${controller.dashboardDataModel?.data.totalSpot}",
                                                              style: TextStyle(
                                                                  color: AppColors.white,
                                                                  fontSize: 18),
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Card(
                                            elevation: 1.0,
                                            color: Color(0xffbfed796),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10.0),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Assigned",
                                                    style: TextStyle(
                                                        color: AppColors.white,
                                                        fontWeight: FontWeight.w400),
                                                  ),
                                                  Divider(color: AppColors.white),
                                                  IntrinsicHeight(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        Column(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.center,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                const Icon(
                                                                    Icons
                                                                        .document_scanner,
                                                                    size: 10,
                                                                    color: Colors.white),
                                                                const SizedBox(width: 2),
                                                                Text(
                                                                  "checklist",
                                                                  style: TextStyle(
                                                                    color:
                                                                    AppColors.white,
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            const SizedBox(height: 5),
                                                            Text(
                                                              "${controller.dashboardDataModel?.data.assignedChecklist}",
                                                              style: TextStyle(
                                                                color: AppColors.white,
                                                                fontSize: 18,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        VerticalDivider(
                                                            color: AppColors.white),
                                                        Column(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.center,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                const Icon(
                                                                  Icons.place,
                                                                  size: 10,
                                                                  color: Colors.white,
                                                                ),
                                                                const SizedBox(width: 2),
                                                                Text(
                                                                  "Spot",
                                                                  style: TextStyle(
                                                                    color:
                                                                    AppColors.white,
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            const SizedBox(height: 5),
                                                            Text(
                                                              "${controller.dashboardDataModel?.data.assignedSpot}",
                                                              style: TextStyle(
                                                                  color: AppColors.white,
                                                                  fontSize: 18),
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Card(
                                            elevation: 1.0,
                                            color: Color(0xffbc4eca0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10.0),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Completed",
                                                    style: TextStyle(
                                                        color: AppColors.white,
                                                        fontWeight: FontWeight.w400),
                                                  ),
                                                  Divider(color: AppColors.white),
                                                  IntrinsicHeight(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        Column(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.center,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                const Icon(Icons.people,
                                                                    size: 10,
                                                                    color: Colors.white),
                                                                const SizedBox(width: 2),
                                                                Text(
                                                                  "Checklist",
                                                                  style: TextStyle(
                                                                    color:
                                                                    AppColors.white,
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            const SizedBox(height: 5),
                                                            Text(
                                                              "${controller.dashboardDataModel?.data.completedChecklist}",
                                                              style: TextStyle(
                                                                color: AppColors.white,
                                                                fontSize: 18,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        VerticalDivider(
                                                            color: AppColors.white),
                                                        Column(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.center,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                const Icon(
                                                                  Icons.place,
                                                                  size: 10,
                                                                  color: Colors.white,
                                                                ),
                                                                const SizedBox(width: 2),
                                                                Text(
                                                                  "Spot",
                                                                  style: TextStyle(
                                                                    color:
                                                                    AppColors.white,
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            const SizedBox(height: 5),
                                                            Text(
                                                              "5",
                                                              style: TextStyle(
                                                                  color: AppColors.white,
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                  FontWeight.w400),
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Card(
                                            elevation: 1.0,
                                            color: Color(0xffbffb7ba),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10.0),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Pending",
                                                    style: TextStyle(
                                                        color: AppColors.white,
                                                        fontWeight: FontWeight.w400),
                                                  ),
                                                  Divider(color: AppColors.white),
                                                  IntrinsicHeight(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        Column(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.center,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                const Icon(
                                                                    Icons
                                                                        .document_scanner,
                                                                    size: 10,
                                                                    color: Colors.white),
                                                                const SizedBox(width: 2),
                                                                Text(
                                                                  "Checklist",
                                                                  style: TextStyle(
                                                                    color:
                                                                    AppColors.white,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(height: 5),
                                                            Text(
                                                              "${controller.dashboardDataModel?.data.pendingChecklist}",
                                                              style: TextStyle(
                                                                color: AppColors.white,
                                                                fontSize: 18,
                                                                fontWeight:
                                                                FontWeight.w500,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        VerticalDivider(
                                                            color: AppColors.white),
                                                        Column(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.center,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                const Icon(
                                                                  Icons.place,
                                                                  size: 10,
                                                                  color: Colors.white,
                                                                ),
                                                                const SizedBox(width: 2),
                                                                Text(
                                                                  "Spot",
                                                                  style: TextStyle(
                                                                    color:
                                                                    AppColors.white,
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            const SizedBox(height: 5),
                                                            Text(
                                                              '2',
                                                              style: TextStyle(
                                                                color: AppColors.white,
                                                                fontSize: 18,
                                                                fontWeight:
                                                                FontWeight.w500,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Card(
                                            elevation: 1.0,
                                            color: Color(0xffbdbb3fe),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10.0),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Upcoming",
                                                    style: TextStyle(
                                                        color: AppColors.white,
                                                        fontWeight: FontWeight.w400),
                                                  ),
                                                  Divider(color: AppColors.white),
                                                  IntrinsicHeight(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        Column(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.center,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                const Icon(
                                                                    Icons
                                                                        .document_scanner,
                                                                    size: 10,
                                                                    color: Colors.white),
                                                                const SizedBox(width: 2),
                                                                Text(
                                                                  "checklist",
                                                                  style: TextStyle(
                                                                    color:
                                                                    AppColors.white,
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            const SizedBox(height: 5),
                                                            Text(
                                                              "${controller.dashboardDataModel?.data.upcomingChecklist}",
                                                              style: TextStyle(
                                                                color: AppColors.white,
                                                                fontSize: 18,
                                                                fontWeight:
                                                                FontWeight.w500,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        VerticalDivider(
                                                            color: AppColors.white),
                                                        Column(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.center,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                const Icon(
                                                                  Icons.place,
                                                                  size: 10,
                                                                  color: Colors.white,
                                                                ),
                                                                const SizedBox(width: 2),
                                                                Text(
                                                                  "Spot",
                                                                  style: TextStyle(
                                                                    color:
                                                                    AppColors.white,
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            const SizedBox(height: 5),
                                                            Text(
                                                              "${controller.dashboardDataModel?.data.upcomingSpot}",
                                                              style: TextStyle(
                                                                color: AppColors.white,
                                                                fontSize: 18,
                                                                fontWeight:
                                                                FontWeight.w500,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),

                    const SizedBox(height: 10),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [


                      ],
                    ),
                    // SizedBox(
                    //   width: MediaQuery.of(context).size.width,
                    //   child: Card(
                    //     color: AppColors.white,
                    //     elevation: 5.0,
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(5.0),
                    //     ),
                    //     child: Padding(
                    //         padding: const EdgeInsets.only(
                    //             left: 18.0,
                    //             right: 18.0,
                    //             top: 14.0,
                    //             bottom: 14.0),
                    //         child: SizedBox(
                    //           height: 300,
                    //           child: ListView(
                    //             physics: const BouncingScrollPhysics(),
                    //             scrollDirection: Axis.horizontal,
                    //             children: [
                    //               chart(),
                    //               lineChart(),
                    //               const SizedBox(width: 10)
                    //             ],
                    //           ),
                    //         )),
                    //   ),
                    // ),
                    // const SizedBox(height: 5),
                    // SizedBox(
                    //   width: MediaQuery.of(context).size.width,
                    //   child: Card(
                    //     color: AppColors.white,
                    //     elevation: 5.0,
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(5.0),
                    //     ),
                    //     child: Padding(
                    //       padding: const EdgeInsets.only(
                    //           left: 18.0,
                    //           right: 18.0,
                    //           top: 14.0,
                    //           bottom: 14.0),
                    //       child: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           Row(
                    //             mainAxisAlignment:
                    //                 MainAxisAlignment.spaceBetween,
                    //             crossAxisAlignment:
                    //                 CrossAxisAlignment.start,
                    //             children: [
                    //               Row(
                    //                 mainAxisAlignment:
                    //                     MainAxisAlignment.start,
                    //                 children: [
                    //                   Icon(
                    //                     Icons.check_circle,
                    //                     color: AppColors.blue,
                    //                   ),
                    //                   const SizedBox(width: 5),
                    //                   const Text(
                    //                     "Total Checklist",
                    //                     style: TextStyle(
                    //                         fontSize: 16,
                    //                         fontWeight: FontWeight.w500),
                    //                   ),
                    //                 ],
                    //               ),
                    //               Row(
                    //                 mainAxisAlignment:
                    //                     MainAxisAlignment.end,
                    //                 children: const [
                    //                   Text(
                    //                     "3",
                    //                     style: TextStyle(
                    //                         fontSize: 16,
                    //                         fontWeight: FontWeight.w500),
                    //                   ),
                    //                   SizedBox(width: 10),
                    //                   Icon(Icons.arrow_forward_ios)
                    //                 ],
                    //               )
                    //             ],
                    //           ),
                    //           const SizedBox(height: 10),
                    //           Row(
                    //             mainAxisAlignment:
                    //                 MainAxisAlignment.spaceBetween,
                    //             crossAxisAlignment:
                    //                 CrossAxisAlignment.start,
                    //             children: [
                    //               Row(
                    //                 mainAxisAlignment:
                    //                     MainAxisAlignment.start,
                    //                 children: [
                    //                   Icon(
                    //                     Icons.remove_circle,
                    //                     color: AppColors.red,
                    //                   ),
                    //                   const SizedBox(width: 5),
                    //                   const Text(
                    //                     "Pending Checklist",
                    //                     style: TextStyle(
                    //                         fontSize: 16,
                    //                         fontWeight: FontWeight.w500),
                    //                   ),
                    //                 ],
                    //               ),
                    //               Row(
                    //                 mainAxisAlignment:
                    //                     MainAxisAlignment.end,
                    //                 children: const [
                    //                   Text(
                    //                     "4",
                    //                     style: TextStyle(
                    //                         fontSize: 16,
                    //                         fontWeight: FontWeight.w500),
                    //                   ),
                    //                   SizedBox(width: 10),
                    //                   Icon(Icons.arrow_forward_ios)
                    //                 ],
                    //               ),
                    //             ],
                    //           ),
                    //           const SizedBox(height: 10),
                    //           Row(
                    //             mainAxisAlignment:
                    //                 MainAxisAlignment.spaceBetween,
                    //             crossAxisAlignment:
                    //                 CrossAxisAlignment.start,
                    //             children: [
                    //               Row(
                    //                 children: [
                    //                   Icon(
                    //                     Icons.check_circle,
                    //                     color: AppColors.green,
                    //                   ),
                    //                   const SizedBox(width: 5),
                    //                   const Text(
                    //                     "Completed Checklist",
                    //                     style: TextStyle(
                    //                         fontSize: 16,
                    //                         fontWeight: FontWeight.w500),
                    //                   ),
                    //                 ],
                    //               ),
                    //               Row(
                    //                 mainAxisAlignment:
                    //                     MainAxisAlignment.end,
                    //                 children: const [
                    //                   Text(
                    //                     "1",
                    //                     style: TextStyle(
                    //                         fontSize: 16,
                    //                         fontWeight: FontWeight.w500),
                    //                   ),
                    //                   SizedBox(width: 34),
                    //                 ],
                    //               ),
                    //             ],
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // Column(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     SizedBox(
                    //       width: MediaQuery.of(context).size.width,
                    //       child: ElevatedButton(
                    //         onPressed: () async {
                    //           controller.scanQR();
                    //         },
                    //         style: ElevatedButton.styleFrom(
                    //           backgroundColor: AppColors.primary,
                    //           shape: RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(5),
                    //           ),
                    //         ),
                    //         child: Text(
                    //           AppString.scanAndCollectChecklist,
                    //           style: TextStyle(
                    //             color: AppColors.white,
                    //             fontWeight: FontWeight.w700,
                    //             fontSize: 18,
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //     SizedBox(
                    //       width: MediaQuery.of(context).size.width,
                    //       child: ElevatedButton(
                    //         onPressed: () async {
                    //           Get.to(Incident(), arguments: 0);
                    //         },
                    //         style: ElevatedButton.styleFrom(
                    //           backgroundColor: AppColors.white,
                    //           shape: RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(5),
                    //             side: BorderSide(
                    //                 color: AppColors.primary, width: 1.0),
                    //           ),
                    //         ),
                    //         child: Text(
                    //           AppString.reportIncident,
                    //           style: TextStyle(
                    //             color: AppColors.primary,
                    //             fontWeight: FontWeight.w700,
                    //             fontSize: 18,
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  chart() {
    return SfCircularChart(
      title: ChartTitle(text: 'Checklist Daily Activities'),
      legend:
          Legend(isVisible: false, overflowMode: LegendItemOverflowMode.wrap),
      series: controller.getDefaultDoughnutSeries(),
      tooltipBehavior: controller.tooltip,
    );
  }

  lineChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: 'Weekly Checklist Activities'),
      legend:
          Legend(isVisible: false, overflowMode: LegendItemOverflowMode.wrap),
      primaryXAxis: NumericAxis(
          edgeLabelPlacement: EdgeLabelPlacement.shift,
          majorGridLines: const MajorGridLines(width: 0),
          interval: 2),
      primaryYAxis: NumericAxis(
          minimum: 3,
          maximum: 21,
          interval: 3,
          labelFormat: '{value}%',
          axisLine: const AxisLine(width: 0),
          majorTickLines: const MajorTickLines(color: Colors.transparent)),
      series: controller.getDashedLineSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }
}
