import 'package:chat_app/Core/constant.dart';
import 'package:chat_app/Features/Chat/Data/message_model.dart';
import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  const Message({
    super.key,
    required this.message,
  });

  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          message.message,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        Text(
          checkDate(message.date!),
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
