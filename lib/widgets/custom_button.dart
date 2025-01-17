import 'package:flutter/material.dart';

class CustomButtonField extends StatelessWidget {
  CustomButtonField({super.key, this.text, required this.ontap});
  // VoidCallback? ontap;
  VoidCallback ontap;
  String? text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 14, 6, 88),
          borderRadius: BorderRadius.circular(30),
        ),
        width: double.infinity,
        height: 50,
        child: Center(
            child: Text(
          text!,
          style: TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}
