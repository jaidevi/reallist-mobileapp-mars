import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:reallist/controllers/history_controller.dart';
import 'package:reallist/utils/app_colors.dart';

import '../utils/helper.dart';

class History extends StatelessWidget {
  final controller = Get.put(HistoryController());
  History({super.key});

  @override
  Widget build(BuildContext context) {
    Helper().transparent();
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: AppColors.bottomNaviBg,
        title: Text(
          "Checklist History",
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => controller.pullRefresh(),
          child: Center(
            child: Obx(() => controller.isLoading.isFalse
                ? controller.historyModel != null
                    ? ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: controller.historyModel!.data!.length,
                        itemBuilder: (context, index) {
                          var data = controller.historyModel!.data![index];
                          return Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, left: 8.0, right: 8.0),
                            child: InkWell(
                              onTap: () => {
                                //Get.to(HistoryView(), arguments: data.id)
                                controller.viewHistory(data.id)
                              },
                              child: Card(
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.checklist,
                                                color: AppColors.black,
                                              ),
                                              const SizedBox(width: 5),
                                              Text(
                                                data.checklist!.title
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            ],
                                          ),
                                          Wrap(
                                            spacing: 12,
                                            children: <Widget>[
                                              Obx(
                                                () => Visibility(
                                                  visible: controller
                                                      .listEditBtn.value,
                                                  child: InkWell(
                                                    onTap: () => {
                                                      controller.getEditOrView(
                                                          data.id, "edit")
                                                    },
                                                    child:
                                                        const Icon(Icons.edit),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.date_range,
                                            color: AppColors.black,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(Helper()
                                              .convertTimestamp(data.updatedAt))
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
                          width: MediaQuery.of(context).size.width * 0.70,
                          height: MediaQuery.of(context).size.height * 0.70,
                          child: Lottie.asset('assets/lottie/empty.json'),
                        ),
                      )
                : Helper().loadingProgressBar()),
          ),
        ),
      ),
    );
  }
}
