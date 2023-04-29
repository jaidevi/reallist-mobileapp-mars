import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../utils/app_colors.dart';

class Home extends StatelessWidget {
  final homeController = Get.put(HomeController());
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Center(
          child: homeController.screens
              .elementAt(homeController.currentIndex.value),
        ),
      ),
      bottomNavigationBar: Obx(
        () =>
            // SalomonBottomBar(
            //   currentIndex: homeController.currentIndex.value,
            //   onTap: (i) => homeController.onItemTap(i),
            //   items: [
            //     SalomonBottomBarItem(
            //       icon: const Icon(Icons.home),
            //       title: const Text("Home"),
            //       selectedColor: AppColors.primary,
            //     ),
            //     SalomonBottomBarItem(
            //       icon: const Icon(Icons.person),
            //       title: const Text("Profile"),
            //       selectedColor: AppColors.primary,
            //     ),
            //   ],
            // ),

            BottomNavigationBar(
          unselectedItemColor: AppColors.bottomNaviUs,
          selectedItemColor: AppColors.primary,
          currentIndex: homeController.currentIndex.value,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.bottomNaviBg,
          iconSize: 18,
          selectedFontSize: 13,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.checklist),
              label: "CheckList",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.edit_document),
              label: "Override",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: "History",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: "MyTeam",
            ),


          ],
          onTap: (index) {
            homeController.onItemTap(index);
          },
        ),
      ),
    );
  }
}
