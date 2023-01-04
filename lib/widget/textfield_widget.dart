import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({
    Key? key,
    this.hintText,
    this.controller
  }) : super(key: key);

  TextEditingController? controller;
  String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText.toString(),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueAccent)
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueAccent,width: 2.0)
          )
      ),
    );
  }
}
