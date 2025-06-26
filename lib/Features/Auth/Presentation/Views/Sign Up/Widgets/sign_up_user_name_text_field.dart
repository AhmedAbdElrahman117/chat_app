import 'package:chat_app/Features/Auth/Presentation/Views/Widgets/email_text_field.dart';
import 'package:flutter/material.dart';

class SignUpUserNameTextField extends StatelessWidget {
  const SignUpUserNameTextField({super.key, required this.usernameController});

  final TextEditingController usernameController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: EmailTextField(
        text: 'UserName',
        icon: Icons.person,
        controller: usernameController,
        onTap: () {},
        onChanged: (value) {},
        validator: (value) {
          if (value!.isEmpty) {
            return 'Name Required';
          } else {
            return null;
          }
        },
      ),
    );
  }
}
