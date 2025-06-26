import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String message;
  final String senderId;
  final String recieverId;
  final Timestamp? date;

  MessageModel(
      {required this.message,
      required this.senderId,
      required this.recieverId,
      this.date});

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'sender id': senderId,
      'reciever id': recieverId,
      'date': DateTime.timestamp(),
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> data) {
    return MessageModel(
      message: data['message'],
      senderId: data['sender id'],
      recieverId: data['reciever id'],
      date: data['date'],
    );
  }
}
