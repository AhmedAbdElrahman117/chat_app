import 'package:chat_app/Core/constant.dart';
import 'package:chat_app/Features/Auth/Presentation/Views%20Model/Login%20Cubit/login_cubit.dart';
import 'package:chat_app/Features/Chat/Presentation/Views%20Model/chat_cubit.dart';
import 'package:chat_app/Features/Home/Data/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({
    super.key,
    required this.chat,
  });

  final ChatModel chat;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(checker(context)),
      subtitle: Text(chat.lastMessage),
      leading: const CircleAvatar(backgroundColor: Colors.amber),
      trailing: Text(checkDate(chat.date!)),
      onTap: () {
        Navigator.pushNamed(context, 'chat');
        BlocProvider.of<ChatCubit>(context).currentChat = chat;
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  String checker(BuildContext context) {
    if (chat.participantsId.first ==
        BlocProvider.of<LoginCubit>(context).userData.uid) {
      return chat.participantsName.last;
    } else {
      return chat.participantsName.first;
    }
  }
}
