import 'package:flutter/material.dart';

import '../bloc/new_offer_bloc.dart';

class DateInput extends StatefulWidget {
  const DateInput(
      {super.key,
      required this.title,
      required this.label,
      this.onChanged,
      required this.newOfferBloc,
      this.errorMessage,
      required this.dateText,
      required this.onDateSelected});
  final String title;
  final String dateText;
  final String label;
  final NewOfferBloc newOfferBloc;
  final Function(DateTime) onDateSelected;
  final String? errorMessage;
  final Function(String)? onChanged;
  @override
  State<DateInput> createState() => _DateInputState();
}

class _DateInputState extends State<DateInput> {
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2024),
    );

    if (pickedDate != null) {
      widget.onDateSelected(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
              fontWeight: FontWeight.w400, fontSize: 20, color: Colors.black),
        ),
        TextFormField(
          onChanged: widget.onChanged,
          controller: TextEditingController(text: widget.dateText),
          readOnly: true,
          onTap: () {
            _selectDate(context);
          },
          decoration: InputDecoration(
            errorText: widget.errorMessage,
            hintText: widget.label,
            filled: true,
            fillColor: const Color(0xFFEFEFF0),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
