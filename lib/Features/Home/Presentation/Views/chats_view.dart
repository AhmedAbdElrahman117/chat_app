import 'package:chat_app/Features/Home/Data/chat_model.dart';
import 'package:chat_app/Features/Home/Presentation/Views%20Model/Chats%20Cubit/chats_cubit.dart';
import 'package:chat_app/Features/Home/Presentation/Views/Widgets/chat_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: BlocProvider.of<ChatsCubit>(context).getChatsStream(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: Text(
              'No Chats',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text(
              'Error',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          );
        } else {
          return ListView(
            physics: const BouncingScrollPhysics(),
            children: snapshot.data!.docs.map(
              (doc) {
                ChatModel model =
                    BlocProvider.of<ChatsCubit>(context).getChats(doc);
                return ChatTile(chat: model);
              },
            ).toList(),
          );
        }
      },
    );
  }
}

// BlocProvider.of<ChatsCubit>(context).getChatsStream();
//     return ListView.builder(
//       itemCount: BlocProvider.of<ChatsCubit>(context).chats.length,
//       physics: const BouncingScrollPhysics(),
//       itemBuilder: (context, index) {
//         return ChatTile(
//             chat: BlocProvider.of<ChatsCubit>(context).chats[index]);
//       },
//     );




    