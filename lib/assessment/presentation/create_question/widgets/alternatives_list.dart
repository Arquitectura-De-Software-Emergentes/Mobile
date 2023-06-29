import 'package:flutter/material.dart';
import 'package:teacher_finder/assessment/presentation/create_question/bloc/create_question_bloc.dart';

enum CorrectAlternative { A, B, C, D, E }

class AlternativesList extends StatefulWidget {
  final Function(CorrectAlternative) onCorrectAlternativeSelected;
  final CreateQuestionBloc createQuestionBloc;
  const AlternativesList({
    Key? key,
    required this.onCorrectAlternativeSelected,
    required this.createQuestionBloc,
  }) : super(key: key);

  @override
  _AlternativesListState createState() => _AlternativesListState();
}

class _AlternativesListState extends State<AlternativesList> {
  CorrectAlternative? selectedAlternative;

  @override
  Widget build(BuildContext context) {
    final alternativeA = widget.createQuestionBloc.state.alternativeA;
    final alternativeB = widget.createQuestionBloc.state.alternativeB;
    final alternativeC = widget.createQuestionBloc.state.alternativeC;
    final alternativeD = widget.createQuestionBloc.state.alternativeD;
    final alternativeE = widget.createQuestionBloc.state.alternativeE;

    return Column(
      children: List.generate(
        CorrectAlternative.values.length,
        (index) {
          final alternative = CorrectAlternative.values[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFF171740),
              ),
              height: MediaQuery.of(context).size.height * 0.07,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    alternative.toString().split('.').last,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: TextFormField(
                        onChanged: (value) {
                          switch (alternative) {
                            case CorrectAlternative.A:
                              widget.createQuestionBloc.alternativeA(value);
                              break;
                            case CorrectAlternative.B:
                              widget.createQuestionBloc.alternativeB(value);
                              break;
                            case CorrectAlternative.C:
                              widget.createQuestionBloc.alternativeC(value);
                              break;
                            case CorrectAlternative.D:
                              widget.createQuestionBloc.alternativeD(value);
                              break;
                            case CorrectAlternative.E:
                              widget.createQuestionBloc.alternativeE(value);
                              break;
                            default:
                              break;
                          }
                        },
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
                        value: alternative,
                        groupValue: selectedAlternative,
                        onChanged: (value) {
                          setState(() {
                            selectedAlternative = value;
                          });
                          widget.onCorrectAlternativeSelected(value!);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
