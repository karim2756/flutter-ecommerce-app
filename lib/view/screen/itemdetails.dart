import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/applink.dart';
import 'package:my_project/controller/itemdetails_controller.dart';
import 'package:my_project/core/class/handlingdataview.dart';
import 'package:my_project/core/constant/color.dart';
import 'package:my_project/view/widget/items/bottomnavigationitems.dart';
import 'package:my_project/view/widget/items/itemcounter.dart';
import 'package:my_project/view/widget/items/itemdescription.dart';
import 'package:my_project/view/widget/items/itemname.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ItemDetailsControllerImp controller = Get.put(ItemDetailsControllerImp());
    return Scaffold(
      bottomNavigationBar: const BottomNavigationBarItems(),
      body: ListView(
        children: [
          Stack(clipBehavior: Clip.none, children: [
            Container(height: 330, color: AppColor.grey.withOpacity(0.1)),
            Positioned(
              right: 10,
              left: 10,
              top: 50,
              child: Hero(
                tag: controller.itemsModel.itemsId!,
                child: CachedNetworkImage(
                  imageUrl:
                      "${AppLink.imageItems}/${controller.itemsModel.itemsImage!}",
                  height: 250,
                ),
              ),
            ),
          ]),
          const SizedBox(
            height: 15,
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: GetBuilder<ItemDetailsControllerImp>(
                builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ItemName(),
                      SizedBox(
                        height: 20,
                      ),
                      ItemDescription(),
                      SizedBox(
                        height: 30,
                      ),
                      ItemCounter()
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
