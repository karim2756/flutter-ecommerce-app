import 'package:flutter/material.dart';

class CustomBodyAuth extends StatelessWidget {
  const CustomBodyAuth({super.key,required this.bodyText});
final String bodyText;
  @override
  Widget build(BuildContext context) {
    return Text(
             bodyText ,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            );
  }
}