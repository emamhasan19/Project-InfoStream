import 'package:flutter/material.dart';
import 'package:splash/src/core/widgets/colors.dart';
import 'package:splash/src/core/widgets/custom_button.dart';
import 'package:splash/src/core/widgets/custom_text_style.dart';
import 'package:splash/src/core/widgets/logo.dart';
import 'package:splash/src/features/signin/presentation/pages/signin_page.dart';
import 'package:splash/src/features/signup/presentation/pages/signup_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Palette.primaryColor,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Logo(logoSize: 36),
              const SizedBox(height: 200),
              const CustomTextStyle(
                text: "Welcome to InfoStream",
                size: 26,
                color: Palette.secondaryColor,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: CustomTextStyle(
                  text: "A place to connect with anybody at anytime!!",
                  color: Palette.secondaryColor,
                  textAlign: TextAlign.center,
                  size: 18,
                ),
              ),
              const SizedBox(height: 200),
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  outlined: true,
                  buttonTitle: "Login",
                  buttonFunction: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInPage(),
                      ),
                    );
                  },
                  borderColor: Palette.secondaryColor,
                  textColor: Palette.secondaryColor,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  buttonTitle: "Signup",
                  buttonFunction: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpPage(),
                      ),
                    );
                  },
                  textColor: Palette.primaryColor,
                  backgroundColor: Palette.secondaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
