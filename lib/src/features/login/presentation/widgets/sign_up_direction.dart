import 'package:flutter/material.dart';
import 'package:splash/src/core/widgets/colors.dart';
import 'package:splash/src/core/widgets/text_style.dart';
import 'package:splash/src/features/signup/presentation/pages/signup.dart';

class SignupDirection extends StatelessWidget {
  const SignupDirection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const PlainTextStyle(
          text: "Don't have an account?",
          size: 16,
          color: Palette.whiteColor,
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignUp(),
              ),
            );
          },
          child: const BoldTextStyle(
            text: "Sign up",
            size: 18,
            color: Palette.whiteColor,
          ),
        ),
      ],
    );
  }
}
