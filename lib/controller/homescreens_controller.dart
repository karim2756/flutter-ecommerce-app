import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/view/screen/homepage.dart';
import 'package:my_project/view/screen/myfavorite.dart';
import 'package:my_project/view/screen/account.dart';
import 'package:my_project/view/screen/order/pending.dart';

abstract class HomeScreensController extends GetxController {
  changePage(int current) {}
}

class HomeScreensControllerImp extends HomeScreensController {
  int currentPage = 0;
  List<Widget> listPages = [
    const HomePage(),
   const PendingOrders(),
     const Account(),
 const MyFavorite()
  ];
  List titleBottomAppBar = ["63".tr, "64".tr, "65".tr, "66".tr];
  List<IconData> iconBottomAppBar = [
    Icons.home_outlined,
    Icons.shopping_bag_outlined,
    Icons.person_2_outlined,
    Icons.favorite_border_outlined
  ];
  @override
  changePage(int current) {
    currentPage = current;
    update();
  }
}
