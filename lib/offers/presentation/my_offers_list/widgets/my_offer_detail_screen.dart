import 'package:flutter/material.dart';
import 'package:teacher_finder/offers/presentation/offer_applicants/offer_applicants_screen.dart';

import '../../../../common/styles/styles.dart';
import '../../../domain/entities/offer.dart';
import '../../../../common/widgets/offer_detail_requirements.dart';

class MyOfferDetail extends StatelessWidget {
  const MyOfferDetail({super.key, required this.offer});
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
                  'Posted ${DateTime.now().difference(offer.initialDate).inDays} days ago | ',
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
                        'End date: ${offer.initialDate.day}/${offer.initialDate.month}/${offer.initialDate.year}',
                        style: const TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ),
                FilledButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.push(context, MaterialPageRoute(
                        builder: ((context) => const OfferApplicantsScreen())));
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: Styles.secondaryColor,
                    minimumSize: Size(MediaQuery.of(context).size.width, 40),
                  ),
                  child: Text(
                    'Show Teachers',
                    style: TextStyle(
                        color: Styles.white, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                FilledButton(
                  onPressed: () {
                    //modifyOffer(offer);
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: Styles.secondaryColor,
                    minimumSize: Size(MediaQuery.of(context).size.width, 40),
                  ),
                  child: Text(
                    'Create Test',
                    style: TextStyle(
                        color: Styles.white, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

}
