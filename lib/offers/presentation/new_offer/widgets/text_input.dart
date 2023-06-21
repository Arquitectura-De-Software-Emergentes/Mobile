import 'package:flutter/material.dart';

import '../../../../common/styles/styles.dart';

class TextInput extends StatelessWidget {
  TextInput(
      {super.key,
      required this.title,
      required this.label,
      this.errorMessage,
      this.onChanged,
      this.validator});
  final String title;
  final String label;
  final String? errorMessage;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(40),
    borderSide: BorderSide.none,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.w400, fontSize: 20, color: Colors.black),
        ),
        TextFormField(
          onChanged: onChanged,
          validator: validator,
          decoration: InputDecoration(
            hintText: label,
            filled: true,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            enabledBorder: border,
            focusedBorder: border.copyWith(
              borderSide: BorderSide(color: Styles.primaryColor),
            ),
            errorBorder: border.copyWith(
              borderSide: BorderSide(color: Styles.error),
            ),
            focusedErrorBorder: border.copyWith(
              borderSide: BorderSide(color: Styles.error),
            ),
            errorText: errorMessage,
          ),
        ),
      ],
    );
  }
}
