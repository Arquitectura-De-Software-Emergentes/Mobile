import 'package:flutter/material.dart';
import 'package:teacher_finder/offers/presentation/my_applied_offers_list/my_applied_offers_list_screen.dart';

import '../../assessment/presentation/tests_list/tests_list_screen.dart';
import '../../offers/presentation/my_offers_list/my_offers_list_screen.dart';
import '../../offers/presentation/offers_list/offers_list_screen.dart';
import '../../profiles/presentation/profile_teacher/profile_teacher_screen.dart';
import '../../security/presentation/login/login_screen.dart';
import '../styles/styles.dart';

class ApplicantCustomDrawer extends StatelessWidget {
  const ApplicantCustomDrawer({super.key});
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
              drawerOption(context, 'Home', OffersListScreen(), Icons.home),
              drawerOption(
                  context, 'Profile', ProfileTeacherScreen(), Icons.person),
              drawerOption(context, 'Applied Offers',
                  const MyAppliedOffersListScreen(), Icons.person),
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
