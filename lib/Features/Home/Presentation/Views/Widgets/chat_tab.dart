import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  const CustomTab({
    super.key,
    required this.tabTitle,
  });

  final String tabTitle;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        tabTitle,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
    );
  }
}
