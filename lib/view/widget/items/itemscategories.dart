import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/controller/items_controller.dart';
import 'package:my_project/core/constant/color.dart';
import 'package:my_project/core/localization/translatedatabase.dart';

class ItemsCategories extends GetView<ItemsControllerImp> {
  const ItemsCategories({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    return Container(
      height: 40,
      margin: const EdgeInsets.only(top: 10, bottom: 20),
      child: ListView.builder(
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GetBuilder<ItemsControllerImp>(
            builder: (controller) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 3),
              decoration: BoxDecoration(
                  color: controller.categories[index]['categories_id'] ==
                          controller.selectedCat
                      ? AppColor.primaryColor
                      : null,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: AppColor.primaryColor, width: 2)),
              child: MaterialButton(
                onPressed: () {
                  controller.changeCategory(
                      controller.categories[index]['categories_id']);
                },
                child: Text(
                  "${translateDatabase(controller.categories[index]['categories_name'], controller.categories[index]['categories_name_ar']) }",
                  style:  TextStyle(fontSize: 15, color: controller.categories[index]['categories_id'] ==
                          controller.selectedCat
                      ? AppColor.backgroundColor:null),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
