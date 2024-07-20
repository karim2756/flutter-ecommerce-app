import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/controller/home_controller.dart';
import 'package:my_project/core/constant/color.dart';

class OfferBox extends GetView<HomeControllerImp> {
  final String offerText;
  final String offerPercentage;
  final String image;

  const OfferBox(
      {super.key,
      required this.offerText,
      required this.offerPercentage,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10),
            height: 180,
            decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              title: Text(
                offerText,
                style:  TextStyle(
                    fontSize:controller.lang == "ar"? 26:30,
                    color: AppColor.backgroundColor,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Container(
                height: 40,
                alignment: Alignment.center,
                margin: controller.lang == "ar"
                    ? const EdgeInsets.only(left: 200,top: 10)
                    : const EdgeInsets.only(right: 200),
                decoration: BoxDecoration(
                    color: AppColor.backgroundColor,
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                  offerPercentage,
                  style:  TextStyle(
                    fontSize: controller.lang == "ar" ?18:20,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primaryColor,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: controller.lang == "en" ? 0 : null,
            left: controller.lang == "ar" ? 0 : null,
            child: Container(
              height: 190,
              width: 190,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
