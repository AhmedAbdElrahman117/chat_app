import 'package:chat_app/Features/Home/Data/chat_model.dart';
import 'package:chat_app/Features/Home/Presentation/Views%20Model/Chats%20Cubit/chats_states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatsCubit extends Cubit<ChatStates> {
  ChatsCubit() : super(ChatInitial());
  List<ChatModel> chats = [];

  ChatModel getChats(QueryDocumentSnapshot<Map<String, dynamic>> data) {
    chats.add(ChatModel.fromMap(data.data()));
    return chats.last;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getChatsStream() {
    return FirebaseFirestore.instance
        .collection('conversation')
        .orderBy(
          'date',
          descending: true,
        )
        .snapshots(includeMetadataChanges: true);
  }
}
