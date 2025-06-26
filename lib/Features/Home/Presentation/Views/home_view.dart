import 'package:chat_app/Features/Home/Presentation/Views/Widgets/custom_app_bar.dart';
import 'package:chat_app/Features/Home/Presentation/Views/chats_view.dart';
import 'package:chat_app/Features/Home/Presentation/Views/friends_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CutomAppBar(appBar: AppBar()),
        body: const TabBarView(
          children: [
            ChatsView(),
            FriendsView(),
          ],
        ),
      ),
    );
  }
}
