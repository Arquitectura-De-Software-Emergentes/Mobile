import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:teacher_finder/common/widgets/custom_app_bar.dart';

import 'menu_information_screen.dart';

class InfomationPersonalTeacherScreen extends StatelessWidget {
  const InfomationPersonalTeacherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: 'Profile',
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  "Name",
                  textAlign: TextAlign.left,
                ),
                menuInformation(title: "Cristhian Orosco", onPress: () {}),
                Divider(),
                const SizedBox(height: 10),
                Text(
                  "Name",
                  textAlign: TextAlign.left,
                ),
                menuInformation(title: "Cristhian Orosco", onPress: () {}),
                Divider(),
                const SizedBox(height: 10),
                Text(
                  "Name",
                  textAlign: TextAlign.left,
                ),
                menuInformation(title: "Cristhian Orosco", onPress: () {}),
                Divider(),
                const SizedBox(height: 10),
                Text(
                  "Name",
                  textAlign: TextAlign.right,
                ),
                menuInformation(title: "Cristhian Orosco", onPress: () {}),
              ],
            ),
          ),
        ));
  }
}
