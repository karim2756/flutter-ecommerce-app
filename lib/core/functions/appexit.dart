import 'dart:io';
import 'package:get/get.dart';
import 'package:my_project/core/constant/color.dart';

Future<bool> appExit() {
  Get.defaultDialog(
      title: "48".tr,
      middleText: "47".tr,
      textConfirm: "49".tr,
      textCancel: "50".tr,
      onConfirm: () {
        exit(0);
      },
      confirmTextColor: AppColor.backgroundColor,
      cancelTextColor: AppColor.black,
      buttonColor: AppColor.primaryColor);
  return Future(() => true);
}
