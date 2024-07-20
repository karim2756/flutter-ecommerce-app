import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/applink.dart';
import 'package:my_project/controller/home_controller.dart';
import 'package:my_project/core/constant/color.dart';
import 'package:my_project/core/localization/translatedatabase.dart';
import 'package:my_project/data/model/itemsmodel.dart';

class TopSellingItems extends GetView<HomeControllerImp> {
  const TopSellingItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.topItems.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.goToItemssDetails(
                  ItemsModel.fromJson(controller.topItems[index]));
            },
            child: Stack(children: [
              Container(
                decoration: BoxDecoration(
                    color: AppColor.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20)),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: 200,
                width: 180,
                child: Image.network(
                  ("${AppLink.imageItems}/${controller.topItems[index]['items_image']}"),
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                bottom: 0,
                right: controller.lang == "ar" ? 30 : 40,
          
                child: Text(
                  "${translateDatabase(controller.topItems[index]['items_name'], controller.topItems[index]['items_name_ar'])}",
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
           
            ]),
          );
        },
      ),
    );
  }
}
