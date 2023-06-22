import 'package:flutter/material.dart';
import 'package:teacher_finder/common/widgets/custom_app_bar.dart';

class UploadVideoTeacherScreen extends StatefulWidget {
  const UploadVideoTeacherScreen({super.key});

  @override
  State<UploadVideoTeacherScreen> createState() => _UploadVideoTeacherScreenState();
}

class _UploadVideoTeacherScreenState extends State<UploadVideoTeacherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Video',
      ),
      body: Center(
        child: Container(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add_circle_rounded, size: 250),
              SizedBox(height: 20,),
              Container(
                constraints: BoxConstraints.tightFor(width: 200, height: 30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary:Color(0xFF171740),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {
                    showModalBottomSheet(context: context,
                        builder: (BuildContext context){
                          return SizedBox(
                            height:400,
                            child:Center(
                            child: Text('Upload Video'),
                            )
                          );
                        });

                },
                      child: Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.cloud_upload,
                              color: Colors.white,
                              size: 18,),
                            SizedBox(width: 10),
                            Text('Upload Video',style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),),
                          ],
                        ),
                      )
                ),
              ),
            ],
          )
        )
        ),
      );
  }
}

