// ignore_for_file: deprecated_member_use, library_private_types_in_public_api

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:splash/src/core/widgets/colors.dart';
import 'package:splash/src/core/widgets/customized_text_field.dart';
import 'package:splash/src/features/login/presentation/pages/signin_page.dart';
import 'package:splash/src/features/signup/presentation/bloc/signup_bloc.dart';
import 'package:splash/src/features/signup/presentation/bloc/signup_event.dart';
import 'package:splash/src/features/signup/presentation/widgets/sign_up_elevated_button_widgets.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
            padding: const EdgeInsets.all(10),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildAppLogo(),
                  const SizedBox(height: 16.0),
                  _buildImage(context),
                  const SizedBox(height: 60.0),
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
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  // _buildButton(context),
                  CustomizedButton(
                    buttonTitle: "Submit",
                    foregroundColor: Palette.primaryColor,
                    backgroundColor: Palette.secondaryColor,
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
                  ),
                  const SizedBox(height: 16.0),
                  _buildAlreadyHaveAnAccount(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAlreadyHaveAnAccount() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Already have an account? ',
          style: TextStyle(color: Palette.whiteColor),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SigninPage()),
            );
          },
          child: const Text(
            'LogIn',
            style: TextStyle(
              color: Palette.whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
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
        backgroundColor: Palette.whiteColor,
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

  Widget _buildAppLogo() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          'assets/images/logo.svg',
          fit: BoxFit.contain,
          color: Palette.whiteColor,
          height: 36,
        ),
        const Text(
          "InfoStream",
          style: TextStyle(
            color: Palette.whiteColor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        )
      ],
    );
  }
}
