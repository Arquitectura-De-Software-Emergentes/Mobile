import 'package:flutter/material.dart';
import 'package:teacher_finder/offers/domain/entities/offer.dart';

import '../../../../common/styles/styles.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({Key? key, required this.offer, required this.onPress}) : super(key: key);
  final Offer offer;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 4),
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  offer.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  width: 10,
                  child: Text(
                    offer.description,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.calendar_month),
                        Text(
                          '${offer.initialDate}',
                          style: const TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                    FilledButton(
                        style: FilledButton.styleFrom(
                            backgroundColor: Styles.secondaryColor),
                        onPressed: () {
                          onPress();
                        },
                        child: Text(
                          'View',
                          style: TextStyle(color: Styles.white, fontSize: 14),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
