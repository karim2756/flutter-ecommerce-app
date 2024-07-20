import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/controller/auth/fogotpassword_controller.dart';
import 'package:my_project/core/constant/color.dart';
import 'package:my_project/core/functions/validinput.dart';
import 'package:my_project/view/widget/auth/custombodyauth.dart';
import 'package:my_project/view/widget/auth/custombuttonauth.dart';

import 'package:my_project/view/widget/auth/customtextformauth.dart';
import 'package:my_project/view/widget/auth/customtitleauth.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ForgotPasswordControllerImp controller =
        Get.put(ForgotPasswordControllerImp());
    return Scaffold(
    
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColor.grey),
        backgroundColor: AppColor.backgroundColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text("26".tr,
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
              CustomTitleAuth(titleText: "27".tr),
              const SizedBox(
                height: 10,
              ),
              CustomBodyAuth(
                  bodyText:
                      "28".tr),
              CustomTextFormAuth(valid: (val) {
                  return validInput(val!, 10, 100,"email");
                },
                 isNumber: false,
                  hintText: "12".tr,
                  labelText: "13".tr,
                  icon: Icons.email_outlined,
                  myController: controller.email),
              CustomButtonAuth(
                text: "29".tr,
                onPressed: () {
                  controller.checkEmail();
                  controller.goToVerifyCode();
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
