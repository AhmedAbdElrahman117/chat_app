import 'package:chat_app/Features/Home/Presentation/Views%20Model/Friends%20Cubit/friends_cubit.dart';
import 'package:chat_app/Features/Home/Presentation/Views/Widgets/friends_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FriendsView extends StatelessWidget {
  const FriendsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: BlocProvider.of<FriendsCubit>(context).getFriendsStream(context),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data!.size == 0) {
          return const Center(
            child: Text(
              'No Friends',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text(
              'Error',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          );
        } else {
          return ListView(
            physics: const BouncingScrollPhysics(),
            children: snapshot.data!.docs.map(
              (friend) {
                return FriendsTile(
                    data: BlocProvider.of<FriendsCubit>(context)
                        .getFriends(friend, context));
              },
            ).toList(),
          );
        }
      },
    );
  }
}
// BlocProvider.of<FriendsCubit>(context).getFriends(
//             snapshot.data!.docs,
//             context,
//           );
//           return ListView.builder(
//             itemCount: BlocProvider.of<FriendsCubit>(context).friends.length,
//             physics: const BouncingScrollPhysics(),
//             itemBuilder: (context, index) {
//               return FriendsTile(
//                   data: BlocProvider.of<FriendsCubit>(context).friends[index]);
//             },
//           );