// ignore_for_file: deprecated_member_use, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:info_stream/src/core/colors.dart';
import 'package:info_stream/src/core/routes/routes.dart';
import 'package:info_stream/src/core/widgets/custom_button.dart';
import 'package:info_stream/src/core/widgets/custom_snackbar.dart';
import 'package:info_stream/src/core/widgets/custom_text_field.dart';
import 'package:info_stream/src/core/widgets/custom_text_style.dart';
import 'package:info_stream/src/core/widgets/logo.dart';
import 'package:info_stream/src/features/signup/presentation/bloc/signup_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
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
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Logo(logoSize: 36),
                    const SizedBox(height: 40.0),
                    const SizedBox(height: 32.0),
                    _buildNameField(),
                    const SizedBox(height: 16.0),
                    _buildEmailField(),
                    const SizedBox(height: 16.0),
                    _buildPasswordField(),
                    const SizedBox(height: 16.0),
                    _buildSignUpButton(context),
                    const SizedBox(height: 16.0),
                    _buildLoginNavigation(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNameField() {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        return CustomTextField(
          controller: _nameController,
          onChanged: (value) =>
              context.read<SignUpBloc>().add(NameChangeEvent(name: value!)),
          hintText: 'Enter your name',
          keyboardType: TextInputType.name,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your name';
            }
            return null;
          },
        );
      },
    );
  }

  Widget _buildEmailField() {
    return CustomTextField(
      controller: _emailController,
      onChanged: (value) =>
          context.read<SignUpBloc>().add(EmailChangeEvent(email: value!)),
      hintText: 'Enter your email',
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        // print(value);
        if (value!.isEmpty) {
          return 'Please enter your email';
        }
        return null;
      },
    );
  }

  Widget _buildPasswordField() {
    return CustomTextField(
      controller: _passwordController,
      onChanged: (value) =>
          context.read<SignUpBloc>().add(PasswordChangeEvent(password: value!)),
      hintText: 'Enter your password',
      keyboardType: TextInputType.text,
      obscureText: true,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your password';
        }
        return null;
      },
    );
  }

  Widget _buildLoginNavigation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomTextStyle(
          text: "Don't have an account?",
          color: AppColors.secondaryColor,
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.signIn);
          },
          child: const CustomTextStyle(
            text: "Sign In",
            color: AppColors.secondaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return BlocConsumer<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state.status == SignUpStatus.success) {
          Navigator.pushNamed(context, Routes.signIn);
        } else if (state.status == SignUpStatus.failure) {
          CustomSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state.status == SignUpStatus.loading) {
          return const CircularProgressIndicator(
            color: AppColors.secondaryColor,
          );
        }
        return SizedBox(
          width: double.infinity,
          child: CustomButton(
            buttonTitle: "Sign Up",
            buttonFunction: () {
              if (_formKey.currentState?.validate() != false) {
                context.read<SignUpBloc>().add(SignUpSubmitted());
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
