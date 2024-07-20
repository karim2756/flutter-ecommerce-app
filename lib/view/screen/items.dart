import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/controller/favorite_controller.dart';
import 'package:my_project/controller/items_controller.dart';
import 'package:my_project/core/class/handlingdataview.dart';
import 'package:my_project/data/model/itemsmodel.dart';
import 'package:my_project/view/widget/items/customlistitems.dart';
import 'package:my_project/view/widget/items/itemscategories.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    FavoriteController controllerFav = Get.put(FavoriteController());

    return Scaffold(appBar: AppBar(title: Text("67".tr),),
        body: Container(
      padding: const EdgeInsets.all(15),
      child: GetBuilder<ItemsControllerImp>(
          builder: (controller) => ListView(children: [
            
                const ItemsCategories(),
                const SizedBox(
                  height: 10,
                ),
                HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: .7),
                        itemCount: controller.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          controllerFav.isFavorite[controller.data[index]
                                  ['items_id']] =
                              controller.data[index]['favorite'];
                          return CustomListItems(
                              itemsModel:
                                  ItemsModel.fromJson(controller.data[index]));
                        }))
              ])),
    ));
  }
}
