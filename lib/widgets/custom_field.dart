import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key, this.hintext, this.onchange, this.obsurText = false,this.inputTyp});
  String? hintext;
  Function(String)? onchange;
  bool? obsurText;
  TextInputType? inputTyp;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: inputTyp,
      onChanged: onchange,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        hintStyle: TextStyle(color: Colors.grey),
        hintText: hintext,
      ),
    );
  }
}
