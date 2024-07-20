import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/core/class/statusrequest.dart';
import 'package:my_project/core/constant/color.dart';
import 'package:my_project/core/functions/handlingdata.dart';
import 'package:my_project/core/services/services.dart';
import 'package:my_project/data/datasource/remote/favorite_data.dart';

class FavoriteController extends GetxController {
  MyServices myServices = Get.find();
  FavoriteData favoriteData = FavoriteData(Get.find());

  late StatusRequest statusRequest;

  Map isFavorite = {};
  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  addFavorite(String itemsId) async {
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addFavorite(
        myServices.sharedPreferences.getString("id")!, itemsId);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // if success
      if (response['status'] == "success") {
        Get.rawSnackbar(
            messageText: Text(
              "69".tr,
              style: const TextStyle(
                  color: AppColor.backgroundColor, fontSize: 15),
            ),
            duration: const Duration(seconds: 1));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  removeFavortie(String itemsId) async {
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.removeFavorite(
        myServices.sharedPreferences.getString("id")!, itemsId);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            messageText: Text(
              "70".tr,
              style: const TextStyle(
                  color: AppColor.backgroundColor, fontSize: 15),
            ),
            duration: const Duration(seconds: 1));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }
}
