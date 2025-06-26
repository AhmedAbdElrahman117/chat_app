import 'package:chat_app/Features/Auth/Presentation/Views/Widgets/email_text_field.dart';
import 'package:flutter/material.dart';

class SignUpEmailTextField extends StatelessWidget {
  const SignUpEmailTextField({super.key, this.controller});

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: EmailTextField(
        text: 'Email',
        icon: Icons.email,
        controller: controller,
        validator: (value) {
          RegExp regExp =
              RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$', multiLine: true);
          if (value!.isEmpty) {
            return 'Email Required';
          } else {
            if (regExp.hasMatch(value)) {
              return null;
            } else {
              return 'Invalid Email';
            }
          }
        },
      ),
    );
  }
}
