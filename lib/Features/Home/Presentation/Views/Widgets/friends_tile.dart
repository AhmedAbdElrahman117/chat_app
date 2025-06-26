import 'package:chat_app/Features/Home/Data/friends_model.dart';
import 'package:chat_app/Features/Home/Presentation/Views%20Model/Friends%20Cubit/friends_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FriendsTile extends StatelessWidget {
  const FriendsTile({super.key, required this.data});

  final FriendsModel data;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(data.name),
      leading: const CircleAvatar(backgroundColor: Colors.amber),
      onTap: () {
        BlocProvider.of<FriendsCubit>(context)
            .checkConversation(data.id, data.name, context);
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
