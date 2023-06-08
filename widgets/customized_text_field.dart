import 'package:flutter/material.dart';
import 'package:splash/src/core/widgets/colors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final Color textColor;
  final Color hintColor;
  final Color borderColor;
  final TextInputType? keyboardType;
  final bool obscureText;
  final FormFieldValidator<String>? validator;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.textColor = Colors.black,
    this.hintColor = Colors.grey,
    this.borderColor = Colors.grey,
    this.keyboardType,
    this.obscureText = false,
    this.validator,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Palette.whiteColor,
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.borderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.borderColor,
          ),
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: widget.hintColor,
        ),
        suffixIcon: widget.obscureText
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
                child: Icon(
                  _obscurePassword ? Icons.visibility : Icons.visibility_off,
                  color: Palette.primaryColor,
                ),
              )
            : null,
        errorStyle: const TextStyle(color: Palette.redColor),
      ),
      style: TextStyle(
        color: widget.textColor,
      ),
      obscureText: widget.obscureText && _obscurePassword,
      validator: widget.validator,
      cursorColor: Palette.blackColor,
      keyboardType: widget.keyboardType,
    );
  }
}
