import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/controller/onboarding/onboarding_controller.dart';
import 'package:my_project/core/constant/color.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(50),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        textColor: Colors.white,
        color: AppColor.primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
        onPressed: () {
          controller.next();
        },
        child: Text(
          "8".tr,
        style: const TextStyle(fontWeight: FontWeight.bold),),
      ),
    );
  }
}
