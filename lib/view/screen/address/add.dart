import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/controller/address/add_controller.dart';
import 'package:my_project/core/class/handlingdataview.dart';
import 'package:my_project/view/widget/auth/custombuttonauth.dart';
import 'package:my_project/view/widget/auth/customtextformauth.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put( AddAddressController());
    return Scaffold(
      appBar: AppBar(
        title:  Text("110".tr),
      ),
      body: Container(
          padding: const EdgeInsets.all(10),
          child: GetBuilder<AddAddressController>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(
                  children: [
                    CustomTextFormAuth(
                        hintText: "111".tr,
                        labelText: "107".tr,
                        icon: Icons.location_city_outlined,
                        myController: controller.city!,
                        valid: (val) {
                          return null;
                        },
                        isNumber: false),
                    CustomTextFormAuth(
                        hintText: "112".tr,
                        labelText: "108".tr,
                        icon: Icons.add_road,
                        myController: controller.street!,
                        valid: (val) {
                          return null;
                        },
                        isNumber: false),
                    CustomTextFormAuth(
                        hintText: "113".tr,
                        labelText: "109".tr,
                        icon: Icons.business,
                        myController: controller.name!,
                        valid: (val) {
                          return null;
                        },
                        isNumber: false),
                    CustomButtonAuth(
                      text: "114".tr,
                      onPressed: () {
                        controller.addAddress();
                      },
                    )
                  ],
                )),
          )),
    );
  }
}
