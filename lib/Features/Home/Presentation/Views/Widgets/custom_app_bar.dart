import 'package:chat_app/Features/Auth/Presentation/Views/Widgets/logo.dart';
import 'package:chat_app/Features/Home/Presentation/Views/Widgets/chat_tab.dart';
import 'package:flutter/material.dart';

class CutomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CutomAppBar({
    super.key,
    required this.appBar,
  });

  final AppBar appBar;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blueGrey.shade500,
      title: const Logo(),
      centerTitle: true,
      bottom: const TabBar(
        indicatorColor: Colors.black,
        tabs: [
          CustomTab(tabTitle: 'Chats'),
          CustomTab(tabTitle: 'Friends'),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
