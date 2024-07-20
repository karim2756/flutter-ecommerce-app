import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/core/constant/color.dart';
import 'package:my_project/core/constant/imageasset.dart';
import 'package:my_project/core/constant/pageroute.dart';
import 'package:my_project/core/localization/locale_controller.dart';
import 'package:my_project/view/widget/auth/logoauth.dart';
import 'package:my_project/view/widget/language/custombuttonlanguage.dart';

class Language extends GetView<LocaleController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Container(
        margin: const EdgeInsets.only(top: 40),
        padding: const EdgeInsets.all(30),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LogoAuth(),
            const SizedBox(
              height: 30,
            ),
            Text(
              "1".tr,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            CustomButtonLanguage(
              image: AppImageAsset.usa,
              textButton: "English",
              onPressed: () {
                controller.changeLang("en");

                Get.toNamed(AppRoutes.onBoarding);
              },
            ),
            CustomButtonLanguage(
              image: AppImageAsset.egypt,
              textButton: "العربية",
              onPressed: () {
                controller.changeLang("ar");
                Get.toNamed(AppRoutes.onBoarding);
              },
            )
          ],
        ),
      ),
    );
  }
}
