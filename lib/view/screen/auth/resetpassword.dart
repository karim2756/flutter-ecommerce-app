import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/controller/auth/resetpassword_controller.dart';

import 'package:my_project/core/constant/color.dart';
import 'package:my_project/core/functions/validinput.dart';
import 'package:my_project/view/widget/auth/custombodyauth.dart';
import 'package:my_project/view/widget/auth/custombuttonauth.dart';

import 'package:my_project/view/widget/auth/customtextformauth.dart';
import 'package:my_project/view/widget/auth/customtitleauth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller =
        Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColor.grey),
        backgroundColor: AppColor.backgroundColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text("32".tr,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.grey)),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Form(
          key: controller.formState,
          child: ListView(
            children: [
              const SizedBox(
                height: 40,
              ),
              CustomTitleAuth(titleText: "33".tr),
              const SizedBox(
                height: 10,
              ),
              CustomBodyAuth(bodyText: "34".tr),
              CustomTextFormAuth(
                  valid: (val) {
                    return validInput(val!, 5, 30, "password");
                  },
                       obsecureText: true,
                  isNumber: false,
                  hintText: "35".tr,
                  labelText: "36".tr,
                  icon: Icons.lock_outline_rounded,
                  myController: controller.password),
              CustomTextFormAuth(
                  valid: (val) {
                    return validInput(val!, 5, 30, "password");
                  },
                       obsecureText: true,
                   isNumber: false,
                  hintText: "37".tr,
                  labelText: "38".tr,
                  icon: Icons.lock_outline_rounded,
                  myController: controller.rePassword),
              CustomButtonAuth(
                text: "39".tr,
                onPressed: () {
                  controller.resetPassword();
                  controller.goToSuccessResetPassword();
                },
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
