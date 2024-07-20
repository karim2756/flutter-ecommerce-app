import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:my_project/controller/myfavorite_controller.dart';
import 'package:my_project/core/class/handlingdataview.dart';
import 'package:my_project/view/widget/favorite/listfavoriteitems.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() =>  MyFavoriteController());

    return  Scaffold(
      appBar: AppBar(
        title: Text("66".tr),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<MyFavoriteController>(
          builder: (controller) => ListView(children: [
            
            HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: .63, crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return CustomListFavoriteItems(
                        myFavoriteModel: controller.data[index]);
                  },
                ))
          ]),
        ),
      )
    );
   
  }
}
