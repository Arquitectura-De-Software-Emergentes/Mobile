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
        title: 'Upload Video',
      ),
      body: Center(
        child: Text('Upload Video'),
      ),
      );
  }
}

