import 'package:flutter/material.dart';
import 'package:learning_language_app/const/color.dart';
import 'package:learning_language_app/const/typography.dart';

class SingleTextFieldWidget extends StatelessWidget {
  final IconData? icon;
  final bool obscureText;
  final TextEditingController? controller;

  const SingleTextFieldWidget({
    super.key,
    this.icon,
    this.obscureText = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: body,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorPallete.disabled),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorPallete.disabled),
        ),
        focusColor: ColorPallete.disabled,
        prefixIcon: icon != null ? Icon(icon) : null,
      ),
    );
  }
}
