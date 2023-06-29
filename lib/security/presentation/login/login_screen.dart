import 'package:flutter/material.dart';
import 'package:teacher_finder/common/styles/styles.dart';
import 'package:teacher_finder/main.dart';
import 'package:teacher_finder/offers/presentation/my_offers_list/my_offers_list_screen.dart';
import 'package:teacher_finder/offers/presentation/offers_list/offers_list_screen.dart';
import 'package:teacher_finder/security/presentation/login/forgot_password_screen.dart';
import 'package:teacher_finder/security/presentation/register/new_type_register_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../application/auth_service.dart';
import '../../domain/entities/enums/user_role.dart';
import 'bloc/login_screen_bloc.dart';
import 'bloc/login_screen_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  late LoginScreenBloc _loginBloc;
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BaseAuth auth = AuthImplementation();
    _loginBloc = LoginScreenBloc(auth);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => _loginBloc,
        child: Container(
            decoration: BoxDecoration(
              color: Styles.primaryColor,
            ),
            child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      const SizedBox(height: 50),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 200,
                            height: 120,
                            child: Image(
                              image: AssetImage('assets/icon/iconTF.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
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
                              const SizedBox(height: 30),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 30),
                                child: TextFormField(
                                  maxLines: 1,
                                  controller: _usernameController,
                                  decoration: InputDecoration(
                                    hintText: 'Username',
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Styles.secondaryColor,
                                    ),
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
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'You must enter your username';
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 30),
                                child: TextFormField(
                                  controller: _passwordController,
                                  decoration: InputDecoration(
                                    hintText: 'Password',
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: Styles.secondaryColor,
                                    ),
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
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _obscureText
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Styles.secondaryColor,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _obscureText = !_obscureText;
                                        });
                                      },
                                    ),
                                  ),
                                  cursorColor: Styles.secondaryColor,
                                  obscureText: _obscureText,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'You must enter your password';
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 120),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ForgotPasswordScreen(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                      color: Styles.primaryColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              BlocBuilder<LoginScreenBloc, AuthenticationState>(
                                builder: (context, state) {
                                  return ElevatedButton(
                                    onPressed: () {
                                      _signIn();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Styles.secondaryColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 1),
                                    ),
                                    child: Container(
                                      width: 200,
                                      height: 50,
                                      alignment: Alignment.center,
                                      child: const Text(
                                        'Login',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 10),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text('Dont have an account?'),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const NewTypeRegister(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'Sign Up',
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
                      ),
                    ],
                  ),
                ))));
  }

  bool _isValidForm() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void _signIn() async {
    bool isValidForm = _isValidForm();

    if (isValidForm) {
      final username = _usernameController.text;
      final password = _passwordController.text;
      await _loginBloc.signIn(username, password);

      final currentState = _loginBloc.state;
      if (currentState is AuthenticatedState) {
        var user = currentState.user;

        print(user.id);
        switch (user.role) {
          case UserType.applicant:
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => OffersListScreen(),
                ),
                (route) => false);
          case UserType.recruiter:
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => MyOffersListScreen(),
                ),
                (route) => false);
        }
      } else if (currentState is UnauthenticatedState) {
        const snackBar = SnackBar(
          content: Text('Please check your credentials and try again'),
          backgroundColor: Colors.redAccent,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }

  @override
  void dispose() {
    _loginBloc.close();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
