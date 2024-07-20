import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSearch extends StatelessWidget {
  final  Function(String) onChanged;
final TextEditingController? textController;
final void Function()? onIconPressed;

  const CustomSearch({super.key,required this.onChanged, required this.textController,required this.onIconPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
                  height: 50,
                  child: TextFormField(
                    onChanged: onChanged,
                    controller: textController,
                    decoration: InputDecoration(
                        fillColor: Colors.grey[200],
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        suffixIcon:  IconButton(onPressed: onIconPressed, icon: const Icon(Icons.search_outlined)),
                        hintText: "55".tr,
                        hintStyle: const TextStyle(fontSize: 15)),
                    textAlign: TextAlign.start,
                  ),
                );
  }
}