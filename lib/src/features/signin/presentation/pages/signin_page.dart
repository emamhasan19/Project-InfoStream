import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash/src/core/widgets/colors.dart';
import 'package:splash/src/core/widgets/custom_button.dart';
import 'package:splash/src/core/widgets/custom_snackbar.dart';
import 'package:splash/src/core/widgets/custom_text_field.dart';
import 'package:splash/src/core/widgets/custom_text_style.dart';
import 'package:splash/src/core/widgets/logo.dart';
import 'package:splash/src/features/signin/presentation/bloc/signin_bloc.dart';
import 'package:splash/src/features/signup/presentation/pages/signup_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Palette.primaryColor,
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Logo(logoSize: 36),
                    const SizedBox(height: 40),
                    CustomTextField(
                      controller: _emailController,
                      hintText: 'Enter your email',
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: _passwordController,
                      hintText: 'Enter your password',
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildRememberMeBox(),
                    const SizedBox(height: 16),
                    _buildLoginButton(context),
                    const SizedBox(height: 16),
                    _buildSignUpNavigation(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpNavigation(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomTextStyle(
          text: "Don't have an account?",
          color: Palette.secondaryColor,
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SignUpPage(),
              ),
            );
          },
          child: const CustomTextStyle(
            text: "Sign up",
            color: Palette.secondaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildRememberMeBox() {
    return Row(
      children: [
        Checkbox(
          value: _rememberMe,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          activeColor: Palette.secondaryColor,
          checkColor: Palette.primaryColor,
          fillColor: MaterialStateProperty.all(
            Palette.secondaryColor,
          ),
          onChanged: (value) {
            setState(() {
              _rememberMe = value!;
            });
          },
          //inactiveTrackColor: Colors.white,
        ),
        const CustomTextStyle(
          text: 'Remember me',
          color: Palette.secondaryColor,
        ),
      ],
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state.status == SignInStatus.success) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SignUpPage(),
            ),
          );
        } else if (state.status == SignInStatus.failure) {
          CustomSnackBar(context, 'Failed to login');
        }
      },
      builder: (context, state) {
        if (state.status == SignInStatus.loading) {
          return const CircularProgressIndicator(
            color: Palette.secondaryColor,
          );
        }
        return SizedBox(
          width: double.infinity,
          child: CustomButton(
            buttonTitle: "Login",
            buttonFunction: () {
              if (formKey.currentState!.validate()) {
                context.read<SignInBloc>().add(
                      SignInSubmitEvent(
                        email: _emailController.text.trim(),
                        password: _passwordController.text,
                      ),
                    );
              }
            },
            textColor: Palette.primaryColor,
            backgroundColor: Palette.secondaryColor,
          ),
        );
      },
    );
  }
}
