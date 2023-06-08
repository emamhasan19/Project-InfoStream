import 'package:flutter/material.dart';

class CustomizedButton extends StatelessWidget {
  final String buttonTitle;

  final VoidCallback buttonFunction;

  final double borderRadius;

  final Color? foregroundColor;

  final Color? backgroundColor;

  final double fontSize;

  CustomizedButton({
    super.key,
    required this.buttonTitle,
    required this.buttonFunction,
    this.borderRadius = 8,
    this.backgroundColor,
    this.foregroundColor,
    this.fontSize = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: buttonFunction,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: Text(
        buttonTitle,
        style: TextStyle(fontSize: fontSize, color: foregroundColor),
      ),
    );
  }
}
