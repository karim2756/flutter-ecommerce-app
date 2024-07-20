import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/controller/auth/signup_controller.dart';
import 'package:my_project/core/class/handlingdataview.dart';
import 'package:my_project/core/constant/color.dart';
import 'package:my_project/core/functions/appexit.dart';
import 'package:my_project/core/functions/validinput.dart';
import 'package:my_project/view/widget/auth/custombodyauth.dart';
import 'package:my_project/view/widget/auth/custombuttonauth.dart';
import 'package:my_project/view/widget/auth/customhaveanaccount.dart';
import 'package:my_project/view/widget/auth/customtextformauth.dart';
import 'package:my_project/view/widget/auth/customtitleauth.dart';

class SignUP extends StatelessWidget {
  const SignUP({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColor.grey),
        backgroundColor: AppColor.backgroundColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text("18".tr,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.grey)),
      ),
      body: WillPopScope(
          onWillPop: appExit,
          child: GetBuilder<SignUpControllerImp>(
            builder: (controller) =>
          HandlingDataRequest(statusRequest: controller.statusRequest, widget: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: Form(
                          key: controller.formState,
                          child: ListView(
                            children: [
                              CustomTitleAuth(titleText: "19".tr),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomBodyAuth(bodyText: "20".tr),
                              CustomTextFormAuth(
                                valid: (val) {
                                  return validInput(val!, 3, 20, "username");
                                },
                                isNumber: false,
                                hintText: "21".tr,
                                labelText: "22".tr,
                                icon: Icons.person_2_outlined,
                                myController: controller.username,
                              ),
                              CustomTextFormAuth(
                                  valid: (val) {
                                    return validInput(val!, 10, 100, "email");
                                  },
                                  isNumber: false,
                                  hintText: "12".tr,
                                  labelText: "13".tr,
                                  icon: Icons.email_outlined,
                                  myController: controller.email),
                              CustomTextFormAuth(
                                  valid: (val) {
                                    return validInput(val!, 10, 20, "phone");
                                  },
                                  isNumber: true,
                                  hintText: "23".tr,
                                  labelText: "24".tr,
                                  icon: Icons.phone_android_outlined,
                                  myController: controller.phone),
                              CustomTextFormAuth(
                                  valid: (val) {
                                    return validInput(val!, 5, 30, "password");
                                  },
                                  obsecureText: true,
                                  isNumber: false,
                                  hintText: "14".tr,
                                  labelText: "15".tr,
                                  icon: Icons.lock_clock_outlined,
                                  myController: controller.password),
                              CustomButtonAuth(
                                text: "18".tr,
                                onPressed: () {
                                  controller.signUp();
                                },
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              CustomHaveAnAccount(
                                text: "25".tr,
                                textTwo: "10".tr,
                                onTap: () {
                                  controller.goToLogin();
                                },
                              )
                            ],
                          ),
                        ),
                      ),) 
          )),
    );
  }
}
