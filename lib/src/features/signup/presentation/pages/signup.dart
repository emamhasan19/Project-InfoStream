import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:splash/src/core/widgets/colors.dart';
import 'package:splash/src/features/signup/presentation/bloc/signup_bloc.dart';
import 'package:splash/src/features/signup/presentation/bloc/signup_event.dart';
import 'package:splash/src/features/signup/presentation/widgets/sign_up_elevated_button_widgets.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

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
                  _buildName(),
                  const SizedBox(height: 16.0),
                  _buildEmail(),
                  const SizedBox(height: 16.0),
                  _buildPassword(),
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
    return const Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Already have an account? ',
            style: TextStyle(color: Palette.whiteColor)),
        Text(
          'LogIn',
          style: TextStyle(
            color: Palette.whiteColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
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
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: const Text('Submit'),
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      controller: _password,
      style: const TextStyle(color: Palette.blackColor),
      decoration: const InputDecoration(
          hintText: "Password",
          border: OutlineInputBorder(),
          filled: true,
          fillColor: Palette.whiteColor,
          // hintStyle: TextStyle(color: Palette.blackColor),
          errorStyle: TextStyle(color: Palette.whiteColor)),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        return null;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      controller: _email,
      style: const TextStyle(color: Palette.blackColor),
      decoration: const InputDecoration(
          hintText: "Email",
          border: OutlineInputBorder(),
          filled: true,
          fillColor: Palette.whiteColor,
          // hintStyle: TextStyle(color: Palette.blackColor),
          errorStyle: TextStyle(color: Palette.whiteColor)),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }
        return null;
      },
    );
  }

  Widget _buildName() {
    return TextFormField(
      controller: _name,
      style: const TextStyle(color: Palette.blackColor),
      decoration: const InputDecoration(
          hintText: "Name",
          border: OutlineInputBorder(),
          filled: true,
          fillColor: Palette.whiteColor,
          // hintStyle: TextStyle(color: Palette.blackColor),
          errorStyle: TextStyle(color: Palette.whiteColor)),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your name';
        }
        return null;
      },
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
