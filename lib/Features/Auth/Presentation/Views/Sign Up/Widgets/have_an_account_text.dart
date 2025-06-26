import 'package:chat_app/Features/Auth/Presentation/Views/Widgets/sign_text.dart';
import 'package:flutter/material.dart';

class HaveAnAccountText extends StatelessWidget {
  const HaveAnAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return SignText(
      text: 'Already Have An Account \t',
      pressedText: 'Login',
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
