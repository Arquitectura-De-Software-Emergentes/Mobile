import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:teacher_finder/common/widgets/custom_app_bar.dart';
import 'package:teacher_finder/common/widgets/custom_drawer.dart';

import 'edit_profile_teacher_screen.dart';

class ProfileTeacherSreen extends StatelessWidget {
  const ProfileTeacherSreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        body: Container(
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          width: 160,
                          height: 160,
                          child: CircleAvatar(
                            backgroundColor: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text("Pedrito Gonzales",
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.mail),
                    SizedBox(width: 8),
                    Text("Email address",
                        style: Theme.of(context).textTheme.headline6),
                  ],
                ),
                Container(
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Pedrito_Gonzales@gmail.com",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Icon(Icons.phone_android),
                    SizedBox(width: 8),
                    Text("Phone", style: Theme.of(context).textTheme.headline6),
                  ],
                ),
                Container(
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "999-888-777",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Icon(Icons.book_outlined),
                    SizedBox(width: 8),
                    Text("Academic Degree",
                        style: Theme.of(context).textTheme.headline6),
                  ],
                ),
                Container(
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Magister",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Icon(Icons.account_circle),
                    SizedBox(width: 8),
                    Text("Phone", style: Theme.of(context).textTheme.headline6),
                  ],
                ),
                Container(
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "999-888-777",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  height: 45,
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditProfileTeacherScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFBBB3F),
                        side: BorderSide.none,
                        shape: const StadiumBorder()),
                    child: const Text(
                      "Edit Profile",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
