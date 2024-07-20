// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/controller/checkout_controller.dart';
import 'package:my_project/core/class/handlingdataview.dart';
import 'package:my_project/core/constant/color.dart';
import 'package:my_project/view/widget/checkout/cardaddress.dart';
import 'package:my_project/view/widget/checkout/cardpaymentmethod.dart';
import 'package:quickalert/models/quickalert_animtype.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckoutController());
    return Scaffold(
      appBar: AppBar(title: Text("100".tr)),
      bottomNavigationBar: GetBuilder<CheckoutController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
              margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
              decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(15)),
              child: MaterialButton(
                  onPressed: () async {
                    await controller.checkOut();
                    if (controller.successCheckout == true) {
                        QuickAlert.show(
                                      confirmBtnColor: AppColor.primaryColor,
                                      animType: QuickAlertAnimType.scale,
                        context: context,
                        confirmBtnText: "8".tr,
                        type: QuickAlertType.success,
                        text: '128'.tr,
                      );
                    }else{
                      QuickAlert.show(
                                      confirmBtnColor: AppColor.red,
                                      animType: QuickAlertAnimType.scale,
                        context: context,
                        confirmBtnText: "8".tr,
                        type: QuickAlertType.error,
                        text: '117'.tr,
                      );
                    }
                  },
                  child: Text(
                    "101".tr,
                    style: const TextStyle(
                        color: AppColor.backgroundColor, fontSize: 18),
                  ))),
        ),
      ),
      body: Container(
          padding: const EdgeInsets.all(10),
          child: GetBuilder<CheckoutController>(
            builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "102".tr,
                    style: const TextStyle(
                        fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      controller.choosePaymentMethod("0");
                    },
                    child: CardPaymnetMethod(
                        title: "103".tr,
                        icon: Icons.attach_money_outlined,
                        isActive:
                            controller.paymentMethod == "0" ? true : false),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      controller.choosePaymentMethod("1");
                    },
                    child: CardPaymnetMethod(
                        title: "104".tr,
                        icon: Icons.credit_card,
                        isActive:
                            controller.paymentMethod == "1" ? true : false),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 25),
                        child: Text(
                          "105".tr,
                          style: const TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ...List.generate(controller.dataaddress.length, (index) {
                        return InkWell(
                          onTap: () {
                            controller.chooseShippingAddress(controller
                                .dataaddress[index].addressId
                                .toString());
                          },
                          child: CardAddress(
                              title: controller.dataaddress[index].addressCity!,
                              subtitle:
                                  "${controller.dataaddress[index].addressStreet!}.  ${controller.dataaddress[index].addressName!}",
                              isActive: controller.dataaddress[index].addressId
                                          .toString() ==
                                      controller.addressid
                                  ? true
                                  : false),
                        );
                      })
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
