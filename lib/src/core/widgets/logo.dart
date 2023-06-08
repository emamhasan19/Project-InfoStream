// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:splash/src/core/widgets/colors.dart';

class LoginpageLogo extends StatelessWidget {
  const LoginpageLogo({super.key, required this.LoginpageLogoSize});
  final double LoginpageLogoSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/images/logo.svg',
          color: Palette.whiteColor,
          height: LoginpageLogoSize * 2,
        ),
        Text(
          "InfoStream",
          style: TextStyle(
            color: Palette.whiteColor,
            fontWeight: FontWeight.bold,
            fontSize: LoginpageLogoSize,
          ),
        )
      ],
    );
  }
}
