import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:reallist/controllers/incident_controller.dart';

import '../utils/app_colors.dart';

class Incident extends StatelessWidget {
  final controller = Get.put(IncidentController());
  Incident({super.key});

  @override
  Widget build(BuildContext context) {
    controller.screenInit(Get.arguments);
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: AppColors.primary,
          title: Text(
            "Incident List",
            style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          actions: [
            controller.widgetType.value == 0
                ? Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: IconButton(
                      onPressed: () => {controller.widgetType.value = 1},
                      icon: Icon(
                        Icons.add_circle_outline_rounded,
                        color: AppColors.white,
                      ),
                    ),
                  )
                : Container()
          ],
        ),
        body: controller.widgetType.value == 0
            ? controller.list.isEmpty
                ? Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: Lottie.asset('assets/lottie/empty.json'),
                    ),
                  )
                : Container()
            : controller.widgetType.value == 1
                ? addIncidentWidget()
                : Container(),
      ),
    );
  }

  addIncidentWidget() {
    return WillPopScope(
      onWillPop: () async {
        controller.widgetType.value = 0;
        return false;
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                cursorHeight: 20,
                keyboardType: TextInputType.text,
                controller: controller.title.value,
                validator: (title) {
                  if (title!.isEmpty) {
                    return 'Title *';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Title *",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: AppColors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: AppColors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: AppColors.primary),
                  ),
                  prefixIcon: Icon(Icons.title, color: AppColors.black),
                  labelStyle: TextStyle(color: AppColors.black),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: controller.description.value,
                validator: (description) {
                  if (description!.isEmpty) {
                    return 'Description *';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Description *",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: AppColors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: AppColors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: AppColors.primary),
                  ),
                  prefixIcon:
                      Icon(Icons.document_scanner, color: AppColors.black),
                  labelStyle: TextStyle(color: AppColors.black),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: MediaQuery.of(Get.context!).size.width,
                child: ElevatedButton.icon(
                  icon: Icon(
                    Icons.camera_alt,
                    color: AppColors.primary,
                  ),
                  onPressed: () async {
                    Get.to(Incident());
                  },
                  label: Text(
                    "Capture",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 2,
                    backgroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: AppColors.primary, width: 1.5),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(Get.context!).size.width * 0.50,
                child: ElevatedButton(
                  onPressed: () async {
                    //Get.to(const QrScan());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Text(
                    "submit",
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
