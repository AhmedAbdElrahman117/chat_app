import 'package:chat_app/Features/Auth/Presentation/Views/Widgets/email_text_field.dart';
import 'package:flutter/material.dart';

class LoginEmailTextField extends StatelessWidget {
  const LoginEmailTextField({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: EmailTextField(
        text: 'Email',
        icon: Icons.email,
        controller: emailController,
        validator: (value) {
          RegExp regExp =
              RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$', multiLine: true);
          if (regExp.hasMatch(value!)) {
            return null;
          } else {
            return 'Invalid Email';
          }
        },
      ),
    );
  }
}
