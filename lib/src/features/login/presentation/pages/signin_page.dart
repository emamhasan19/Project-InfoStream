import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:splash/src/core/widgets/colors.dart';
import 'package:splash/src/core/widgets/customized_text_field.dart';
import 'package:splash/src/core/widgets/text_style.dart';
import 'package:splash/src/features/login/presentation/bloc/signin_page_bloc.dart';
import 'package:splash/src/features/login/presentation/widgets/sign_up_direction.dart';
import 'package:splash/src/features/signup/presentation/pages/signup.dart';
import 'package:splash/src/features/splash/widgets/logo.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
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
                    const Logo(),
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
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: _passwordController,
                      hintText: 'Enter your password',
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    _buildRememberMeBox(),
                    const SizedBox(height: 10),
                    _buildLoginButton(context),
                    const SizedBox(height: 10),
                    const SignupDirection(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRememberMeBox() {
    return Row(
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
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return BlocConsumer<SigninPageBloc, SigninPageState>(
      listener: (context, state) {
        if (state.status == SigninPageStatus.success) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SignUp(),
            ),
          );
        } else if (state.status == SigninPageStatus.failure) {
          //  Fluttertoast.showToast(msg: "users login failed");
        }
      },
      builder: (context, state) {
        if (state.status == SigninPageStatus.loading) {
          return const CircularProgressIndicator(
            color: Palette.whiteColor,
          );
        }
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Palette.primaryColor,
              backgroundColor: Palette.whiteColor,
            ),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                context.read<SigninPageBloc>().add(
                      SigninPageSubmitEvent(
                        email: _emailController.text.trim(),
                        password: _passwordController.text,
                      ),
                    );
              }
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: PlainTextStyle(
                text: 'Login',
                size: 20,
                color: Palette.primaryColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
