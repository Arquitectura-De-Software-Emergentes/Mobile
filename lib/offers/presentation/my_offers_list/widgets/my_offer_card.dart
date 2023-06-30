import 'package:flutter/material.dart';
import 'package:teacher_finder/offers/domain/entities/offer.dart';

import '../../../../../../common/styles/styles.dart';

class MyOfferCard extends StatelessWidget {
  const MyOfferCard({
    Key? key,
    required this.offer,
  }) : super(key: key);
  final Offer offer;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 00),
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        offer.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        '${offer.maxApplications.toString()} applications',
                      ),
                    ],
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
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.calendar_month_outlined,
                                  color: Colors.grey,
                                ),
                                Text(
                                  'From: ${offer.initialDate?.day}/${offer.initialDate?.month}/${offer.initialDate?.year} to ${offer.endDate.day}/${offer.endDate.month}/${offer.endDate.year}',
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.edit_note_outlined)),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.delete_outline)),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              color: Styles.gray,
            )
          ],
        ),
      ),
    );
  }
}
