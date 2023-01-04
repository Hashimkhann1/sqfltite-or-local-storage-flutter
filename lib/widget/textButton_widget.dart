import 'package:flutter/material.dart';
import 'package:sqflite_practice/widget/text_widget.dart';

class TextButtonWidget extends StatelessWidget {
  TextButtonWidget(
      {Key? key,
      this.textColor,
      this.title,
      this.backgroundColor,
      this.pressed,
      this.elevation,
      this.padding,
      this.textSize})
      : super(key: key);
  String? title;
  Color? backgroundColor;
  Color? textColor;
  EdgeInsets? padding;
  double? elevation;
  double? textSize;
  VoidCallback? pressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: padding,
          elevation: elevation,
        ),
        onPressed: pressed,
        child: TextWidget(
          titile: title.toString(),
          textColor: textColor,
          textSize: textSize,
        ));
  }
}
