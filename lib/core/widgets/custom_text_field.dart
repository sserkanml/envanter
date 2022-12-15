import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.hintext,
      this.suffixIcon,
      this.prefixIcon,
      this.obscureText,
      required this.inputType,
      this.focusNode})
      : super(key: key);
  final String hintext;
  final Widget? suffixIcon;
  final TextInputType inputType;
  final bool? obscureText;
  final Widget? prefixIcon;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      onEditingComplete: () {
        if (focusNode == null) {
          return;
        } else {
          FocusScope.of(context).nextFocus();
        }
      },
      keyboardType: inputType,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
          prefixIcon: prefixIcon,
          hintText: hintext,
          suffixIcon: suffixIcon,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 8.0,
          ),
          border: const OutlineInputBorder()),
    );
  }
}
