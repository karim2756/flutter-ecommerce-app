import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/controller/onboarding/onboarding_controller.dart';
import 'package:my_project/core/constant/color.dart';
import 'package:my_project/view/widget/onboarding/custombutton.dart';
import 'package:my_project/view/widget/onboarding/customslider.dart';
import 'package:my_project/view/widget/onboarding/dotcontroller.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return const Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(flex: 3, child: CustomSliderOnBoarding()),
              Expanded(
                  child: Column(
                children: [
                  CustomDotControllerOnBoarding(),
                  CustomButtonOnBoarding()
                ],
              ))
            ],
          ),
        ));
  }
}
