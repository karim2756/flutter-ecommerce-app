import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/controller/home_controller.dart';
import 'package:my_project/core/class/handlingdataview.dart';
import 'package:my_project/core/constant/imageasset.dart';
import 'package:my_project/view/widget/home/homecategories.dart';
import 'package:my_project/view/widget/home/customsearch.dart';
import 'package:my_project/view/widget/home/specialoffers.dart';
import 'package:my_project/view/widget/home/hometitle.dart';
import 'package:my_project/view/widget/home/offerbox.dart';
import 'package:my_project/view/widget/home/topselling.dart';
import 'package:my_project/view/widget/items/listsearchitems.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
        builder: (controller) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
              child: ListView(children: [
                Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      "56".tr,
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    )),
                CustomSearch(
                  textController: controller.search!,
                  onChanged: (val) {
                    controller.checkSearch(val);
                  },
                  onIconPressed: () {
                    controller.onSearch();
                  },
                ),
                HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: controller.isSearch == false
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              OfferBox(
                                  offerText: "68".tr,
                                  offerPercentage: "124".tr,
                                  image: AppImageAsset.phone),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "57".tr,
                                    style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const HomeCategories(),
                              HomeTitle(title: "59".tr),
                              const TopSellingItems(),
                              HomeTitle(title: "60".tr),
                              const SpecialOffers(),
                            ],
                          )
                        : ListSearchItems(listData: controller.listSearchData))
              ]),
            ));
  }
}
