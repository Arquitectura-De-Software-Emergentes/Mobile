import 'package:flutter/material.dart';
import 'package:teacher_finder/common/styles/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Teacher Finder'),
      backgroundColor: Styles.primaryColor,
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: CircleAvatar(
            backgroundColor: Colors.grey,
          ),
        ),
      ],
    );
  }
}
