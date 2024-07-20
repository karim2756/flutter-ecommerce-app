import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/controller/itemdetails_controller.dart';

import 'package:my_project/core/constant/color.dart';
import 'package:my_project/core/localization/translatedatabase.dart';

class ItemName extends GetView<ItemDetailsControllerImp> {
  const ItemName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${translateDatabase(controller.itemsModel.itemsName, controller.itemsModel.itemsNameAr)}",
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        Container(
          decoration: BoxDecoration(
              color:
                  controller.itemsModel.itemsDiscount! > 0 ? Colors.red : null,
              borderRadius: BorderRadius.circular(10)),
          alignment: Alignment.center,
          height: 40,
          width: 100,
          child: Text(
            "99".tr,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: AppColor.backgroundColor),
          ),
        ),
      ],
    );
  }
}
