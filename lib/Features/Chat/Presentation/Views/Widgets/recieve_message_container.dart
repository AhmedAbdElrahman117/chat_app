import 'package:flutter/material.dart';

class RecieveMessageContainer extends StatelessWidget {
  const RecieveMessageContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    const double radius = 16;
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Material(
          elevation: 20,
          borderRadius: BorderRadius.circular(radius),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade300,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(radius),
                bottomRight: Radius.circular(radius),
                topLeft: Radius.circular(radius),
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
