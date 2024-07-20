import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/applink.dart';
import 'package:my_project/controller/myfavorite_controller.dart';
import 'package:my_project/core/constant/color.dart';
import 'package:my_project/core/localization/translatedatabase.dart';
import 'package:my_project/data/model/myfavoritemodel.dart';

class CustomListFavoriteItems extends GetView<MyFavoriteController> {
  final MyFavoriteModel myFavoriteModel;
  const CustomListFavoriteItems({super.key, required this.myFavoriteModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          shape:
              BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: Colors.grey[200],
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                Hero(
                  tag: myFavoriteModel.itemsId!,
                  child: CachedNetworkImage(
                    imageUrl:
                        "${AppLink.imageItems}/${myFavoriteModel.itemsImage!}",
                    width: 150,
                    height: 150,
                  ),
                ),
                Text(
                  "${translateDatabase(myFavoriteModel.itemsName!, myFavoriteModel.itemsNameAr!)}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      " \$${myFavoriteModel.itemsPrice! - myFavoriteModel.itemsPrice! * myFavoriteModel.itemsDiscount! / 100}",
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColor.primaryColor),
                    ),
                    IconButton(
                        onPressed: () {
                          controller
                              .delteData(myFavoriteModel.favoriteId.toString());
                        },
                        icon: const Icon(
                          Icons.delete_forever_outlined,
                          size: 30,
                          color: AppColor.red,
                        ))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
