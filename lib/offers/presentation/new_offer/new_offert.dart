import 'package:flutter/material.dart';
import 'package:teacher_finder/common/widgets/custom_app_bar.dart';

import '../my_offers_list/my_offers_list_screen.dart';

class NewOffertPage extends StatelessWidget {
  const NewOffertPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        body: Container(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text("New Job Offer",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 30,
                        color: Colors.black)),
                SizedBox(height: 10),
                Text("Job",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.black)),
                TextFormField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFEFEFF0),
                      contentPadding: EdgeInsets.symmetric(vertical: 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      )),
                ),
                SizedBox(height: 10),
                Text("Job",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.black)),
                TextFormField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFEFEFF0),
                      contentPadding: EdgeInsets.symmetric(vertical: 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      )),
                ),
                SizedBox(height: 10),
                Text("Job",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.black)),
                TextFormField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFEFEFF0),
                      contentPadding: EdgeInsets.symmetric(vertical: 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      )),
                ),
                SizedBox(height: 10),
                Text("Job",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.black)),
                TextFormField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFEFEFF0),
                      contentPadding: EdgeInsets.symmetric(vertical: 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      )),
                ),
                SizedBox(height: 10),
                Text("Job",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.black)),
                TextFormField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFEFEFF0),
                      contentPadding: EdgeInsets.symmetric(vertical: 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      )),
                ),
                SizedBox(height: 10),
                Text("Job",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.black)),
                TextFormField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFEFEFF0),
                      contentPadding: EdgeInsets.symmetric(vertical: 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      )),
                ),
                SizedBox(height: 40),
                Center(
                  child: SizedBox(
                    height: 45,
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        OfferCreated(context);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF171740),
                          side: BorderSide.none,
                          shape: const StadiumBorder()),
                      child: const Text(
                        "Create",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void OfferCreated(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 80.0,
              ),
              SizedBox(height: 16.0),
              Text(
                "Offer created",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Center(
                child: SizedBox(
                  height: 45,
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyOffersListScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF171740),
                        side: BorderSide.none,
                        shape: const StadiumBorder()),
                    child: const Text(
                      "OK",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
