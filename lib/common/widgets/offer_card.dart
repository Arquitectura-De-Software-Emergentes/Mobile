import 'package:flutter/material.dart';
import 'package:teacher_finder/offers/domain/entities/offer.dart';

import '../../../../common/styles/styles.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({Key? key, required this.offer, required this.onPress})
      : super(key: key);
  final Offer offer;
  final VoidCallback onPress;

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
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Posted ${DateTime.now().difference(offer.initialDate).inDays} days ago',
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.grey),
                            ),
                            Text(
                              '${offer.numberApplications} applicants',
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.grey),
                            ),
                          ],
                        ),
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
