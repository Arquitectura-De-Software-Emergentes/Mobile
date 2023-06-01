import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
class ProfileTeacherSreen extends StatelessWidget {
  const ProfileTeacherSreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFFBBB3F),
          title: const Text('Teacher Finder'),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () { },
          ),
          actions: [

          ],
        ),
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
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text("Pedrito Gonzales",style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.account_circle),
                    SizedBox(width: 8),
                    Text("Correo:", style: Theme.of(context).textTheme.headline5),
                  ],
                ),
                Container(
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text("Pedrito Gonzales@gmail.com", style: Theme.of(context).textTheme.headline6,),
                  ),
                ),

              ],
            ),
          ),
        )
    );
  }
}
