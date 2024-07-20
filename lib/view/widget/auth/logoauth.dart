import 'package:flutter/material.dart';
import 'package:my_project/core/constant/imageasset.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImageAsset.logo,height:180,);
  }
}