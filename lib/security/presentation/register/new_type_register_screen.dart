import 'package:flutter/material.dart';
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
              Text('Register',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 60),
              Icon(Icons.account_box_sharp, size: 100),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Styles.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  fixedSize: Size(150, 45),
                ),

                onPressed: (){

              },
                  child: Text('Teacher',style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),),

              ),
              SizedBox(height: 60),
              Icon(Icons.account_circle_sharp, size: 100),
              SizedBox(height: 20),
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
