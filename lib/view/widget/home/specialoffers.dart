import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/applink.dart';
import 'package:my_project/controller/home_controller.dart';
import 'package:my_project/core/constant/color.dart';
import 'package:my_project/core/constant/imageasset.dart';
import 'package:my_project/core/localization/translatedatabase.dart';
import 'package:my_project/data/model/itemsmodel.dart';

class SpecialOffers extends GetView<HomeControllerImp> {
  const SpecialOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 50),
      height: 210,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.items.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.goToItemssDetails(
                  ItemsModel.fromJson(controller.items[index]));
            },
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: AppColor.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20)),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: 180,
                  width: 180,
                  child: Image.network(
                    ("${AppLink.imageItems}/${controller.items[index]['items_image']}"),
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 20,
                  left: 20,
                  child: Text(
                    "${translateDatabase(controller.items[index]['items_name'], controller.items[index]['items_name_ar'])}",
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                controller.items[index]['items_discount'] != 0
                    ? Positioned(
                        left: 0,
                        top: -10,
                        child: Image.asset(
                          AppImageAsset.discount,
                          width: 60,
                        ),
                      )
                    : Container()
              ],
            ),
          );
        },
      ),
    );
  }
}
