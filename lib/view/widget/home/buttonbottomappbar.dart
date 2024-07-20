import 'package:flutter/material.dart';
import 'package:my_project/core/constant/color.dart';

class ButtonBottomAppBar extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final IconData icon;
  final bool active;
  const ButtonBottomAppBar({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: active == true ? AppColor.primaryColor : AppColor.grey,
            size: 30,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 15,
              color: active == true ? AppColor.primaryColor : AppColor.grey,
            ),
          )
        ],
      ),
    );
  }
}
