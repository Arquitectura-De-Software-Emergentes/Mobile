import 'package:flutter/material.dart';

import '../../../../common/styles/styles.dart';
import '../../../domain/entities/offer.dart';
import 'apply_button.dart';

class OfferDetailCard extends StatelessWidget {
  const OfferDetailCard({super.key, required this.offer});
  final Offer offer;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Styles.gray))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
                child: Text(
                  offer.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24),
                ),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Description',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(offer.description),
                          const Text('Requirements:'),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 8.0,
                                      child: Text(
                                        '\u2022',
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                    ),
                                    Text('  3 years of experience'),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 8.0,
                                      child: Text(
                                        '\u2022',
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                    ),
                                    Text('  math domain'),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 8.0,
                                      child: Text(
                                        '\u2022',
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                    ),
                                    Text('  good communication'),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 8.0,
                                      child: Text(
                                        '\u2022',
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                    ),
                                    Text('  equip work'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Text(
                            'Benefits: ',
                            style: TextStyle(fontSize: 14),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                const Row(
                                  children: [
                                    SizedBox(
                                      width: 8.0,
                                      child: Text(
                                        '\u2022',
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                    ),
                                    Text('  good work environment'),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 8.0,
                                      child: Text(
                                        '\u2022',
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                    ),
                                    Text('  S/ ${offer.salary} per month'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 26.0),
                            child: Row(
                              children: [
                                const Icon(Icons.calendar_month),
                                Text(
                                  '${offer.initialDate}',
                                  style: const TextStyle(fontSize: 15),
                                )
                              ],
                            ),
                          ),
                          const ApplyButton()
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
