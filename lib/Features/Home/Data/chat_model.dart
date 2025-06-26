import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  final String chatId;
  final Timestamp? date;
  final List<dynamic> participantsId;
  final List<dynamic> participantsName;
  final String lastMessage;

  ChatModel({
    this.date,
    required this.participantsId,
    required this.participantsName,
    required this.lastMessage,
    required this.chatId,
  });

  factory ChatModel.fromMap(Map<String, dynamic> data) {
    return ChatModel(
      chatId: data['chat id'],
      date: data['date'],
      participantsId: data['participants id'],
      participantsName: data['participants name'],
      lastMessage: data['last message'],
    );
  }
}
