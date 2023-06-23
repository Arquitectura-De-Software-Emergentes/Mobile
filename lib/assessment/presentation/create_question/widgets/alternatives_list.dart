import 'package:flutter/material.dart';

enum CorrectAlternative { A, B, C, D, E }

class AlternativesList extends StatefulWidget {
  const AlternativesList({
    super.key,
  });

  @override
  State<AlternativesList> createState() => _AlternativesListState();
}

class _AlternativesListState extends State<AlternativesList> {
  final List<Color> colors1 = [
    const Color.fromARGB(255, 35, 60, 224),
    const Color(0xFFffc52c),
    const Color(0xFFfb0c06),
    const Color(0xFF030d4f),
    const Color.fromARGB(255, 201, 37, 160),
  ];

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
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: colors[index],
              ),
              height: MediaQuery.of(context).size.height * 0.07,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '  ${keys[index]}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  Expanded(
                    child: Center(
                      child: TextFormField(
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
                        value: listCorrectAlternative[index],
                        groupValue: _alternative,
                        onChanged: (CorrectAlternative? value) {
                          setState(() {
                            _alternative = value;
                          });
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
