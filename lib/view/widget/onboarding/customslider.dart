import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/controller/onboarding/onboarding_controller.dart';
import 'package:my_project/data/datasource/static/static.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val) {
        controller.onPageChanged(val);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, i) => Column(
        children: [
          SizedBox(height:350,
            child: Image.asset(
              onBoardingList[i].image!,
            ),
          ),
          const SizedBox(
            height: 60,
          ),
           Text(
            onBoardingList[i].title!,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(onBoardingList[i].body!,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge)),
        ],
      ),
    );
  }
}
