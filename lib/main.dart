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
          padding: const EdgeInsets.only(left: 40,right: 40),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                Text("New Job Offer", style: TextStyle(fontSize: 35,color: Colors.black)),
                SizedBox(height: 40),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Puesto de trabajo"
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
