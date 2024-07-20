import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import 'package:my_project/controller/auth/verifycode_controller.dart';
import 'package:my_project/core/constant/color.dart';
import 'package:my_project/view/widget/auth/custombodyauth.dart';

import 'package:my_project/view/widget/auth/customtitleauth.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImp controller = Get.put(VerifyCodeControllerImp());
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
        child: ListView(
          children: [
            const SizedBox(
              height: 40,
            ),
            CustomTitleAuth(titleText: "30".tr),
            const SizedBox(
              height: 10,
            ),
            CustomBodyAuth(bodyText: "31".tr),
            const SizedBox(
              height: 40,
            ),
            OtpTextField(
              numberOfFields: 5,
              borderRadius: BorderRadius.circular(20),
              borderWidth: 1,
              fieldHeight: 90,
              fieldWidth: 50,
              enabledBorderColor: AppColor.black,
              textStyle:
                  const TextStyle(fontSize: 30, color: AppColor.primaryColor),
              borderColor: AppColor.primaryColor,
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                controller.goToResetPassword();
              }, // end onSubmit
            ),
          ],
        ),
      ),
    );
  }
}
