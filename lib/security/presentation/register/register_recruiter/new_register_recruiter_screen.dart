import 'package:flutter/material.dart';
import 'package:teacher_finder/security/infrastructure/data_sources/register_recruiter_remove_data_provider.dart';

import '../../../../common/styles/styles.dart';
import '../../login/login_screen.dart';

class NewRegisterRecruiter extends StatefulWidget {
  final String? username;
  final String? password;
  final String? position;

  const NewRegisterRecruiter(
      {super.key, this.username, this.password, this.position});

  @override
  State<NewRegisterRecruiter> createState() => _NewRegisterRecruiterState();
}

class _NewRegisterRecruiterState extends State<NewRegisterRecruiter> {
  bool _obsureText = true;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();

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
            const SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.all(30),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(5),
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
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        'Create an Account!',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
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
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 30),
                      child: TextField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(20),
                          hintStyle: const TextStyle(
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
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
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
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 30),
                      child: TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(20),
                          hintStyle: const TextStyle(
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
                            icon: Icon(
                              _obsureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Styles.secondaryColor,
                            ),
                            onPressed: () {
                              setState(() {
                                _obsureText = !_obsureText;
                              });
                            },
                          ),
                        ),
                        cursorColor: Styles.secondaryColor,
                        obscureText: _obsureText,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Position',
                            style: TextStyle(
                              color: Styles.secondaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 30),
                      child: TextField(
                        controller: _positionController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          hintStyle: const TextStyle(
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
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        final registerRecruiterRemoveDataProvider =
                            RegisterRecruiterRemoveDataProvider();
                        registerRecruiterRemoveDataProvider
                            .postRegisterRecruiter(
                                _usernameController.text,
                                _passwordController.text,
                                _positionController.text);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Styles.secondaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 1),
                      ),
                      child: Container(
                        width: 200,
                        height: 50,
                        alignment: Alignment.center,
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('Already have an account?'),
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
    );
  }
}
