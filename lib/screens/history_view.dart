import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reallist/controllers/history_controller.dart';

import '../utils/app_colors.dart';
import '../utils/helper.dart';

class HistoryView extends StatelessWidget {
  final controller = Get.put(HistoryController());
  HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.viewHistory(Get.arguments);
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: AppColors.bottomNaviBg,
        title: Text(
          "View History",
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: GetBuilder(
            init: controller,
            builder: (_) => controller.isViewLoading.isFalse
                ? Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
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
                              children: [
                                const Icon(Icons.calendar_month),
                                const SizedBox(width: 5),
                                Text(controller.historyViewModel!.title)
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.location_on),
                                const SizedBox(width: 5),
                                Text(controller.historyViewModel!.title)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : Helper().loadingProgressBar(),
          ),
        ),
      ),
    );
  }
}
