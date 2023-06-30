import 'package:flutter/material.dart';
import 'package:teacher_finder/common/widgets/offer_detail_requirements.dart';

import '../../../domain/entities/offer.dart';
import 'apply_button.dart';

class OfferDetail extends StatelessWidget {
  const OfferDetail({super.key, required this.offer});
  final Offer offer;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Text(
              offer.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Row(
              children: [
                Text(
                  'Posted ${DateTime.now().difference(offer.initialDate!).inDays} days ago | ',
                  style: const TextStyle(fontSize: 15, color: Colors.grey),
                ),
                Text(
                  '${offer.numberApplications} applicants',
                  style: const TextStyle(fontSize: 15, color: Colors.grey),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 0.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Description',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(offer.description),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    children: [
                      OfferDetailRequirements(
                          requirement: offer.positionProfile.name),
                      OfferDetailRequirements(
                          requirement: offer.positionProfile.course.course),
                      OfferDetailRequirements(
                          requirement: offer.positionProfile.experience.value),
                      OfferDetailRequirements(
                          requirement: offer.positionProfile.modality.value),
                      OfferDetailRequirements(
                          requirement: offer.positionProfile.type.value),
                      OfferDetailRequirements(
                          requirement:
                              '${offer.salary.mount.toString()} ${offer.salary.currency.value}'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    children: [
                      const Icon(Icons.calendar_month),
                      Text(
                        'End date: ${offer.initialDate?.day}/${offer.initialDate?.month}/${offer.initialDate?.year}',
                        style: const TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ),
                ApplyButton(
                  jobOfferId: offer.id,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
