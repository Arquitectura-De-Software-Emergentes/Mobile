import 'package:flutter/material.dart';

class AlternativesList extends StatelessWidget {
  AlternativesList({
    super.key,
  });

  final List<Color> colors = [
    const Color.fromARGB(255, 35, 60, 224),
    const Color(0xFFffc52c),
    const Color(0xFFfb0c06),
    const Color(0xFF030d4f),
    const Color.fromARGB(255, 201, 37, 160),
  ];
  final List<String> keys = ['A', 'B', 'C', 'D', 'E'];

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
              height: MediaQuery.of(context).size.height / 8,
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
                      child: Checkbox(
                        fillColor: MaterialStateColor.resolveWith((states) {
                          if (states.contains(MaterialState.disabled)) {
                            return Colors.white;
                          }
                          if (states.contains(MaterialState.selected)) {
                            return Colors.green;
                          }
                          return Colors.white;
                        }),
                        activeColor: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0)),
                        value: false,
                        onChanged: (value) {},
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
