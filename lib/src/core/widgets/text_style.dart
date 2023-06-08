import 'package:flutter/material.dart';

class PlainTextStyle extends StatelessWidget {
  const PlainTextStyle(
      {Key? key, required this.text, required this.size, required this.color})
      : super(key: key);
  final String text;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
      ),
    );
  }
}

class BoldTextStyle extends StatelessWidget {
  const BoldTextStyle(
      {Key? key, required this.text, required this.size, required this.color})
      : super(key: key);
  final String text;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
