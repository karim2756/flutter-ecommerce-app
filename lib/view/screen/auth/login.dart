import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/controller/auth/login_controller.dart';
import 'package:my_project/core/class/handlingdataview.dart';
import 'package:my_project/core/constant/color.dart';
import 'package:my_project/core/functions/appexit.dart';
import 'package:my_project/core/functions/validinput.dart';
import 'package:my_project/view/widget/auth/custombodyauth.dart';
import 'package:my_project/view/widget/auth/custombuttonauth.dart';
import 'package:my_project/view/widget/auth/customhaveanaccount.dart';
import 'package:my_project/view/widget/auth/customtextformauth.dart';
import 'package:my_project/view/widget/auth/customtitleauth.dart';
import 'package:my_project/view/widget/auth/logoauth.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        elevation: 0.1,
        centerTitle: true,
        title: Text("10".tr,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.grey)),
      ),
      body: WillPopScope(
          onWillPop: appExit,
          child: GetBuilder<LoginControllerImp>(
              builder: (controller) => HandlingDataRequest(
                    statusRequest: controller.statusRequest,
                    widget: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: Form(
                        key: controller.formState,
                        child: ListView(
                          children: [
                            const LogoAuth(),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTitleAuth(titleText: "9".tr),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomBodyAuth(bodyText: "11".tr),
                            CustomTextFormAuth(
                              valid: (val) {
                                return validInput(val!, 10, 100, "email");
                              },
                              isNumber: false,
                              hintText: "12".tr,
                              labelText: "13".tr,
                              icon: Icons.email_outlined,
                              myController: controller.email,
                            ),
                            CustomTextFormAuth(
                              valid: (val) {
                                return validInput(val!, 5, 30, "password");
                              },
                              obsecureText: true,
                              isNumber: false,
                              hintText: "14".tr,
                              labelText: "15".tr,
                              icon: Icons.lock_clock_outlined,
                              myController: controller.password,
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              child: InkWell(
                                onTap: () {
                                  controller.goToForgotPassword();
                                },
                                child: Text(
                                  "16".tr,
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ),
                            CustomButtonAuth(
                              text: "10".tr,
                              onPressed: () {
                                controller.login();
                              },
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            CustomHaveAnAccount(
                              text: "17".tr,
                              textTwo: "18".tr,
                              onTap: () {
                                controller.goToSignUp();
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ))),
    );
  }
}
