import 'package:flutter/material.dart';
import 'package:teacher_finder/offers/presentation/offers_list/offers_list_screen.dart';
import 'package:teacher_finder/profiles/presentation/profile_teacher_screen.dart';

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
            fontSize: 20,
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              drawerOption(
                  context, 'Home', const OffersListScreen(), Icons.home),
              drawerOption(context, 'Interviews', const ProfileTeacherSreen(),
                  Icons.schedule),
              drawerOption(context, 'Assesments', const ProfileTeacherSreen(),
                  Icons.schedule),
              drawerOption(context, 'Notifications',
                  const ProfileTeacherSreen(), Icons.schedule),
              drawerOption(context, 'Profile', const ProfileTeacherSreen(),
                  Icons.person),
              drawerOption(context, 'Sign out', const ProfileTeacherSreen(),
                  Icons.logout),
            ],
          )),
    );
  }
}