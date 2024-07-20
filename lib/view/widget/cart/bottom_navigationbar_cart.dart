import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/controller/cart_controller.dart';
import 'package:my_project/core/constant/color.dart';

class BottomNavigationBarCart extends GetView<CartController> {
  final int price;
  final int discount;
  final int shipping;
  final void Function()? couponApply;
  final TextEditingController? couponController;
  const BottomNavigationBarCart(
      {super.key,
      required this.price,
      required this.discount,
      required this.shipping,
      required this.couponController,
      required this.couponApply});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GetBuilder<CartController>(
              builder: (controller) => Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: controller.couponName == null
                      ? Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: TextFormField(
                                  controller: couponController,
                                  decoration: InputDecoration(
                                      hintText: "94".tr,
                                      hintStyle: const TextStyle(
                                          color: AppColor.black),
                                      isDense: true,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 10),
                                      border: const OutlineInputBorder()),
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: MaterialButton(
                              color: AppColor.primaryColor,
                              onPressed: couponApply,
                              child: Text(
                                "95".tr,
                                style: const TextStyle(
                                    color: AppColor.backgroundColor,
                                    fontSize: 17),
                              ),
                            ))
                          ],
                        )
                      : Text(
                          "Coupon ${controller.couponName} applied successfully !",
                          style: const TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ))),
          Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 2, color: AppColor.primaryColor)),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "73".tr,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColor.grey),
                        ),
                        Text(
                          "\$ $price",
                          style: const TextStyle(
                              fontSize: 20, color: AppColor.grey),
                        ),
                      ]),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "96".tr,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColor.grey),
                        ),
                        Text(
                          "\$ $shipping",
                          style: const TextStyle(
                              fontSize: 20, color: AppColor.grey),
                        ),
                      ]),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "97".tr,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColor.grey),
                        ),
                        Text(
                          "- \$ $discount",
                          style: const TextStyle(
                              fontSize: 20, color: AppColor.grey),
                        ),
                      ]),
                  const Divider(
                    color: AppColor.black,
                    thickness: .8,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "75".tr,
                          style: const TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "\$ ${controller.totalPrice + shipping - controller.couponValue!}",
                          style: const TextStyle(
                              fontSize: 23,
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ])
                ],
              )),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 3),
            margin: const EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.primaryColor,
            ),
            child: MaterialButton(
              onPressed: () {
                controller.goToCheckOut();
              },
              child: Text(
                "98".tr,
                style: const TextStyle(
                    fontSize: 20, color: AppColor.backgroundColor),
              ),
            ),
          )
        ],
      ),
    );
  }
}
