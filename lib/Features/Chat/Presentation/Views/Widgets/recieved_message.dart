import 'package:chat_app/Features/Chat/Data/message_model.dart';
import 'package:chat_app/Features/Chat/Presentation/Views/Widgets/message.dart';
import 'package:chat_app/Features/Chat/Presentation/Views/Widgets/recieve_message_container.dart';
import 'package:flutter/material.dart';

class RecievedMessage extends StatelessWidget {
  const RecievedMessage({
    super.key,
    required this.message,
  });

  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return RecieveMessageContainer(
      child: Message(message: message),
    );
  }
}
