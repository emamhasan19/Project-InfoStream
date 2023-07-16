import 'package:flutter/material.dart';
import 'package:info_stream/src/core/colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.borderRadius = 8,
    this.textColor = Colors.black,
    this.hintColor = Colors.grey,
    this.borderColor = Colors.grey,
    this.keyboardType,
    this.obscureText = false,
    this.validator,
    required this.onChanged,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final double borderRadius;
  final Color textColor;
  final Color hintColor;
  final Color borderColor;
  final TextInputType? keyboardType;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final Function(String?) onChanged;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.secondaryColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          // borderSide: const BorderSide(
          //   color: Colors.red,
          //   width: 3,
          // ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
            color: widget.borderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
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
                  color: AppColors.primaryColor,
                ),
              )
            : null,
        errorStyle: const TextStyle(color: AppColors.redColor),
      ),
      style: TextStyle(
        color: widget.textColor,
      ),
      obscureText: widget.obscureText && _obscurePassword,
      validator: widget.validator,
      cursorColor: AppColors.blackColor,
      keyboardType: widget.keyboardType,
    );
  }
}
