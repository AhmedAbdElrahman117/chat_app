import 'package:chat_app/Features/Auth/Presentation/Views%20Model/Login%20Cubit/login_cubit.dart';
import 'package:chat_app/Features/Chat/Data/message_model.dart';
import 'package:chat_app/Features/Chat/Presentation/Views%20Model/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SendButton extends StatelessWidget {
  const SendButton({
    super.key,
    required this.messageKey,
    required this.messageController,
  });

  final GlobalKey<FormState> messageKey;
  final TextEditingController messageController;

  @override
  Widget build(BuildContext context) {
    return IconButton.filledTonal(
      onPressed: () async {
        if (messageKey.currentState!.validate()) {
          MessageModel message = MessageModel(
            message: messageController.text,
            senderId: BlocProvider.of<LoginCubit>(context).userData.uid,
            recieverId: BlocProvider.of<ChatCubit>(context)
                .currentChat!
                .participantsId
                .last,
          );

          await BlocProvider.of<ChatCubit>(context).sendMessage(
            chatId: BlocProvider.of<ChatCubit>(context).currentChat!.chatId,
            data: message.toMap(),
          );
          messageController.clear();
        }
      },
      icon: const Icon(Icons.send),
      iconSize: 32,
      color: Colors.black,
      style: IconButton.styleFrom(
        backgroundColor: Colors.grey.shade400,
      ),
    );
  }
}
