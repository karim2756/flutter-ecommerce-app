import 'package:flutter/material.dart';
import 'package:my_project/core/constant/color.dart';

class CustomButtonAuth extends StatelessWidget {
  const CustomButtonAuth({super.key, required this.text, this.onPressed});
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(height: 50,
      margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        color: AppColor.primaryColor,
        textColor: Colors.white,
        onPressed: onPressed,
        child: Text(text,style: const TextStyle(fontSize: 20),),
      ),
    );
  }
}
