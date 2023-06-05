import 'package:flutter/material.dart';
import 'package:teacher_finder/common/styles/styles.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom({super.key, required this.isHome});
  final bool isHome;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Teacher Finder'),
      backgroundColor: Styles.primaryColor,
      leading: isHome
          ? IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            )
          : IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
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
