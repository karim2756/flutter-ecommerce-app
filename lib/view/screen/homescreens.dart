import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/controller/homescreens_controller.dart';
import 'package:my_project/core/constant/color.dart';
import 'package:my_project/core/constant/pageroute.dart';
import 'package:my_project/core/functions/appexit.dart';
import 'package:my_project/view/widget/home/buttonbottomappbar.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(
      HomeScreensControllerImp(),
    );

    return GetBuilder<HomeScreensControllerImp>(
        builder: (controller) => Scaffold(
            backgroundColor: AppColor.backgroundColor,
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppColor.primaryColor,
              onPressed: () {
                Get.toNamed(AppRoutes.cart);
              },
              child: const Icon(Icons.shopping_cart_rounded),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              notchMargin: 8,
              child: Row(
                children: [
                  ...List.generate(controller.listPages.length + 1, ((index) {
                    int i = index > 2 ? index - 1 : index;
                    return index == 2
                        ? const Spacer()
                        : ButtonBottomAppBar(
                            icon: controller.iconBottomAppBar[i],
                            text: controller.titleBottomAppBar[i],
                            onPressed: () {
                              controller.changePage(i);
                            },
                            active: controller.currentPage == i ? true : false);
                  }))
                ],
              ),
            ),
            body: WillPopScope(
              child: controller.listPages.elementAt(controller.currentPage),
              onWillPop: () {
                appExit();
                return Future.value(false);
              },
            )));
  }
}
