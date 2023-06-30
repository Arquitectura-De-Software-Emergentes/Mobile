import 'package:flutter/material.dart';

import '../styles/styles.dart';

class ErrorHandler extends StatelessWidget {
  const ErrorHandler({super.key, required this.errorMessage});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Icon(
          Icons.error,
          size: 100,
          color: Colors.red,
        ),
        Text(
          errorMessage,
        ),
        SizedBox(
          width: 100,
          child: FilledButton(
            onPressed: () {
              //TODO DESLOGUEAR;
            },
            style: FilledButton.styleFrom(
              backgroundColor: Styles.secondaryColor,
              minimumSize: Size(MediaQuery.of(context).size.width, 40),
            ),
            child: Text(
              'HOME',
              style:
                  TextStyle(color: Styles.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ]),
    );
  }
}
