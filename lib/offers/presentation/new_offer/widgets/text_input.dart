import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  const TextInput({super.key, required this.title, required this.controller});
  final String title;
  final TextEditingController controller;
  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title,
            style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
                color: Colors.black)),
        TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFEFEFF0),
              contentPadding: const EdgeInsets.symmetric(vertical: 15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              )),
        ),
      ],
    );
  }
}
