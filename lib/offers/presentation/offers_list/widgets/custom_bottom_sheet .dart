import 'package:flutter/material.dart';

class CustomButtonSheet extends StatelessWidget {
  const CustomButtonSheet({super.key, required this.context});
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Item $index'),
        );
      },
      itemCount: 20,
    );
  }
}
