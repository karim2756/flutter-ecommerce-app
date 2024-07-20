import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/core/constant/pageroute.dart';

abstract class ForgotPasswordController extends GetxController {
  checkEmail();
  goToVerifyCode();
}

class ForgotPasswordControllerImp extends ForgotPasswordController{
  late TextEditingController email;
  GlobalKey<FormState> formState =GlobalKey<FormState>();

  @override
  goToVerifyCode() {
    Get.offNamed(AppRoutes.verifycode);
  }

  @override
  checkEmail() {
    var formData=formState.currentState;
   formData!.validate();
  }
  @override
  void onInit() {
    email = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
