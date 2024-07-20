import 'package:flutter/material.dart';
import 'package:my_project/core/constant/color.dart';

class CustomButtonLanguage extends StatelessWidget {
  const CustomButtonLanguage(
      {super.key,
      required this.textButton,
      this.onPressed,
      required this.image});
  final String textButton;
  final String image;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 70),
      width: double.infinity,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        color: AppColor.primaryColor,
        textColor: Colors.white,
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              image,
              width: 45,
            ),
            Text(
              textButton,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
