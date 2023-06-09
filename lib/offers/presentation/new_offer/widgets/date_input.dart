import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateInput extends StatefulWidget {
  const DateInput({super.key, required this.controller, required this.title});
  final TextEditingController controller;
  final String title;
  @override
  State<DateInput> createState() => _DateInputState();
}

class _DateInputState extends State<DateInput> {
  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2024),
    );

    if (pickedDate != null) {
      setState(() {
        controller.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

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
          readOnly: true,
          onTap: () {
            _selectDate(context, widget.controller);
          },
          decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xFFEFEFF0),
              contentPadding: EdgeInsets.symmetric(vertical: 15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              )),
        ),
      ],
    );
  }
}
