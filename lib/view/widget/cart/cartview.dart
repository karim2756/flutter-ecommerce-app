import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_project/core/constant/color.dart';

class CartView extends StatelessWidget {
  final String name;
  final String itemImage;
  final String count;
  final void Function()? onAdd;
  final void Function()? onRemove;

  final String price;
  const CartView(
      {super.key,
      required this.name,
      required this.price,
      required this.itemImage,
      required this.count,
      required this.onAdd,
      required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: AppColor.primaryColor,
      elevation: 2,
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                  color: AppColor.grey.withOpacity(.2),
                  child: CachedNetworkImage(
                    imageUrl: itemImage,
                  ))),
          Expanded(
              flex: 2,
              child: ListTile(
                title: Text(
                  "$name \n",
                  style: const TextStyle(
                    fontSize: 19,
                  ),
                ),
                subtitle: Text(
                  "\$ $price",
                  style: const TextStyle(
                      color: AppColor.primaryColor,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              )),
          Expanded(
              child: Column(
            children: [
              SizedBox(
                  height: 60,
                  child: IconButton(
                      onPressed: onAdd, icon: const Icon(Icons.add))),
              Text(
                count,
                style: const TextStyle(fontSize: 17),
              ),
              IconButton(
                  onPressed: onRemove, icon: const Icon(Icons.minimize))
            ],
          )),
        ],
      ),
    );
  }
}
