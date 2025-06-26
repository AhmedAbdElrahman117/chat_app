import 'package:chat_app/Features/Auth/Presentation/Views/Widgets/sign_text.dart';
import 'package:flutter/material.dart';

class CreateAccountText extends StatelessWidget {
  const CreateAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return SignText(
      text: 'Don\'t Have An Account \t',
      pressedText: 'Sign Up',
      onTap: () {
        Navigator.pushNamed(context, 'signup');
      },
    );
  }
}
