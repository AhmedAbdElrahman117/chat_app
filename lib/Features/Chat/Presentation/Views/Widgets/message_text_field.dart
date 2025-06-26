import 'package:flutter/material.dart';

class MessageTextField extends StatelessWidget {
  const MessageTextField({super.key, required this.messageController});

  final TextEditingController messageController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: messageController,
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.top,
      style: const TextStyle(fontSize: 18),
      decoration: InputDecoration(
        border: border(),
        enabledBorder: border(),
        focusedBorder: border(),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Empty';
        } else {
          return null;
        }
      },
    );
  }

  OutlineInputBorder border() =>
      OutlineInputBorder(borderRadius: BorderRadius.circular(50));
}
