import 'package:flutter/material.dart';
import 'package:info_stream/src/core/colors.dart';
import 'package:info_stream/src/core/routes/routes.dart';
import 'package:info_stream/src/core/widgets/custom_button.dart';
import 'package:info_stream/src/core/widgets/custom_text_style.dart';
import 'package:info_stream/src/core/widgets/logo.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Logo(logoSize: 36),
                  const SizedBox(height: 200),
                  const CustomTextStyle(
                    text: "Welcome to InfoStream",
                    size: 26,
                    color: AppColors.secondaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: CustomTextStyle(
                      text: "A place to connect with anybody at anytime!!",
                      color: AppColors.secondaryColor,
                      textAlign: TextAlign.center,
                      size: 18,
                    ),
                  ),
                  const SizedBox(height: 200),
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      outlined: true,
                      buttonTitle: "Sign In",
                      buttonFunction: () {
                        Navigator.pushNamed(context, Routes.signIn);
                      },
                      borderColor: AppColors.secondaryColor,
                      textColor: AppColors.secondaryColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      buttonTitle: "Sign Up",
                      buttonFunction: () {
                        Navigator.pushNamed(context, Routes.signUp);
                      },
                      textColor: AppColors.primaryColor,
                      backgroundColor: AppColors.secondaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
