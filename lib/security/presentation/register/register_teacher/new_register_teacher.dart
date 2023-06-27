import 'package:flutter/material.dart';
import 'package:teacher_finder/common/styles/styles.dart';

class NewRegisterTeacher extends StatefulWidget {
  const NewRegisterTeacher({super.key});

  @override
  State<NewRegisterTeacher> createState() => _NewRegisterTeacherState();
}

class _NewRegisterTeacherState extends State<NewRegisterTeacher> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Styles.primaryColor,
      ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: ListView(
            children: [
              SizedBox(height: 50),
              Padding(padding: EdgeInsets.all(30),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Styles.secondaryColor,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          'Create an Account!',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 35),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Email',
                              style: TextStyle(
                                color: Styles.secondaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding:
                          EdgeInsets.symmetric(vertical: 0,horizontal: 30),
                        child:
                        TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(20),
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Styles.secondaryColor,
                              ),
                            ),
                          ),
                          cursorColor: Styles.secondaryColor,
                        ),


                      )

                    ],
                  ),

                ),
              )
            ],
        ),
    ),
    );
  }
}
