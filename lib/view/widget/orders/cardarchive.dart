import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/controller/orders/archive_controller.dart';
import 'package:my_project/core/constant/color.dart';
import 'package:my_project/core/constant/pageroute.dart';
import 'package:my_project/data/model/ordersmodel.dart';

class CardArchiveOrders extends GetView<ArchiveController> {
  final OrdersModel listdata;
  const CardArchiveOrders({
    super.key,
    required this.listdata,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 4, color: AppColor.primaryColor),
      ),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          padding: const EdgeInsets.all(15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "${"76".tr} : #${listdata.ordersId}",
              style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "${"77".tr} : \$${listdata.ordersPrice}",
              style: const TextStyle(fontSize: 20),
            ),
            listdata.ordersCoupon == 1
                ? Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Text(
                      "78".tr,
                      style: const TextStyle(fontSize: 20),
                    ),
                  )
                : Container(),
            const SizedBox(
              height: 10,
            ),
            Text(
              "${"79".tr} : ${"${listdata.addressCity!}, ${listdata.addressStreet!}, ${listdata.addressName!}"}",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "${"80".tr} : ${controller.printPaymentMethod(listdata.ordersPaymentmethod)}",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "${"81".tr} : ${controller.printOrderStatus(listdata.ordersStatus!)}",
              style: const TextStyle(fontSize: 20, color: AppColor.red),
            ),
            const SizedBox(
              height: 8,
            ),
            const Divider(
              thickness: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${"82".tr} : \$${listdata.ordersTotalprice}",
                  style: const TextStyle(
                      fontSize: 20,
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: AppColor.primaryColor,
                  onPressed: () {
                    Get.toNamed(AppRoutes.ordersArchiveDetails,
                        arguments: {"ordersmodel": listdata});
                  },
                  child: Text(
                    "83".tr,
                    style: const TextStyle(
                        color: AppColor.backgroundColor,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
