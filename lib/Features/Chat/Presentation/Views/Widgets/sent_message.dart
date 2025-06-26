import 'package:chat_app/Features/Chat/Data/message_model.dart';
import 'package:chat_app/Features/Chat/Presentation/Views/Widgets/message.dart';
import 'package:chat_app/Features/Chat/Presentation/Views/Widgets/send_message_container.dart';
import 'package:flutter/material.dart';

class SentMessage extends StatelessWidget {
  const SentMessage({
    super.key,
    required this.message,
  });

  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return SendMessageContainer(
      child: Message(message: message),
    );
  }
}
