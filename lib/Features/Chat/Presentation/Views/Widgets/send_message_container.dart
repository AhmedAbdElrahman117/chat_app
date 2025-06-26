import 'package:flutter/material.dart';

class SendMessageContainer extends StatelessWidget {
  const SendMessageContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    const double radius = 16;
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Material(
          elevation: 20,
          borderRadius: BorderRadius.circular(radius),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.amberAccent.shade700,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(radius),
                bottomRight: Radius.circular(radius),
                topRight: Radius.circular(radius),
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
