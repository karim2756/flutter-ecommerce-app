import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/applink.dart';
import 'package:my_project/controller/home_controller.dart';
import 'package:my_project/core/constant/color.dart';
import 'package:my_project/core/localization/translatedatabase.dart';
import 'package:my_project/data/model/itemsmodel.dart';

class ListSearchItems extends GetView<HomeControllerImp> {
  final List<ItemsModel> listData;
  const ListSearchItems({super.key, required this.listData});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listData.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            controller.goToItemssDetails(listData[index]);
          },
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            child: Card(
              shadowColor: AppColor.black,
              elevation: 3,
              child: Row(
                children: [
                  Expanded(
                      child: Hero(
                    tag: listData[index].itemsId!,
                    child: CachedNetworkImage(
                      imageUrl:
                          "${AppLink.imageItems}/${listData[index].itemsImage!}",
                      height: 150,
                    ),
                  )),
                  Expanded(
                      flex: 2,
                      child: ListTile(
                        title: Text(
                          "${translateDatabase(listData[index].itemsName, listData[index].itemsNameAr)}",
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        subtitle: Text(
                          "\n\$ ${listData[index].itemsPriceDiscount}",
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: AppColor.primaryColor),
                        ),
                      )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
