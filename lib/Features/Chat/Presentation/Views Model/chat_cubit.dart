import 'dart:developer';
import 'package:chat_app/Features/Home/Data/chat_model.dart';
import 'package:chat_app/Features/Home/Presentation/Views%20Model/Chats%20Cubit/chats_states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<ChatStates> {
  ChatCubit() : super(ChatInitial());

  ChatModel? currentChat;

  FirebaseFirestore db = FirebaseFirestore.instance;

  String lastMessageDate = '';

  Future<void> sendMessage(
      {required String chatId, required Map<String, dynamic> data}) async {
    try {
      await db
          .collection('conversation')
          .doc(chatId)
          .collection('messages')
          .add(data);
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  void updateLastMessage(Timestamp time, String message) async {
    await db.collection('conversation').doc(currentChat?.chatId).update(
      {
        'date': time,
        'last message': message,
      },
    );
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getMessagesStream() {
    return FirebaseFirestore.instance
        .collection('conversation')
        .doc(currentChat!.chatId)
        .collection('messages')
        .orderBy('date', descending: true)
        .snapshots(includeMetadataChanges: true);
  }

  String dateFormatter() {
    return formatDate(
      DateTime.now(),
      [dd, '/', mm, '/', yyyy, ' ', h, ':', nn],
    );
  }
}
