import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:info_stream/src/core/colors.dart';
import 'package:info_stream/src/core/routes/routes.dart';
import 'package:info_stream/src/core/widgets/custom_button.dart';
import 'package:info_stream/src/core/widgets/custom_snackbar.dart';
import 'package:info_stream/src/core/widgets/custom_text_field.dart';
import 'package:info_stream/src/core/widgets/custom_text_style.dart';
import 'package:info_stream/src/core/widgets/logo.dart';
import 'package:info_stream/src/features/signin/presentation/bloc/signin_bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
        backgroundColor: AppColors.primaryColor,
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
                    _buildEmailField(),
                    const SizedBox(height: 16),
                    _buildPasswordField(),
                    const SizedBox(height: 16),
                    _buildRememberMe(),
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

  Widget _buildEmailField() {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return CustomTextField(
          controller: _emailController,
          onChanged: (value) =>
              context.read<SignInBloc>().add(EmailChangeEvent(email: value!)),
          hintText: 'Enter your email',
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your email';
            }
            return null;
          },
        );
      },
    );
  }

  Widget _buildPasswordField() {
    return CustomTextField(
      controller: _passwordController,
      onChanged: (value) =>
          context.read<SignInBloc>().add(PasswordChangeEvent(password: value!)),
      hintText: 'Enter your password',
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your password';
        }
        return null;
      },
    );
  }

  Widget _buildRememberMe() {
    return Row(
      children: [
        BlocBuilder<SignInBloc, SignInState>(
          builder: (context, state) {
            return Checkbox(
              value: state.isRememberMe,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              activeColor: AppColors.secondaryColor,
              checkColor: AppColors.primaryColor,
              fillColor: MaterialStateProperty.all(
                AppColors.secondaryColor,
              ),
              onChanged: (value) => context.read<SignInBloc>().add(
                    RememberMeEvent(isRememberMe: value!),
                  ),
              //inactiveTrackColor: Colors.white,
            );
          },
        ),
        const CustomTextStyle(
          text: 'Remember me',
          color: AppColors.secondaryColor,
        ),
      ],
    );
  }

  Widget _buildSignUpNavigation(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomTextStyle(
          text: "Don't have an account?",
          color: AppColors.secondaryColor,
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.signUp);
          },
          child: const CustomTextStyle(
            text: "Sign Up",
            color: AppColors.secondaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state.status == SignInStatus.success) {
          Navigator.pushReplacementNamed(context, Routes.home);
        } else if (state.status == SignInStatus.failure) {
          CustomSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state.status == SignInStatus.loading) {
          return const CircularProgressIndicator(
            color: AppColors.secondaryColor,
          );
        }
        return SizedBox(
          width: double.infinity,
          child: CustomButton(
            buttonTitle: "Sign In",
            buttonFunction: () {
              if (formKey.currentState!.validate()) {
                context.read<SignInBloc>().add(SignInSubmitEvent());
                // Navigator.pushNamed(context, Routes.home);
              }
            },
            textColor: AppColors.primaryColor,
            backgroundColor: AppColors.secondaryColor,
          ),
        );
      },
    );
  }
}
