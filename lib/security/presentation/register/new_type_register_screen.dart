import 'package:flutter/material.dart';
import 'package:teacher_finder/security/presentation/register/register_recruiter/new_register_recruiter_screen.dart';
import 'package:teacher_finder/security/presentation/register/register_teacher/new_register_teacher.dart';
import '../../../common/styles/styles.dart';

class NewTypeRegister extends StatelessWidget {
  const NewTypeRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Theme(
        data: ThemeData(
          scaffoldBackgroundColor: Styles.primaryColor,
        ),
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200, // Ancho deseado
                  height: 200, // Alto deseado
                  child: ColorFiltered(
                    colorFilter:
                        const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                    child: Image.asset('assets/icon/teacher.png'),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Styles.secondaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    fixedSize: const Size(160, 50),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewRegisterTeacher()),
                    );
                  },
                  child: const Text(
                    'Applicant',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  width: 250,
                  height: 250,
                  child: ColorFiltered(
                    colorFilter:
                        const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                    child: Image.asset('assets/icon/recruiter.png'),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Styles.secondaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    fixedSize: const Size(160, 50),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewRegisterRecruiter()),
                    );
                  },
                  child: const Text(
                    'Recruiter',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
