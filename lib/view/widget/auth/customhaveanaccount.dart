import 'package:flutter/material.dart';
import 'package:my_project/core/constant/color.dart';

class CustomHaveAnAccount extends StatelessWidget {
  const CustomHaveAnAccount({super.key, required this.text, required this.textTwo, this.onTap});
final String text;
final String textTwo;
 final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 18),
        ),
        InkWell(onTap: onTap,
          child: Text(
            textTwo,
            style: const TextStyle(
                color: AppColor.primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
