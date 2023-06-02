import 'package:flutter/material.dart';

import '../../../../common/styles/styles.dart';

class ApplyButton extends StatelessWidget {
  const ApplyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Align(
                  alignment: Alignment.center, child: Text('Are you sure?')),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FilledButton(
                      style:
                          FilledButton.styleFrom(backgroundColor: Styles.error),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child:
                          Text('Cancel', style: TextStyle(color: Styles.white)),
                    ),
                    FilledButton(
                      style: FilledButton.styleFrom(
                          backgroundColor: Styles.secondaryColor),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Confirm',
                        style: TextStyle(color: Styles.white),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        );
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
