import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/core/class/statusrequest.dart';
import 'package:my_project/core/constant/pageroute.dart';
import 'package:my_project/core/functions/handlingdata.dart';
import 'package:my_project/data/datasource/remote/auth/signupdata.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToLogin();
}

class SignUpControllerImp extends SignUpController {
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController phone;
  late TextEditingController username;
  StatusRequest statusRequest =
      StatusRequest.none; //initial value with none for null check operator
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  SignUpData signUpDataData = SignUpData(Get.find());
  List data = [];
  @override
  goToLogin() {
    Get.offAllNamed(AppRoutes.login);
  }

  @override
  signUp() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      Map response = await signUpDataData.postData(
          username.text, password.text, email.text, phone.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        // if success
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          Get.offNamed(AppRoutes.login);
      Get.defaultDialog(title: "61".tr, middleText: "62".tr);

        } else {
          Get.defaultDialog(title: "51".tr, middleText: "52".tr);
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    username = TextEditingController();
    phone = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    username.dispose();
    phone.dispose();
    super.dispose();
  }
}
