import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/core/class/statusrequest.dart';
import 'package:my_project/core/constant/color.dart';
import 'package:my_project/core/constant/pageroute.dart';
import 'package:my_project/core/functions/handlingdata.dart';
import 'package:my_project/core/services/services.dart';
import 'package:my_project/data/datasource/remote/address_data.dart';

class AddAddressController extends GetxController {
  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? street;
  MyServices myServices = Get.find();
  String? usersid;

  StatusRequest statusRequest = StatusRequest.none;
  AddressData addressData = AddressData(Get.find());
  addAddress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.addData(
        myServices.sharedPreferences.getString("id")!,
        name!.text,
        city!.text,
        street!.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // if success
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoutes.homePage);
        Get.snackbar("115".tr, "",
         
            backgroundColor: AppColor.primaryColor,
            colorText: AppColor.backgroundColor);
      } else {
        //if there is no data or server failure
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
  }
}
