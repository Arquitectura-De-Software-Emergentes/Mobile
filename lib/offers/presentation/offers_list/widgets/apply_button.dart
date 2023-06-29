import 'package:flutter/material.dart';

import '../../../../common/styles/styles.dart';

class ApplyButton extends StatelessWidget {
  const ApplyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {
        Navigator.pop(context);
        const snackBar = SnackBar(
          content: Text(
            'You\'ve successfully applied to this job.',
          ),
          backgroundColor: Colors.green,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      style: FilledButton.styleFrom(
        backgroundColor: Styles.secondaryColor,
        minimumSize: Size(MediaQuery.of(context).size.width, 40),
      ),
      child: Text(
        'Apply',
        style: TextStyle(color: Styles.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
