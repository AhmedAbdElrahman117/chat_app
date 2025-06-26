import 'package:chat_app/Features/Chat/Presentation/Views/Widgets/message_text_field.dart';
import 'package:chat_app/Features/Chat/Presentation/Views/Widgets/send_button.dart';
import 'package:flutter/material.dart';

class SendMessage extends StatelessWidget {
  const SendMessage({
    super.key,
    required this.messageKey,
    required this.messageController,
  });

  final GlobalKey<FormState> messageKey;
  final TextEditingController messageController;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          boxShadow: const [
            BoxShadow(
              spreadRadius: 1,
              blurRadius: 1,
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: MessageTextField(
                messageController: messageController,
              ),
            ),
            const SizedBox(width: 16),
            SendButton(
              messageController: messageController,
              messageKey: messageKey,
            ),
          ],
        ),
      ),
    );
  }
}
