import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class PermissionController extends GetxController with WidgetsBindingObserver {
  // Map<Permission, PermissionStatus>? statuses;
  // gps.Location location = gps.Location();
  RxBool isPaused = false.obs;
  RxBool isOpenAppSeting = false.obs;
  RxBool isLocationPermission = false.obs;
  RxBool isGpsEnable = false.obs;
  RxBool isInternetOn = false.obs;

  @override
  void onInit() async {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    print("====================>");
    //requestAppPermission();
    await execute(InternetConnectionChecker());

    // Create customized instance which can be registered via dependency injection
    final InternetConnectionChecker customInstance =
        InternetConnectionChecker.createInstance(
      checkTimeout: const Duration(seconds: 1),
      checkInterval: const Duration(seconds: 1),
    );

    // Check internet connection with created instance
    await execute(customInstance);
  }

  /*
  * Lifecycle activity
  */
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed) {
      if (kDebugMode) {
        print("Lifecycle state ----------> resumed");
      }
      if (kDebugMode) {
        print(isOpenAppSeting);
      }
      if (kDebugMode) {
        print(isPaused);
      }
      if (isOpenAppSeting.isTrue && isPaused.isTrue) {
        //requestAppPermission();
        isOpenAppSeting(false);
        isPaused(false);
      }
    } else if (state == AppLifecycleState.inactive) {
      if (kDebugMode) {
        print("Lifecycle state ----------> inactive");
      }
    } else if (state == AppLifecycleState.detached) {
      if (kDebugMode) {
        print("Lifecycle state ----------> detached");
      }
    } else if (state == AppLifecycleState.paused) {
      isPaused(true);
      if (kDebugMode) {
        print("Lifecycle state ----------> paused");
      }
    } else {
      if (kDebugMode) {
        print("Lifecycle state ----------> $state");
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  // void requestAppPermission() async {
  //   try {
  //     statuses = await [Permission.location].request();
  //     getLocationPermission();
  //   } catch (err) {
  //     if (kDebugMode) {
  //       print("request permission catch ------> $err");
  //     }
  //   }
  // }

  // getLocationPermission() async {
  //   try {
  //     /**
  //      * locaiotn permission check
  //     */
  //     if (statuses![Permission.location]!.isGranted ||
  //         statuses![Permission.location]!.isLimited) {
  //       await location.getLocation();
  //       var serviceEnableRes = await location.serviceEnabled();
  //       if (serviceEnableRes == false) {
  //         requestAppPermission();
  //       } else {
  //         if (kDebugMode) {
  //           print("final check ---------> done");
  //         }
  //         isPaused(false);
  //         isLocationPermission(true);
  //         isGpsEnable(true);
  //         update();
  //       }
  //     } else if (statuses![Permission.location]!.isDenied) {
  //       isLocationPermission(false);
  //       requestAppPermission();
  //     } else {
  //       isLocationPermission(false);
  //       var isAppSet = await openAppSettings();
  //       isOpenAppSeting(isAppSet);
  //     }
  //   } catch (err) {
  //     if (kDebugMode) {
  //       print("catch calling ------> $err");
  //     }
  //   }
  // }

  Future<void> execute(
    InternetConnectionChecker internetConnectionChecker,
  ) async {
    // Simple check to see if we have Internet
    // ignore: avoid_print
    print('''The statement 'this machine is connected to the Internet' is: ''');
    final bool isConnected = await InternetConnectionChecker().hasConnection;
    // ignore: avoid_print
    print(
      isConnected.toString(),
    );
    // returns a bool

    // We can also get an enum instead of a bool
    // ignore: avoid_print
    print(
      'Current status: ${await InternetConnectionChecker().connectionStatus}',
    );
    // Prints either InternetConnectionStatus.connected
    // or InternetConnectionStatus.disconnected

    // actively listen for status updates
    final StreamSubscription<InternetConnectionStatus> listener =
        InternetConnectionChecker().onStatusChange.listen(
      (InternetConnectionStatus status) {
        switch (status) {
          case InternetConnectionStatus.connected:
            // ignore: avoid_print
            //print('Data connection is available.');
            Get.snackbar("Internet Work", "Data connection is available.");
            break;
          case InternetConnectionStatus.disconnected:
            // ignore: avoid_print
            Get.snackbar(
                "Internet Failed", "You are disconnected from the internet.");
            //print('You are disconnected from the internet.');
            break;
        }
      },
    );

    // close listener after 30 seconds, so the program doesn't run forever
    await Future<void>.delayed(const Duration(seconds: 30));
    await listener.cancel();
  }
}
