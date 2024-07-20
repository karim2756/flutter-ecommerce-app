import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/controller/address/view_controller.dart';
import 'package:my_project/core/class/handlingdataview.dart';
import 'package:my_project/core/constant/color.dart';
import 'package:my_project/core/constant/pageroute.dart';

class ViewAddress extends StatelessWidget {
  const ViewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewAddressController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.addAddress);
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title:  Text("106".tr),
      ),
      body: Container(
          padding: const EdgeInsets.all(10),
          child: GetBuilder<ViewAddressController>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: AppColor.primaryColor.withOpacity(.4)),
                      child: Card(
                          child: Container(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${"107".tr} : ${controller.data[index].addressCity}",
                                    style: const TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${"108".tr} : ${controller.data[index].addressStreet}",
                                        style: const TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          controller.deleteData(controller
                                              .data[index].addressId
                                              .toString());
                                        },
                                        icon: const Icon(Icons.close_outlined),
                                        iconSize: 32,
                                        color: AppColor.red,
                                      )
                                    ],
                                  ),
                                  Text(
                                    "${"109".tr} : ${controller.data[index].addressName}",
                                    style: const TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ))),
                    );
                  },
                )),
          )),
    );
  }
}
