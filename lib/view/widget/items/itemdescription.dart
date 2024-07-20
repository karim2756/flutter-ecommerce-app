import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/controller/itemdetails_controller.dart';
import 'package:my_project/core/constant/color.dart';
import 'package:my_project/core/localization/translatedatabase.dart';

class ItemDescription extends GetView<ItemDetailsControllerImp> {
  const ItemDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return  
                Text(
                  "${translateDatabase(controller.itemsModel.itemsDesc, controller.itemsModel.itemsDescAr)} ",
                  style:  TextStyle(fontSize: controller.lang == "ar" ? 24 : 27, color: AppColor.grey),
                );
               
  }
}