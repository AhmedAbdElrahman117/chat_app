import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Chat App',
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        shadows: [
          Shadow(
            blurRadius: 20,
            offset: Offset(4, 8),
            color: Colors.black87,
          ),
        ],
      ),
    );
  }
}
