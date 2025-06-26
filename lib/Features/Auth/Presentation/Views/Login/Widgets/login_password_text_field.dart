import 'package:chat_app/Features/Auth/Presentation/Views/Widgets/password_text_field.dart';
import 'package:flutter/material.dart';

class LoginPasswordTextField extends StatelessWidget {
  const LoginPasswordTextField({
    super.key,
    required this.passwordController,
  });
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return PasswordTextField(
      controller: passwordController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Password Required';
        } else {
          return null;
        }
      },
    );
  }
}
