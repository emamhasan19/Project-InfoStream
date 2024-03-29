import 'package:flutter/material.dart';
import 'package:info_stream/src/core/colors.dart';

class CustomTextStyle extends StatelessWidget {
  const CustomTextStyle({
    Key? key,
    required this.text,
    this.size = 16,
    this.color = AppColors.blackColor,
    this.textAlign = TextAlign.left,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);
  final String text;
  final double size;
  final Color color;
  final TextAlign textAlign;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
    );
  }
}
