
import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  const CustomTextFormAuth(
      {super.key,
      required this.hintText,
      required this.labelText,
      required this.icon,
      required this.myController,
      required this.valid,
      required this.isNumber,
      this.obsecureText});

  final String hintText;
  final String labelText;
  final IconData icon;
  final TextEditingController myController;
  final String? Function(String?) valid;
  final bool isNumber;
  final bool? obsecureText;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: TextFormField(
        obscureText:
            obsecureText == null || obsecureText == false ? false : true,
        keyboardType: isNumber
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: valid,
        controller: myController,
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 13),
            label: Text(
              " $labelText ",
              style: const TextStyle(fontSize: 20),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            suffixIcon: Icon(icon)),
      ),
    );
  }
}
