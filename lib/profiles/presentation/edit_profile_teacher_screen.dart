import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:teacher_finder/common/widgets/custom_app_bar.dart';
import 'package:teacher_finder/common/widgets/custom_drawer.dart';

class EditProfileTeacherScreen extends StatelessWidget {
  const EditProfileTeacherScreen({Key? key}) : super(key: key);

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
                            backgroundImage: AssetImage(""),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 40,
                            height: 40,
                            child: FloatingActionButton(
                              backgroundColor: Color(0xFFFBBB3F),
                              onPressed: () {},
                              child: const Icon(
                                LineAwesomeIcons.alternate_pencil,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Form(
                    child: Column(
                  children: [
                    Container(
                      width: 400,
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Full Name",
                          prefixIcon: Icon(LineAwesomeIcons.user),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: 400,
                      child: TextFormField(
                        decoration: InputDecoration(
                          label: Text("Location"),
                          prefixIcon: Icon(LineAwesomeIcons.map),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: 400,
                      child: TextFormField(
                        decoration: InputDecoration(
                          label: Text("Email"),
                          prefixIcon: Icon(LineAwesomeIcons.envelope_1),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: 400,
                      child: TextFormField(
                        decoration: InputDecoration(
                          label: Text("Phone"),
                          prefixIcon: Icon(LineAwesomeIcons.phone),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 60),
                    SizedBox(
                      height: 45,
                      width: 250,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFFBBB3F),
                            side: BorderSide.none,
                            shape: const StadiumBorder()),
                        child: const Text(
                          "Confirm",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ))
              ],
            ),
          ),
        ));
  }
}
