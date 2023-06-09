// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:splash/src/core/widgets/colors.dart';

CustomSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Center(
        child: Text(
          message,
          style: const TextStyle(color: Palette.primaryColor),
        ),
      ),
      backgroundColor: Palette.secondaryColor,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
  );
}
