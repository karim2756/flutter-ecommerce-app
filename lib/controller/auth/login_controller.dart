import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/core/class/statusrequest.dart';
import 'package:my_project/core/constant/pageroute.dart';
import 'package:my_project/core/functions/handlingdata.dart';
import 'package:my_project/core/services/services.dart';
import 'package:my_project/data/datasource/remote/auth/logindata.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgotPassword();
}

class LoginControllerImp extends LoginController {
  LoginData loginData = LoginData(Get.find());
  MyServices myServices = Get.find();
  StatusRequest statusRequest =
      StatusRequest.none; //initial value with none for null check operator
  late TextEditingController email;
  late TextEditingController password;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  @override
  goToSignUp() {
    Get.offNamed(AppRoutes.signUp);
  }

  @override
  login() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(email.text, password.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        // if success
        if (response['status'] == "success") {
          myServices.sharedPreferences
              .setString("id", response["data"]["users_id"].toString());
          myServices.sharedPreferences
              .setString("username", response["data"]["users_name"]);

          myServices.sharedPreferences
              .setString("email", response["data"]["users_email"]);

          myServices.sharedPreferences
              .setString("phone", response["data"]["users_phone"].toString());
          myServices.sharedPreferences.setString("step", "2");
          Get.offNamed(AppRoutes.homePage);
        } else {
          Get.defaultDialog(title: "51".tr, middleText: "54".tr);
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

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgotPassword() {
    Get.toNamed(AppRoutes.forgotPassword);
  }
}
