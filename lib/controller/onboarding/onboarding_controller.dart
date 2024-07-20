import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/core/constant/pageroute.dart';
import 'package:my_project/core/services/services.dart';
import 'package:my_project/data/datasource/static/static.dart';

abstract class OnBoardingController extends GetxController {
  next() {}
  onPageChanged(val) {}
}

class OnBoardingControllerImp extends OnBoardingController {
  MyServices myServices = Get.find(); 
  int curruntPage = 0;
  late PageController pageController;
  @override
  next() {
    curruntPage++;
    if (curruntPage > onBoardingList.length - 1) {
myServices.sharedPreferences.setString("step", "1");
      Get.offAllNamed(AppRoutes.login);
    } else {
      pageController.animateToPage(curruntPage,
          duration: const Duration(milliseconds: 700), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(val) {
    curruntPage = val;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
