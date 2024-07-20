import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/applink.dart';
import 'package:my_project/controller/favorite_controller.dart';
import 'package:my_project/controller/items_controller.dart';
import 'package:my_project/core/constant/color.dart';
import 'package:my_project/core/constant/imageasset.dart';
import 'package:my_project/core/localization/translatedatabase.dart';
import 'package:my_project/data/model/itemsmodel.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;
  const CustomListItems({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          controller.goToItemssDetails(itemsModel);
        },
        child: Stack(children: [
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            shape:
                BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.grey[200],
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                children: [
                  Hero(
                    tag: itemsModel.itemsId!,
                    child: CachedNetworkImage(
                      imageUrl:
                          "${AppLink.imageItems}/${itemsModel.itemsImage!}",
                      width: 150,
                      height: 150,
                    ),
                  ),
                  Text(
                    "${translateDatabase(itemsModel.itemsName!, itemsModel.itemsNameAr!)}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        " \$${itemsModel.itemsPriceDiscount!}",
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaryColor),
                      ),
                      GetBuilder<FavoriteController>(
                        builder: (controller) => IconButton(
                            onPressed: () {
                              if (controller.isFavorite[itemsModel.itemsId] ==
                                  1) {
                                controller.setFavorite(itemsModel.itemsId, 0);
                                controller.removeFavortie(
                                    itemsModel.itemsId.toString());
                              } else {
                                controller.setFavorite(itemsModel.itemsId,1);
                                controller
                                    .addFavorite(itemsModel.itemsId.toString());
                              }
                            },
                            icon: Icon(
                              controller.isFavorite[itemsModel.itemsId] == 1
                                  ? Icons.favorite_rounded
                                  : Icons.favorite_outline_outlined,
                              color: AppColor.red,
                              size: 30,
                            )),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          itemsModel.itemsDiscount != 0
              ? Positioned(
                  left: -10,
                  top: -10,
                  child: Image.asset(
                    AppImageAsset.discount,
                    width: 80,
                  ),
                )
              : Container()
        ]));
  }
}
