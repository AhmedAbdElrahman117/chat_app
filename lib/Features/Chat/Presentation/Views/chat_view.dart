import 'package:chat_app/Features/Auth/Presentation/Views%20Model/Login%20Cubit/login_cubit.dart';
import 'package:chat_app/Features/Chat/Data/message_model.dart';
import 'package:chat_app/Features/Chat/Presentation/Views%20Model/chat_cubit.dart';
import 'package:chat_app/Features/Chat/Presentation/Views/Widgets/chat_app_bar.dart';
import 'package:chat_app/Features/Chat/Presentation/Views/Widgets/recieved_message.dart';
import 'package:chat_app/Features/Chat/Presentation/Views/Widgets/send_message.dart';
import 'package:chat_app/Features/Chat/Presentation/Views/Widgets/sent_message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController messageController = TextEditingController();
    GlobalKey<FormState> messageKey = GlobalKey();
    ScrollController controller = ScrollController();
    return Scaffold(
      appBar: ChatAppBar(appBar: AppBar()),
      body: Form(
        key: messageKey,
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: BlocProvider.of<ChatCubit>(context).getMessagesStream(),
          builder: (context, snapshot) {
            if (!snapshot.hasData || snapshot.data?.size == 0) {
              return const Center(
                child: Text(
                  'No Messages in This Chat',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text(
                  'Error',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              );
            } else {
              return ListView(
                controller: controller,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 16),
                reverse: true,
                children: snapshot.data!.docs.asMap().entries.map(
                  (message) {
                    MessageModel m = MessageModel.fromMap(message.value.data());
                    if (message.key == 0) {
                      BlocProvider.of<ChatCubit>(context)
                          .updateLastMessage(m.date!, m.message);
                    }
                    if (m.senderId ==
                        BlocProvider.of<LoginCubit>(context).userData.uid) {
                      return SentMessage(message: m);
                    } else {
                      return RecievedMessage(message: m);
                    }
                  },
                ).toList(),
              );
            }
          },
        ),
      ),
      bottomNavigationBar: SendMessage(
        messageController: messageController,
        messageKey: messageKey,
      ),
    );
  }
}
