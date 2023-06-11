import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  const TextInput(
      {super.key,
      required this.title,
      required this.controller,
      required this.label});
  final String title;
  final TextEditingController controller;
  final String label;
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
              hintText: widget.label,
              filled: true,
              fillColor: const Color(0xFFEFEFF0),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              )),
        ),
      ],
    );
  }
}
