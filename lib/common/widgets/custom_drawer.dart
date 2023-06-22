import 'package:flutter/material.dart';
import 'package:teacher_finder/main.dart';
import 'package:teacher_finder/offers/presentation/offers_list/offers_list_screen.dart';
import 'package:teacher_finder/profiles/presentation/profile_teacher/profile_teacher_screen.dart';

import '../styles/styles.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  void goToOption(BuildContext context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: ((context) => widget)));
  }

  Widget drawerOption(
      BuildContext context, String title, Widget widget, IconData icon) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          )),
      onTap: () {
        //Navigator.push(
        //context, MaterialPageRoute(builder: ((context) => widget)));
        goToOption(context, widget);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
          color: Styles.primaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              drawerOption(context, 'Home', OffersListScreen(), Icons.home),
              drawerOption(context, 'Profile', const ProfileTeacherScreen(),
                  Icons.person),
              Divider(
                color: Colors.white.withOpacity(0.5),
                height: 10,
                thickness: 1,
                indent: 30,
                endIndent: 30,
              ),
              drawerOption(context, 'Sign out', const HomePage(), Icons.logout),
            ],
          )),
    );
  }
}
