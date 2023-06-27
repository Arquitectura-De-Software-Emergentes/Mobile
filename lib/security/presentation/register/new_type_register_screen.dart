import 'package:flutter/material.dart';
import 'package:teacher_finder/security/presentation/register/register_teacher/new_register_teacher.dart';
import '../../../common/styles/styles.dart';

class NewTypeRegister extends StatelessWidget {
  const NewTypeRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Theme(
        data: ThemeData(
         scaffoldBackgroundColor: Styles.primaryColor,
      ),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /*Text('Type of Register',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Styles.secondaryColor,
                ),
              ),*/
              SizedBox(height: 50),
              Icon(Icons.account_box_sharp, size: 150),
              SizedBox(height: 15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Styles.secondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  fixedSize: Size(150, 45),
                ),

                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewRegisterTeacher()),
                  );

              },
                  child: Text('Teacher',style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),),

              ),
              SizedBox(height: 80),
              Icon(Icons.account_circle_sharp, size: 150),
              SizedBox(height: 15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Styles.secondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  fixedSize: Size(150, 45),
                ),
                onPressed: (){

              },
                child: Text('Recruiter',
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
