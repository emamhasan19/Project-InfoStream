import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:info_stream/src/core/colors.dart';
import 'package:info_stream/src/core/typography/fonts.dart';

class AppTypography {
  static TextStyle _getTextStyle(
      double fontSize,
      String fontFamily,
      FontWeight fontWeight,
      Color color,
      ) {
    return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle regular8({Color? color}) {
    return _getTextStyle(
      FontSize.s8,
      FontConstants.fontFamily,
      FontWeightManager.regular,
      color ?? AppColors.black,
    );
  }

  static TextStyle regular10({Color? color}) {
    return _getTextStyle(
      FontSize.s10,
      FontConstants.fontFamily,
      FontWeightManager.regular,
      color ?? AppColors.black,
    );
  }

  static TextStyle light12({Color? color}) {
    return _getTextStyle(
      FontSize.s12.sp,
      FontConstants.fontFamily,
      FontWeightManager.light,
      color ?? AppColors.black,
    );
  }

  static TextStyle regular12({Color? color}) {
    return _getTextStyle(
      FontSize.s12.sp,
      FontConstants.fontFamily,
      FontWeightManager.regular,
      color ?? AppColors.black,
    );
  }

  static TextStyle semiBold12({Color? color}) {
    return _getTextStyle(
      FontSize.s12.sp,
      FontConstants.fontFamily,
      FontWeightManager.semiBold,
      color ?? AppColors.black,
    );
  }

  static TextStyle bold12({Color? color}) {
    return _getTextStyle(
      FontSize.s12.sp,
      FontConstants.fontFamily,
      FontWeightManager.bold,
      color ?? AppColors.black,
    );
  }

  static TextStyle light14({Color? color}) {
    return _getTextStyle(
      FontSize.s14.sp,
      FontConstants.fontFamily,
      FontWeightManager.light,
      color ?? AppColors.black,
    );
  }

  static TextStyle regular14({Color? color}) {
    return _getTextStyle(
      FontSize.s14.sp,
      FontConstants.fontFamily,
      FontWeightManager.regular,
      color ?? AppColors.black,
    );
  }

  static TextStyle semiBold14({Color? color}) {
    return _getTextStyle(
      FontSize.s14.sp,
      FontConstants.fontFamily,
      FontWeightManager.semiBold,
      color ?? AppColors.black,
    );
  }

  static TextStyle bold14({Color? color}) {
    return _getTextStyle(
      FontSize.s14.sp,
      FontConstants.fontFamily,
      FontWeightManager.bold,
      color ?? AppColors.black,
    );
  }

  static TextStyle regular16({Color? color}) {
    return _getTextStyle(
      FontSize.s16.sp,
      FontConstants.fontFamily,
      FontWeightManager.regular,
      color ?? AppColors.black,
    );
  }

  static TextStyle semiBold16({Color? color}) {
    return _getTextStyle(
      FontSize.s16.sp,
      FontConstants.fontFamily,
      FontWeightManager.semiBold,
      color ?? AppColors.black,
    );
  }

  static TextStyle bold16({Color? color}) {
    return _getTextStyle(
      FontSize.s16.sp,
      FontConstants.fontFamily,
      FontWeightManager.bold,
      color ?? AppColors.black,
    );
  }

  static TextStyle regular18({Color? color}) {
    return _getTextStyle(
      FontSize.s18.sp,
      FontConstants.fontFamily,
      FontWeightManager.regular,
      color ?? AppColors.black,
    );
  }

  static TextStyle semiBold18({Color? color}) {
    return _getTextStyle(
      FontSize.s18.sp,
      FontConstants.fontFamily,
      FontWeightManager.semiBold,
      color ?? AppColors.black,
    );
  }

  static TextStyle semiBold20({Color? color}) {
    return _getTextStyle(
      FontSize.s20.sp,
      FontConstants.fontFamily,
      FontWeightManager.semiBold,
      color ?? AppColors.black,
    );
  }

  static TextStyle bold18({Color? color}) {
    return _getTextStyle(
      FontSize.s18.sp,
      FontConstants.fontFamily,
      FontWeightManager.bold,
      color ?? AppColors.black,
    );
  }

  static TextStyle bold20({Color? color}) {
    return _getTextStyle(
      FontSize.s20.sp,
      FontConstants.fontFamily,
      FontWeightManager.bold,
      color ?? AppColors.black,
    );
  }

  static TextStyle bold22({Color? color}) {
    return _getTextStyle(
      FontSize.s22.sp,
      FontConstants.fontFamily,
      FontWeightManager.bold,
      color ?? AppColors.black,
    );
  }

  static TextStyle regular24({Color? color}) {
    return _getTextStyle(
      FontSize.s24.sp,
      FontConstants.fontFamily,
      FontWeightManager.regular,
      color ?? AppColors.black,
    );
  }

  static TextStyle semiBold24({Color? color}) {
    return _getTextStyle(
      FontSize.s24.sp,
      FontConstants.fontFamily,
      FontWeightManager.semiBold,
      color ?? AppColors.black,
    );
  }

  static TextStyle bold24({Color? color}) {
    return _getTextStyle(
      FontSize.s24.sp,
      FontConstants.fontFamily,
      FontWeightManager.bold,
      color ?? AppColors.black,
    );
  }

  static TextStyle bold50({Color? color}) {
    return _getTextStyle(
      FontSize.s50.sp,
      FontConstants.fontFamily,
      FontWeightManager.bold,
      color ?? AppColors.black,
    );
  }
}
