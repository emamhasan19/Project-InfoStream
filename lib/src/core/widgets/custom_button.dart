// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback buttonFunction;
  final double borderRadius;
  final Color? textColor;
  final Color? borderColor;
  final Color? backgroundColor;
  final double fontSize;
  bool outlined;
  final double height;

  CustomButton({
    super.key,
    required this.buttonTitle,
    required this.buttonFunction,
    this.borderRadius = 8,
    this.backgroundColor,
    this.textColor,
    this.fontSize = 16.0,
    this.outlined = false,
    this.borderColor = Colors.white,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    return outlined
        ? OutlinedButton(
            onPressed: buttonFunction,
            style: OutlinedButton.styleFrom(
              minimumSize: Size(double.minPositive, height),
              // primary: Colors.white,
              // backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              side: BorderSide(color: borderColor!),
            ),
            child: Text(
              buttonTitle,
              style: TextStyle(fontSize: fontSize, color: textColor),
            ),
          )
        : ElevatedButton(
            onPressed: buttonFunction,
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              minimumSize: Size(double.maxFinite, height),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
            child: Text(
              buttonTitle,
              style: TextStyle(fontSize: fontSize, color: textColor),
            ),
          );
  }
}
