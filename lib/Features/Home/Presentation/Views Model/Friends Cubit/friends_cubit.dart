// ignore_for_file: use_build_context_synchronously
import 'package:chat_app/Features/Auth/Presentation/Views%20Model/Login%20Cubit/login_cubit.dart';
import 'package:chat_app/Features/Chat/Presentation/Views%20Model/chat_cubit.dart';
import 'package:chat_app/Features/Home/Data/chat_model.dart';
import 'package:chat_app/Features/Home/Data/friends_model.dart';
import 'package:chat_app/Features/Home/Presentation/Views%20Model/Chats%20Cubit/chats_cubit.dart';
import 'package:chat_app/Features/Home/Presentation/Views%20Model/Friends%20Cubit/friends_states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FriendsCubit extends Cubit<FriendsStates> {
  FriendsCubit() : super(FriendsInitial());

  FirebaseFirestore db = FirebaseFirestore.instance;

  List<FriendsModel> friends = [];

  FriendsModel getFriends(
      QueryDocumentSnapshot<Map<String, dynamic>> data, BuildContext context) {
    if (data.id != BlocProvider.of<LoginCubit>(context).userData.uid) {
      friends.add(FriendsModel.fromMap(data.data(), data.id));
    }

    return friends.last;
  }

  getFriendsStream(BuildContext context) {
    return FirebaseFirestore.instance
        .collection('users')
        .where(
          'id',
          isNotEqualTo: BlocProvider.of<LoginCubit>(context).userData.uid,
        )
        .snapshots();
  }

  checkConversation(
      String userId, String userName, BuildContext context) async {
    var checker = await db
        .collection('conversation')
        .where(
          'participants id',
          arrayContainsAny: [
            BlocProvider.of<LoginCubit>(context).userData.uid,
            userId
          ],
        )
        .limit(1)
        .get();

    if (checker.size == 0) {
      await createNewChat(userId, userName, context);
      BlocProvider.of<ChatCubit>(context).currentChat =
          BlocProvider.of<ChatsCubit>(context).chats.first;
      Navigator.pushNamed(context, 'chat');
    } else {
      ChatModel? current =
          BlocProvider.of<ChatsCubit>(context).chats.firstWhere(
        (element) {
          return element.chatId == checker.docs[0].id;
        },
      );
      Navigator.pushNamed(context, 'chat');
      BlocProvider.of<ChatCubit>(context).currentChat = current;
    }
  }

  Future<void> createNewChat(
    String userId,
    String userName,
    BuildContext context,
  ) async {
    await db
        .collection('conversation')
        .doc('${BlocProvider.of<LoginCubit>(context).userData.uid}$userId')
        .set(
      {
        'chat id':
            '${BlocProvider.of<LoginCubit>(context).userData.uid}$userId',
        'date': Timestamp.now(),
        'participants id': [
          BlocProvider.of<LoginCubit>(context).userData.uid,
          userId
        ],
        'participants name': [
          BlocProvider.of<LoginCubit>(context).userData.name,
          userName,
        ],
        'last message': '',
      },
    );
  }
}


// ahmedaboelnaga713@gmail.com