import 'package:flutter/material.dart';

import '../../../../common/styles/styles.dart';

class QuestionsList extends StatelessWidget {
  const QuestionsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 10,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.yellow),
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Styles.secondaryColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text('Question $index',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                  color: Styles.primaryColor,
                  borderRadius: BorderRadius.circular(20)),
              child: const Center(
                child: Icon(
                  Icons.add,
                  size: 40,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
