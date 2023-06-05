import 'package:flutter/material.dart';

import '../../../../common/styles/styles.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        side: BorderSide(color: Styles.black, width: 1.5),
      ),
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Icon(Icons.filter_list, color: Styles.gray),
      ),
    );
  }
}
