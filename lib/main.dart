import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: Color(0xFFFBBB3F)),
                        child: const Icon(
                          LineAwesomeIcons.alternate_pencil,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 50),
                Form(child: Column(
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
                        decoration:  InputDecoration(
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
                    const SizedBox(height:60),
                    SizedBox(
                      height: 45,
                      width: 250,
                      child: ElevatedButton(
                        onPressed: () { },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:Color(0xFFFBBB3F),side: BorderSide.none, shape: const StadiumBorder()),
                        child: const Text("Edit Profile",style: TextStyle(color: Colors.white),),
                      ),
                    )
                  ],
                ))
              ],
            ),
          ),
        )
    );
  }
}
