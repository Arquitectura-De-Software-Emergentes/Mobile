import 'package:flutter/material.dart';
import 'package:teacher_finder/common/widgets/custom_drawer.dart';

class VideoPresentationResult extends StatefulWidget {
  const VideoPresentationResult({super.key, required this.result});
  final Text result;
  @override
  State<VideoPresentationResult> createState() =>
      _VideoPresentationResultState();
}

class _VideoPresentationResultState extends State<VideoPresentationResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text('Result'),
      ),
    );
  }
}
