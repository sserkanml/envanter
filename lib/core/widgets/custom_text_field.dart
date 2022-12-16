import 'package:aden_envanterus/core/service/dependecy_service.dart';
import 'package:aden_envanterus/feature/authentication/view_model/get_login.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.hintext,
      this.suffixIcon,
      this.prefixIcon,
      this.obscureText,
      required this.inputType,
      this.focusNode,
      this.controller})
      : super(key: key);
  final String hintext;
  final Widget? suffixIcon;
  final TextInputType inputType;
  final bool? obscureText;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: (value) {
        if (inputType == TextInputType.emailAddress) {
       
          getIt.get<AuthenticateUser>().email = controller?.text  ?? '';
        } else {
          getIt.get<AuthenticateUser>().password = controller?.text ?? '';
    
        }
      },
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
