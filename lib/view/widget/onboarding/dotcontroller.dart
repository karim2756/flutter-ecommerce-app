import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/controller/onboarding/onboarding_controller.dart';
import 'package:my_project/core/constant/color.dart';
import 'package:my_project/data/datasource/static/static.dart';

class CustomDotControllerOnBoarding extends StatelessWidget {
  const CustomDotControllerOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(builder: (controller) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                      onBoardingList.length,
                      (index) => AnimatedContainer(
                            margin: const EdgeInsets.only(right: 5),
                            duration: const Duration(milliseconds: 700),
                            width: controller.curruntPage==index? 15:7,
                            height: 7,
                            decoration: BoxDecoration(
                                color: AppColor.primaryColor,
                                borderRadius: BorderRadius.circular(10)),
                          ))
                ],
              ),);
  }
}