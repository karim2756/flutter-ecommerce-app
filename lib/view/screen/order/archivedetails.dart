import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/controller/orders/details_controller.dart';
import 'package:my_project/core/class/handlingdataview.dart';
import 'package:my_project/core/constant/color.dart';
import 'package:my_project/core/localization/translatedatabase.dart';

class OrdersArchiveDetails extends StatelessWidget {
  const OrdersArchiveDetails({super.key});

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
                                          style:
                                              const TextStyle(fontSize: 20),
                                        ),
                                        Text(
                                          "${controller.data[index].countitems}",
                                          textAlign: TextAlign.center,
                                          style:
                                              const TextStyle(fontSize: 20),
                                        ),
                                        Text(
                                          "${controller.data[index].itemsprice} \$",
                                          textAlign: TextAlign.center,
                                          style:
                                              const TextStyle(fontSize: 20),
                                        ),
                                      ]))
                            ],
                          ),
                        ],
                      )),
                ),
              ]))),
    );
  }
}
