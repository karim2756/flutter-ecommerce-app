import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/core/constant/pageroute.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController{
  late TextEditingController password;
  late TextEditingController rePassword;
GlobalKey<FormState> formState =GlobalKey<FormState>();
  @override
  goToSuccessResetPassword(){
    Get.toNamed(AppRoutes.successResetPassword);
  }

  @override
  resetPassword() {
    var formData=formState.currentState;
   formData!.validate();
  }
  @override
  void onInit() {
    password = TextEditingController();
    rePassword = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
      password.dispose();
    rePassword.dispose();
    super.dispose();
  }
}
