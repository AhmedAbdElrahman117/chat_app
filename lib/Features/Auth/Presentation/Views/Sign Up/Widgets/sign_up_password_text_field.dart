import 'package:chat_app/Features/Auth/Presentation/Views/Widgets/password_text_field.dart';
import 'package:flutter/material.dart';

class SignUpPasswordTextField extends StatelessWidget {
  const SignUpPasswordTextField({super.key, required this.passwordController});

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return PasswordTextField(
      controller: passwordController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Password Required';
        } else {
          if (value.length < 8) {
            return 'Password Must Be at Least 8 Characters';
          } else {
            return null;
          }
        }
      },
    );
  }
}
