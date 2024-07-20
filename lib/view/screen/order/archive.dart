import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/controller/orders/archive_controller.dart';
import 'package:my_project/core/class/handlingdataview.dart';
import 'package:my_project/view/widget/orders/cardarchive.dart';

class OrdersArchive extends StatelessWidget {
  const OrdersArchive({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ArchiveController());
    return Scaffold(
      appBar: AppBar(
        title: Text("89".tr),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<ArchiveController>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return CardArchiveOrders(
                    listdata: controller.data[index],
                  );
                },
              )),
        ),
      ),
    );
  }
}
