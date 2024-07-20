import 'package:flutter/material.dart';
import 'package:my_project/core/constant/color.dart';

class CustomAppBar extends StatelessWidget {
  final String title;

  final IconData? icon;
  final void Function()? onPressedIcon;
  const CustomAppBar(
      {super.key, required this.title, this.onPressedIcon,required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize:25,fontWeight: FontWeight.bold),
          ),
          Container(
           height: 40,
           width: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                border: Border.all(color: AppColor.black),
                color: Colors.white),
            child: IconButton(onPressed: onPressedIcon, icon: Icon(icon,size: 25,)),
          )
        ],
      ),
    );
  }
}
