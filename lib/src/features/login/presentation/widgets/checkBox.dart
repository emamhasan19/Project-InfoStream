import 'package:flutter/material.dart';
import 'package:splash/src/core/widgets/colors.dart';
import 'package:splash/src/core/widgets/text_style.dart';

class CheckBox extends StatefulWidget {
  const CheckBox({Key? key}) : super(key: key);

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool _rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
              value: _rememberMe,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              activeColor: Palette.whiteColor,
              checkColor: Palette.primaryColor,
              fillColor: MaterialStateProperty.all(
                Palette.whiteColor,
              ),
              onChanged: (value) {
                setState(() {
                  _rememberMe = value!;
                });
              },
              //inactiveTrackColor: Colors.white,
            ),
            const PlainTextStyle(
              text: 'Remember me',
              size: 16,
              color: Palette.whiteColor,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
