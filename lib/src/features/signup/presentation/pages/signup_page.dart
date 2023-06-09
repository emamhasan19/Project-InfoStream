// ignore_for_file: deprecated_member_use, library_private_types_in_public_api

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:splash/src/core/widgets/colors.dart';
import 'package:splash/src/core/widgets/custom_button.dart';
import 'package:splash/src/core/widgets/custom_snackbar.dart';
import 'package:splash/src/core/widgets/custom_text_field.dart';
import 'package:splash/src/core/widgets/custom_text_style.dart';
import 'package:splash/src/core/widgets/logo.dart';
import 'package:splash/src/features/signin/presentation/pages/signin_page.dart';
import 'package:splash/src/features/signup/presentation/bloc/signup_bloc.dart';
import 'package:splash/src/features/signup/presentation/bloc/signup_event.dart';
import 'package:splash/src/features/signup/presentation/bloc/signup_state.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  XFile? _image;

  Future<void> _pickImage(BuildContext context) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = pickedFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Palette.primaryColor,
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
                    _buildImage(context),
                    const SizedBox(height: 32.0),
                    CustomTextField(
                      controller: _name,
                      hintText: 'Enter your name',
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    CustomTextField(
                      controller: _email,
                      hintText: 'Enter your email',
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    CustomTextField(
                      controller: _password,
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

  Widget _buildLoginNavigation() {
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
                builder: (context) => const SignInPage(),
              ),
            );
          },
          child: const CustomTextStyle(
            text: "Login",
            color: Palette.secondaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildImage(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _pickImage(context);
      },
      child: CircleAvatar(
        backgroundImage: _image != null ? FileImage(File(_image!.path)) : null,
        backgroundColor: Palette.secondaryColor,
        radius: 50,
        child: _image == null
            ? const Icon(
                Icons.add_a_photo,
                size: 30,
                color: Palette.primaryColor,
              )
            : null,
      ),
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return BlocConsumer<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state.status == SignUpStatus.success) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SignInPage(),
            ),
          );
        } else if (state.status == SignUpStatus.failure) {
          CustomSnackBar(context, 'Failed to signup');
        }
      },
      builder: (context, state) {
        if (state.status == SignUpStatus.loading) {
          return const CircularProgressIndicator(
            color: Palette.secondaryColor,
          );
        }
        return SizedBox(
          width: double.infinity,
          child: CustomButton(
            buttonTitle: "Sign Up",
            buttonFunction: () {
              if (_formKey.currentState?.validate() != false) {
                BlocProvider.of<SignUpBloc>(context).add(
                  SignUpSubmitted(
                    _name.text,
                    _email.text,
                    _password.text,
                    _image!,
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
