import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/applink.dart';
import 'package:my_project/controller/cart_controller.dart';
import 'package:my_project/core/class/handlingdataview.dart';
import 'package:my_project/core/localization/translatedatabase.dart';
import 'package:my_project/view/widget/cart/bottom_navigationbar_cart.dart';
import 'package:my_project/view/widget/cart/cartview.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(
      () => CartController(),
    );


    return Scaffold(
      appBar: AppBar(title: Text("72".tr),
      ),
        bottomNavigationBar: GetBuilder<CartController>(
          builder: (cartController) => BottomNavigationBarCart(
            couponController: cartController.couponController,
            price: cartController.totalPrice,
            discount: cartController.couponValue!,
            shipping: 55,
            couponApply: () {
              cartController.coupon();
            },
          ),
          
        ),
        body: GetBuilder<CartController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.all(10),
              child: ListView(children: [
                
                ...List.generate(
                    controller.data.length,
                    (index) => CartView(
                          onAdd: () async {
                            await controller
                                .add(controller.data[index].itemsId.toString());
                            controller.refreshPage();
                          },
                          onRemove: () async {
                            await controller.delete(
                                controller.data[index].itemsId.toString());
                            controller.refreshPage();
                          },
                          name:
                              "${translateDatabase(controller.data[index].itemsName, controller.data[index].itemsNameAr)}",
                          price: controller.data[index].itemsprice!,
                          itemImage:
                              "${AppLink.imageItems}/${controller.data[index].itemsImage!}",
                          count: "${controller.data[index].countitems}",
                        ))
              ]),
            ),
          ),
        ));
  }
}
