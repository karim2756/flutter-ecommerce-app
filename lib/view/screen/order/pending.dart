import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/controller/orders/pending_controller.dart';
import 'package:my_project/core/class/handlingdataview.dart';
import 'package:my_project/view/widget/orders/cardpendingorders.dart';

class PendingOrders extends StatelessWidget {
  const PendingOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => PendingOrdersController());
    return Scaffold(
      appBar: AppBar(
        title:  Text("64".tr),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<PendingOrdersController>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return CardPendingOrders(
                    listdata: controller.data[index],
                  );
                },
              )),
        ),
      ),
    );
  }
}
