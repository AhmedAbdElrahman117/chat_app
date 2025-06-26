import 'package:flutter/material.dart';

class SignText extends StatelessWidget {
  const SignText(
      {super.key, required this.text, required this.pressedText, this.onTap});

  final String text;
  final String pressedText;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            pressedText,
            style: const TextStyle(
              fontSize: 18,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.double,
            ),
          ),
        ),
      ],
    );
  }
}
