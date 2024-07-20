import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/controller/itemdetails_controller.dart';
import 'package:my_project/core/constant/color.dart';

class ItemCounter extends StatelessWidget {
  const ItemCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemDetailsControllerImp>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    MaterialButton(
                      onPressed: () {
                        controller.add();
                      },
                      child: const Text(
                        "+",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColor.black)),
                      child: Text(
                        "${controller.itemCount}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        controller.remove();
                      },
                      child: const Text(
                        "-",
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                  ],
                ),
                Text(
                  controller.itemCount > 1
                      ? " \$${(controller.itemsModel.itemsPriceDiscount! * controller.itemCount)}"
                      : " \$${(controller.itemsModel.itemsPriceDiscount!)}",
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryColor),
                )
              ],
            ));
  }
}
