import 'package:flutter/material.dart';
import 'package:my_project/core/constant/color.dart';

class CardPaymnetMethod extends StatelessWidget {
  final String title ;
  final  IconData icon;
  final bool isActive ;
  const CardPaymnetMethod({super.key, required this.title, required this.icon, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return  Container(
    
              height: 60,
              margin: const EdgeInsets.symmetric(horizontal: 60),
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.black),
                  color:isActive==true? AppColor.primaryColor:AppColor.backgroundColor,
                  borderRadius: BorderRadius.circular(15)),
              child:  ListTile(
                title: Text(
                 title,
                  style: TextStyle(
                      color:isActive==true? AppColor.backgroundColor: AppColor.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                trailing: Icon(
                icon,
                  color:isActive==true? AppColor.backgroundColor:AppColor.black,
                ),
              ),
            );
  }
}