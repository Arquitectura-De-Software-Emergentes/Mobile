import 'package:flutter/material.dart';
import 'package:teacher_finder/offers/domain/entities/offer.dart';
import '../../../../../../common/styles/styles.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({
    Key? key,
    required this.offer,
  }) : super(key: key);
  final Offer offer;

  String hoursOrDays() {
    final difference = offer.initialDate != null
        ? DateTime.now().difference(offer.initialDate!)
        : null;

    //final difference = DateTime.now().difference(offer.initialDate!);
    if (difference != null) {
      if (difference!.inHours > 24) {
        int days = difference.inDays;
        return 'Posted $days ${days == 1 ? 'day' : 'days'} ago';
      } else {
        int hours = difference.inHours;
        return 'Posted $hours ${hours == 1 ? 'hour' : 'hours'} ago';
      }
    } else {
      return '0';
    }
  }

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
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.bookmark_border,
                            size: 35,
                            color: Colors.grey,
                          ))
                    ],
                  ),
                  SizedBox(
                    width: 10,
                    child: Text(
                      offer.description,
                    ),
                  ),
                  Text(
                    offer.positionProfile.modality.value,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        hoursOrDays(),
                        style:
                            const TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                      Text(
                        '${offer.maxApplications} applications',
                        style:
                            const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
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
