import 'package:flutter/material.dart';
import 'package:teacher_finder/common/styles/styles.dart';
import 'package:teacher_finder/common/widgets/custom_drawer.dart';
import 'package:teacher_finder/offers/presentation/offers_list/offers_list_screen.dart';

import '../../../common/widgets/custom_app_bar.dart';

class TestResultScreen extends StatelessWidget {
  const TestResultScreen({super.key, required this.objectResult});
  final Map<String, dynamic> objectResult;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:
            objectResult['hasPassed'] ? Styles.success : Colors.red,
        appBar: const CustomAppBar(
          title: 'Result',
        ),
        drawer: const CustomDrawer(),
        body: Center(
          child: SizedBox(
            width: 300,
            height: 300,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              objectResult['hasPassed']
                  ? const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 100,
                    )
                  : const Icon(
                      Icons.thumb_down,
                      color: Colors.white,
                      size: 100,
                    ),
              Text(
                objectResult['score'].toString(),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
              ),
              Text(
                objectResult['submitDate'].toString(),
                style: const TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OffersListScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  child: const Text(
                    "HOME",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ]),
          ),
        ));
  }
}
