import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:reallist/controllers/history_controller.dart';
import 'package:reallist/controllers/my_history_controller.dart';
import 'package:reallist/controllers/qr_result_controller.dart';

import '../utils/app_colors.dart';
import '../utils/helper.dart';

class QrResult extends StatelessWidget {
  final controller = Get.put(QrResultController());
  QrResult({super.key});

  @override
  Widget build(BuildContext context) {
    controller.receiveData(Get.arguments);
    //controller.getCheckListForm();
    return controller.isItAssessor.isTrue ? assessor() : others();
  }

  assessor() {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 2,
        backgroundColor: AppColors.primary,
        title: const Text("Real List Form"),
      ),
      body: Center(
        child: Obx(
          () => controller.isLoading.isFalse
              ? controller.checkListModel != null
                  ? ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: controller.checkListModel!.data!.length,
                      itemBuilder: (context, index) {
                        var arrData = controller.checkListModel!.data![index];
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 8.0, right: 8.0),
                          child: InkWell(
                            onTap: () => {
                              print(
                                  "form id ----------> ${arrData.checklist!.id}"),
                              controller.getFormBrow(arrData.checklist!.id)
                            },
                            child: Card(
                              elevation: 5.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: ListTile(
                                leading: const Icon(
                                    Icons.medical_information_outlined),
                                title: Text(
                                  "${arrData.checklist!.title}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: SizedBox(
                      height: MediaQuery.of(Get.context!).size.height * 0.70,
                      width: MediaQuery.of(Get.context!).size.width * 0.70,
                      child: Lottie.asset("assets/lottie/empty.json"),
                    ))
              : Helper().loadingProgressBar(),
        ),
      ),
    );
  }

  others() {
    return DefaultTabController(
      length: controller.isItAssessor.isTrue ? 2 : 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 2,
          backgroundColor: AppColors.primary,
          bottom: TabBar(
            physics: const NeverScrollableScrollPhysics(),
            indicatorWeight: 0.1,
            tabs: [
              const Tab(
                text: 'Checklist',
              ),
              Visibility(
                visible: controller.isItAssessor.isTrue ? false : true,
                child: const Tab(
                  text: 'History',
                ),
              ),
              const Tab(
                text: 'My History',
              ),
            ],
          ),
          title: const Text('Real List Form'),
        ),
        body: TabBarView(
          children: [formScreen(), history(), myHistory()],
        ),
      ),
    );
  }

  getFormDynamic(widgetName) {
    print("-------------> widget name ------> $widgetName");
    if (widgetName["type"] == 'radio-group') {
      return ListView.builder(
        itemCount: widgetName["values"].length,
        itemBuilder: (context, index) {
          var extData = widgetName["values"][index];
          print("-----------> ${extData}");
          var check = false;
          return GetBuilder(
            init: controller,
            builder: (_) => CheckboxListTile(
              value: check,
              onChanged: (bool? value) {
                print("before change value -----> $check");
                check = value!;
                print("after change value -------> $check");
                controller.update();
              },
              title: Text(extData["label"]),
            ),
          );
        },
      );
    }
  }

  formScreen() {
    return Center(
      child: Obx(
        () => controller.isLoading.isFalse
            ? controller.checkListModel != null
                ? ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.checkListModel!.data!.length,
                    itemBuilder: (context, index) {
                      var arrData = controller.checkListModel!.data![index];
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 8.0, right: 8.0),
                        child: InkWell(
                          onTap: () => {
                            print(
                                "form id ----------> ${arrData.checklist!.id}"),
                            controller.getFormBrow(arrData.checklist!.id)
                          },
                          child: Card(
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: ListTile(
                              leading: const Icon(
                                  Icons.medical_information_outlined),
                              title: Text(
                                "${arrData.checklist!.title}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : Center(
                    child: SizedBox(
                    height: MediaQuery.of(Get.context!).size.height * 0.70,
                    width: MediaQuery.of(Get.context!).size.width * 0.70,
                    child: Lottie.asset("assets/lottie/empty.json"),
                  ))
            : Helper().loadingProgressBar(),
      ),
    );
  }

  history() {
    return RefreshIndicator(
      onRefresh: () async {
        controller.pullRefresh();
      },
      child: Center(
        child: Obx(() => Get.find<MyHistroyController>().isLoading.isFalse
            ? Get.find<MyHistroyController>().myHistoryModel != null
                ? ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.checkListModel!.history!.length,
                    itemBuilder: (context, index) {
                      var data = controller.checkListModel!.history![index];
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 8.0, right: 8.0),
                        child: InkWell(
                          onTap: () => {
                            Get.find<HistoryController>().viewHistory(data.id)
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
                                      Text(
                                        data.checklist!.title.toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                      DropdownButtonHideUnderline(
                                        child: DropdownButton2(
                                          customButton: Icon(
                                            Icons.more_vert,
                                            color: AppColors.primary,
                                          ),
                                          items: [
                                            ...MenuItems.firstItems.map(
                                              (item) =>
                                                  DropdownMenuItem<MenuItem>(
                                                value: item,
                                                child:
                                                    MenuItems.buildItem(item),
                                              ),
                                            ),
                                          ],
                                          onChanged: (value) {
                                            onChanged(context,
                                                value as MenuItem, data);
                                          },
                                          dropdownStyleData: DropdownStyleData(
                                            width: 160,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 6),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              color: AppColors.white,
                                            ),
                                            elevation: 8,
                                            offset: const Offset(0, 8),
                                          ),
                                          menuItemStyleData: MenuItemStyleData(
                                            customHeights: [
                                              ...List<double>.filled(
                                                  MenuItems.firstItems.length,
                                                  48),
                                            ],
                                            padding: const EdgeInsets.only(
                                                left: 16, right: 16),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "${data.campus?.location!.name}_${data.campus?.building!.name}_${data.campus?.floor!.name}_${data.campus?.zone!.name}_${data.campus?.spot!.name}",
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                      const SizedBox(width: 5),
                                      Expanded(
                                        child: Text(
                                            Helper().convertTimestamp(
                                                data.updatedAt),
                                            overflow: TextOverflow.ellipsis,
                                            style:
                                                const TextStyle(fontSize: 12)),
                                      )
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
                      width: MediaQuery.of(Get.context!).size.width * 0.70,
                      height: MediaQuery.of(Get.context!).size.height * 0.70,
                      child: Lottie.asset('assets/lottie/empty.json'),
                    ),
                  )
            : Helper().loadingProgressBar()),
      ),
    );
  }

  myHistory() {
    return RefreshIndicator(
      onRefresh: () => controller.pullRefresh(),
      child: Center(
        child: Obx(() => Get.find<MyHistroyController>().isLoading.isFalse
            ? Get.find<MyHistroyController>().myHistoryModel != null
                ? ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: Get.find<MyHistroyController>()
                        .myHistoryModel!
                        .data!
                        .length,
                    itemBuilder: (context, index) {
                      var data = Get.find<MyHistroyController>()
                          .myHistoryModel!
                          .data![index];
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 8.0, right: 8.0),
                        child: InkWell(
                          // onTap: () => {
                          //   Get.find<HistoryController>().viewHistory(data.id)
                          // },
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
                                      Expanded(
                                        child: Text(
                                          data.checklist!.title.toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      ),
                                      Text(
                                        data.user!.name.toString(),
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        data.user!.empId.toString(),
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                      DropdownButtonHideUnderline(
                                        child: DropdownButton2(
                                          customButton: Icon(
                                            Icons.more_vert,
                                            color: AppColors.primary,
                                          ),
                                          items: [
                                            ...MenuItems.firstItems.map(
                                              (item) =>
                                                  DropdownMenuItem<MenuItem>(
                                                value: item,
                                                child:
                                                    MenuItems.buildItem(item),
                                              ),
                                            ),
                                          ],
                                          onChanged: (value) {
                                            onChanged(context,
                                                value as MenuItem, data);
                                          },
                                          dropdownStyleData: DropdownStyleData(
                                            width: 160,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 6),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              color: AppColors.white,
                                            ),
                                            elevation: 8,
                                            offset: const Offset(0, 8),
                                          ),
                                          menuItemStyleData: MenuItemStyleData(
                                            customHeights: [
                                              ...List<double>.filled(
                                                  MenuItems.firstItems.length,
                                                  48),
                                            ],
                                            padding: const EdgeInsets.only(
                                                left: 16, right: 16),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${data.campus?.location!.name}_${data.campus?.building!.name}_${data.campus?.floor!.name}_${data.campus?.zone!.name}_${data.campus?.spot!.name}",
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                      Text(
                                        Helper()
                                            .convertTimestamp(data.updatedAt),
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                      const SizedBox(width: 10)
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
                      width: MediaQuery.of(Get.context!).size.width * 0.70,
                      height: MediaQuery.of(Get.context!).size.height * 0.70,
                      child: Lottie.asset('assets/lottie/empty.json'),
                    ),
                  )
            : Helper().loadingProgressBar()),
      ),
    );
  }

  alertDialog(data) {
    return showDialog<String>(
      context: Get.context!,
      builder: (BuildContext context) => AlertDialog(
        content: const Text('Do you really want to edit this history ?'),
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
                    Get.find<HistoryController>().getEditOrView(data.id, "edit")
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

  onChanged(BuildContext context, MenuItem item, data) {
    switch (item) {
      case MenuItems.view:
        Get.find<HistoryController>().viewHistory(data.id);
        break;
      case MenuItems.edit:
        alertDialog(data);
        break;
    }
  }
}

class MenuItem {
  final String text;

  const MenuItem({
    required this.text,
  });
}

class MenuItems {
  static const List<MenuItem> firstItems = [view, edit];

  static const view = MenuItem(text: 'view');
  static const edit = MenuItem(text: 'edit');

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Text(
          item.text,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  // static onChanged(BuildContext context, MenuItem item) {
  //   switch (item) {
  //     case MenuItems.view:
  //       // alertDialog(data);
  //       break;
  //     case MenuItems.edit:
  //       //Do something
  //       break;
  //   }
  // }
}
