import 'package:flutter/material.dart';

class CustomTitleAuth extends StatelessWidget {
  const CustomTitleAuth({super.key, required this.titleText});
final String titleText;
  @override
  Widget build(BuildContext context) {
    return Text(
              titleText,
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ) ;
  }
}