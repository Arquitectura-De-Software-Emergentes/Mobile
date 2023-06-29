import 'package:flutter/material.dart';
import 'package:teacher_finder/profiles/presentation/profile_recruiter/profile_recruiter_screen.dart';

import '../../assessment/presentation/tests_list/tests_list_screen.dart';
import '../../offers/presentation/my_offers_list/my_offers_list_screen.dart';
import '../../profiles/presentation/profile_teacher/profile_teacher_screen.dart';
import '../../security/presentation/login/login_screen.dart';
import '../styles/styles.dart';

class RecruiterCustomDrawer extends StatelessWidget {
  const RecruiterCustomDrawer({super.key});
  void goToOption(BuildContext context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: ((context) => widget)));
  }

  Widget drawerOption(
      BuildContext context, String title, Widget widget, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Styles.secondaryColor),
      title: Text(title,
          style: const TextStyle(
            color: const Color(0xFF171740),
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
              drawerOption(context, 'Home', MyOffersListScreen(), Icons.home),
              drawerOption(context, 'Test', TestsListScreen(), Icons.list),
              drawerOption(context, 'Profile', ProfileRecruiterScreen(),
                  Icons.person),
              Divider(
                color: Colors.white.withOpacity(0.5),
                height: 10,
                thickness: 1,
                indent: 30,
                endIndent: 30,
              ),
              drawerOption(
                  context, 'Sign out', const LoginScreen(), Icons.logout),
            ],
          )),
    );
  }
}
