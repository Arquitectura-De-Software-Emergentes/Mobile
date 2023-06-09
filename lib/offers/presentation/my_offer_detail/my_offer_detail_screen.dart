import 'package:flutter/material.dart';
import 'package:teacher_finder/common/widgets/custom_app_bar.dart';

import '../../../common/styles/styles.dart';
import '../../domain/entities/offer.dart';

class MyOfferDetailScreen extends StatelessWidget {
  const MyOfferDetailScreen({super.key, required this.offer});
  final Offer offer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 25),
        child: Card(
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 24),
                    child: Text(
                      offer.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                  )),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Description',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(offer.description),
                              const Text('requirements:'),
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 26.0),
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
                              FilledButton(
                                onPressed: () {
                                  showTeachers(offer);
                                },
                                style: FilledButton.styleFrom(
                                  backgroundColor: Styles.secondaryColor,
                                  minimumSize: Size(
                                      MediaQuery.of(context).size.width, 40),
                                ),
                                child: Text(
                                  'Show Teachers',
                                  style: TextStyle(
                                      color: Styles.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              FilledButton(
                                onPressed: () {
                                  modifyOffer(offer);
                                },
                                style: FilledButton.styleFrom(
                                  backgroundColor: Styles.secondaryColor,
                                  minimumSize: Size(
                                      MediaQuery.of(context).size.width, 40),
                                ),
                                child: Text(
                                  'Modify',
                                  style: TextStyle(
                                      color: Styles.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
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
        ),
      ),
    );
  }

  void showTeachers(Offer offer) {}

  void modifyOffer(Offer offer) {}
}
