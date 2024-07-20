import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/controller/itemdetails_controller.dart';
import 'package:my_project/core/constant/color.dart';
import 'package:my_project/core/constant/pageroute.dart';

class BottomNavigationBarItems extends StatelessWidget {
  const BottomNavigationBarItems({super.key});

  @override
  Widget build(BuildContext context) {
      ItemDetailsControllerImp itemModel= Get.find();

    return  Container( 
        margin: const EdgeInsets.symmetric(horizontal: 70,vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),color: AppColor.primaryColor
      ),  child: MaterialButton(
          onPressed: () {
        itemModel.cartController.refreshPage();
            Get.toNamed(AppRoutes.cart);
          },
          child:  Text(
            "71".tr,
            style: const TextStyle(fontSize: 20,color: AppColor.backgroundColor),
          ),
        ),
      );
  }
}