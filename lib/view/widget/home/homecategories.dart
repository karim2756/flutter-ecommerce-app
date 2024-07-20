import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/controller/home_controller.dart';
import 'package:my_project/core/constant/color.dart';
import 'package:my_project/core/localization/translatedatabase.dart';

class HomeCategories extends GetView<HomeControllerImp> {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(top: 10, bottom: 20),
      child: ListView.builder(
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 3),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: AppColor.primaryColor, width: 2)),
            child: MaterialButton(
              onPressed: () {
                controller.goToItems(
                    controller.categories,
                    controller.categories[index]['categories_id'],
                    controller.categories[index]['categories_id'].toString());
              },
              child: Text(
                "${translateDatabase(controller.categories[index]['categories_name'], controller.categories[index]['categories_name_ar']) }",
                style: const TextStyle(fontSize: 15, color: AppColor.black),
              ),
            ),
          );
        },
      ),
    );
  }
}
