// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:splash/src/core/widgets/colors.dart';

class Logo extends StatelessWidget {
  const Logo({super.key, required this.logoSize});
  final double logoSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/images/logo.svg',
          color: Palette.secondaryColor,
          height: logoSize * 2,
        ),
        Text(
          "InfoStream",
          style: TextStyle(
            color: Palette.secondaryColor,
            fontWeight: FontWeight.bold,
            fontSize: logoSize,
          ),
        )
      ],
    );
  }
}
