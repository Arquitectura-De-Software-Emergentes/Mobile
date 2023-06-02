import 'package:flutter/material.dart';

import '../../../../common/styles/styles.dart';

class SearchBarCustom extends StatelessWidget {
  const SearchBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(
            color: Colors.black,
            width: 1.5,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: Colors.black,
              width: 1.5,
            )),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
        labelText: 'Search',
        prefixIcon: Icon(Icons.search, color: Styles.gray),
        labelStyle: TextStyle(color: Styles.gray),
      ),
    );
  }
}
