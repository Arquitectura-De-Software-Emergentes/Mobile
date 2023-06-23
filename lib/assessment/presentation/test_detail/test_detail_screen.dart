import 'package:flutter/material.dart';
import 'package:teacher_finder/common/widgets/custom_app_bar.dart';

import '../../domain/entities/test.dart';

class TestDetailScreen extends StatelessWidget {
  const TestDetailScreen({super.key, required this.test});
  final Test test;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Number Test: 1'),
    );
  }
}
