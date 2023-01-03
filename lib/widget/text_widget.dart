import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  TextWidget({Key? key,required this.titile,this.textFontWeight,this.textSize,this.textColor}) : super(key: key);

  String? titile;
  Color? textColor;
  double? textSize;
  FontWeight? textFontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(titile.toString(),style: TextStyle(
      color: textColor,
      fontSize: textSize,
      fontWeight: textFontWeight
    ),);
  }
}
