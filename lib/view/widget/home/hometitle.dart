import 'package:flutter/material.dart';

class HomeTitle extends StatelessWidget {
  final String title;
  const HomeTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  child: Text(
                   title,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                );
  }
}