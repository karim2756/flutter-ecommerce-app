import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/controller/orders/details_controller.dart';
import 'package:my_project/core/class/handlingdataview.dart';
import 'package:my_project/core/constant/color.dart';
import 'package:my_project/core/localization/translatedatabase.dart';
import 'package:quickalert/models/quickalert_animtype.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: Text("84".tr),
      ),
      body: GetBuilder<OrdersDetailsController>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView(children: [
                Card(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          Table(
                            children: [
                               TableRow(children: [
                                Text("85".tr,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: AppColor.primaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25)),
                                Text("86".tr,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: AppColor.primaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25)),
                                Text("${"73".tr}\n",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: AppColor.primaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25)),
                                    
                              ]),
                              ...List.generate(
                                  controller.data.length,
                                  (index) => TableRow(children: [
                                        Text(
                                          "${translateDatabase(controller.data[index].itemsName, controller.data[index].itemsNameAr)}\n",
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(fontSize: 20),
                                        ),
                                        Text(
                                          "${controller.data[index].countitems}",
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(fontSize: 20),
                                        ),
                                        Text(
                                          "${controller.data[index].itemsprice} \$",
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(fontSize: 20),
                                        ),
                                        
                                      ]))
                            ],
                          ),
                        MaterialButton(
                                color: AppColor.red,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(10)),
                                onPressed: () {
                                   QuickAlert.show(
                                  showCancelBtn: true,
                                   cancelBtnTextStyle: const TextStyle( fontSize: 20),
                                      confirmBtnColor: AppColor.red,
                                      animType: QuickAlertAnimType.rotate,
                        context: context,
                        cancelBtnText: "50".tr,
                        confirmBtnText: "49".tr,
                     
                        type: QuickAlertType.warning,
                        text: '129'.tr,
                        title: "118".tr,
                        onConfirmBtnTap: () {
                          controller.deleteOrder();
                        },
                      );
                                },
                                child: Text(
                                  "87".tr,
                                  style: const TextStyle(
                                      color: AppColor.backgroundColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                        ],
                      )),
                ),
              ]))),
    );
  }
}
