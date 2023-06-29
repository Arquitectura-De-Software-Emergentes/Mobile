import 'package:flutter/material.dart';
import 'package:teacher_finder/common/styles/styles.dart';
import 'package:teacher_finder/main.dart';
import 'package:teacher_finder/security/infrastructure/data_sources/register_applicant_remove_data_provider.dart';
import 'package:teacher_finder/security/infrastructure/models/register_applicant_model.dart';
import 'package:teacher_finder/security/presentation/login/login_screen.dart';

import '../../../infrastructure/models/register_applicant_cv_model.dart';

class NewRegisterTeacher extends StatefulWidget {
  final String? username;
  final String? password;
  final String? cv;


  const NewRegisterTeacher({super.key, this.username, this.password, this.cv});

  @override
  State<NewRegisterTeacher> createState() => _NewRegisterTeacherState();
}

class _NewRegisterTeacherState extends State<NewRegisterTeacher> {
  bool _obsureText = true;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cvController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.username != null) {
      _usernameController.text = widget.username!;
    }

    if (widget.password != null) {
      _passwordController.text = widget.password!;
    }

    if (widget.cv != null) {
      _cvController.text = widget.cv!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                                'Username',
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
                            controller: _usernameController,

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
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: 35),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Password',
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
                          child: TextField(
                            controller: _passwordController,

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
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _obsureText = !_obsureText;
                                  });
                                },
                                icon: Icon(
                                  _obsureText ? Icons.visibility : Icons.visibility_off,
                                  color: Styles.secondaryColor,
                                ),
                              ),
                            ),
                            cursorColor: Styles.secondaryColor,
                            obscureText: _obsureText,
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
                                'CV',
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
                          child: TextField(
                            controller: _cvController,

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
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () async {
                            final registerApplicantRemoveDataProvider=RegisterApplicantRemoveDataProvider();
                            registerApplicantRemoveDataProvider.postRegisterApplicant(_usernameController.text,_passwordController.text);
                            //final result= await postRegisterApplicant();
                            //print(result);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Styles.secondaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                          ),
                          child: Container(
                            width: 200,
                            height: 50,
                            alignment: Alignment.center,
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Already have an account?'),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Styles.primaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ])

                      ],
                    ),

                  ),
                )
              ],
          ),
      ),
      ),
    );
  }
}
