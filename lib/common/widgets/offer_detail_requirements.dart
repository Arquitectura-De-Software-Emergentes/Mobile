import 'package:flutter/material.dart';

class OfferDetailRequirements extends StatelessWidget {
  const OfferDetailRequirements({super.key, required this.requirement});
  final String requirement;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 8.0,
          child: Text(
            '\u2022',
            style: TextStyle(fontSize: 16.0),
          ),
        ),
        Text('  $requirement'),
      ],
    );
  }
}
