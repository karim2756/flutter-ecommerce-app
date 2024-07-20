import 'package:flutter/material.dart';
import 'package:my_project/core/constant/color.dart';

class CardAddress extends StatelessWidget {
  final String title ;
  final String subtitle;
  final bool isActive ;
  const CardAddress({super.key, required this.title, required this.subtitle, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return  Card(
                color:isActive==true? AppColor.primaryColor:AppColor.backgroundColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
        
                    child:  ListTile(
                  title: Text(
                   title,
                    style: TextStyle(
                        color: isActive==true?AppColor.backgroundColor:AppColor.black, fontSize: 22),
                  ),
                  subtitle: Text(
                    subtitle,
                    style: TextStyle(
                       color:isActive==true?  AppColor.backgroundColor:AppColor.grey, fontSize: 18),
                  ),
                ));
  }
}