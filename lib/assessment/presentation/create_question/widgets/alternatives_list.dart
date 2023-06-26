import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_finder/assessment/presentation/create_question/bloc/create_question_bloc.dart';

enum CorrectAlternative { A, B, C, D, E }

class AlternativesList extends StatefulWidget {
  const AlternativesList({
    super.key,
    required this.onCorrectAlternativeSelected,
  });
  final Function(CorrectAlternative) onCorrectAlternativeSelected;

  @override
  State<AlternativesList> createState() => _AlternativesListState();
}

class _AlternativesListState extends State<AlternativesList> {
  final List<Color> colors = [
    const Color(0xFF171740),
    const Color(0xFF171740),
    const Color(0xFF171740),
    const Color(0xFF171740),
    const Color(0xFF171740),
  ];

  final List<String> keys = ['A', 'B', 'C', 'D', 'E'];

  CorrectAlternative? _alternative = CorrectAlternative.A;
  List<CorrectAlternative> listCorrectAlternative = CorrectAlternative.values;

  @override
  Widget build(BuildContext context) {
    final createQuestionBloc = context.watch<CreateQuestionBloc>();

    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: colors[1],
              ),
              height: MediaQuery.of(context).size.height * 0.07,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'A',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  Expanded(
                    child: Center(
                      child: TextFormField(
                        onChanged: (value) =>
                            createQuestionBloc.alternativeA(value),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        maxLines: 5,
                        decoration: const InputDecoration(
                          fillColor: Colors.red,
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Transform.scale(
                      scale: 2,
                      child: Radio<CorrectAlternative>(
                        activeColor: Colors.green,
                        value: CorrectAlternative.A,
                        groupValue: _alternative,
                        onChanged: (CorrectAlternative? value) {
                          setState(() {
                            _alternative = value;
                            widget.onCorrectAlternativeSelected(value!);
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            )),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: colors[1],
              ),
              height: MediaQuery.of(context).size.height * 0.07,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'B',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  Expanded(
                    child: Center(
                      child: TextFormField(
                        onChanged: (value) =>
                            createQuestionBloc.alternativeB(value),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        maxLines: 5,
                        decoration: const InputDecoration(
                          fillColor: Colors.red,
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Transform.scale(
                      scale: 2,
                      child: Radio<CorrectAlternative>(
                        activeColor: Colors.green,
                        value: CorrectAlternative.B,
                        groupValue: _alternative,
                        onChanged: (CorrectAlternative? value) {
                          setState(() {
                            _alternative = value;
                            widget.onCorrectAlternativeSelected(value!);
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            )),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: colors[1],
              ),
              height: MediaQuery.of(context).size.height * 0.07,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'C',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  Expanded(
                    child: Center(
                      child: TextFormField(
                        onChanged: (value) =>
                            createQuestionBloc.alternativeC(value),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        maxLines: 5,
                        decoration: const InputDecoration(
                          fillColor: Colors.red,
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Transform.scale(
                      scale: 2,
                      child: Radio<CorrectAlternative>(
                        activeColor: Colors.green,
                        value: CorrectAlternative.C,
                        groupValue: _alternative,
                        onChanged: (CorrectAlternative? value) {
                          setState(() {
                            _alternative = value;
                            widget.onCorrectAlternativeSelected(value!);
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            )),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: colors[1],
              ),
              height: MediaQuery.of(context).size.height * 0.07,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'D',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  Expanded(
                    child: Center(
                      child: TextFormField(
                        onChanged: (value) =>
                            createQuestionBloc.alternativeD(value),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        maxLines: 5,
                        decoration: const InputDecoration(
                          fillColor: Colors.red,
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Transform.scale(
                      scale: 2,
                      child: Radio<CorrectAlternative>(
                        activeColor: Colors.green,
                        value: CorrectAlternative.D,
                        groupValue: _alternative,
                        onChanged: (CorrectAlternative? value) {
                          setState(() {
                            _alternative = value;
                            widget.onCorrectAlternativeSelected(value!);
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            )),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: colors[1],
              ),
              height: MediaQuery.of(context).size.height * 0.07,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'E',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  Expanded(
                    child: Center(
                      child: TextFormField(
                        onChanged: (value) =>
                            createQuestionBloc.alternativeE(value),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        maxLines: 5,
                        decoration: const InputDecoration(
                          fillColor: Colors.red,
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Transform.scale(
                      scale: 2,
                      child: Radio<CorrectAlternative>(
                        activeColor: Colors.green,
                        value: CorrectAlternative.E,
                        groupValue: _alternative,
                        onChanged: (CorrectAlternative? value) {
                          setState(() {
                            _alternative = value;
                            widget.onCorrectAlternativeSelected(value!);
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
