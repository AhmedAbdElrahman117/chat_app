import 'package:chat_app/Features/Auth/Presentation/Views%20Model/Login%20Cubit/login_cubit.dart';
import 'package:chat_app/Features/Chat/Presentation/Views%20Model/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBar({
    super.key,
    required this.appBar,
  });

  final AppBar appBar;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      elevation: 0,
      title: ListTile(
        leading: const CircleAvatar(backgroundColor: Colors.amber),
        title: Text(checker(context)),
      ),
    );
  }

  @override
  Size get preferredSize => appBar.preferredSize;

  String checker(BuildContext context) {
    if (BlocProvider.of<ChatCubit>(context).currentChat!.participantsId.first ==
        BlocProvider.of<LoginCubit>(context).userData.uid) {
      return BlocProvider.of<ChatCubit>(context)
          .currentChat!
          .participantsName
          .last;
    } else {
      return BlocProvider.of<ChatCubit>(context)
          .currentChat!
          .participantsName
          .first;
    }
  }
}
