// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:info_stream/src/core/colors.dart';

CustomSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Center(
        child: Text(
          message,
          style: const TextStyle(color: AppColors.primaryColor),
        ),
      ),
      backgroundColor: AppColors.secondaryColor,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
  );
}
