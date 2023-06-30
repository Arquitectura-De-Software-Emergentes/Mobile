import 'package:flutter/material.dart';
import 'package:teacher_finder/appications/presentation/applications_list/applications_list.dart';
import 'package:teacher_finder/assessment/infrastructure/data_sources/assessment_remote_data_provider.dart';

import '../../../../assessment/domain/entities/test.dart';
import '../../../../common/styles/styles.dart';
import '../../../domain/entities/offer.dart';
import '../../../../common/widgets/offer_detail_requirements.dart';

class MyOfferDetail extends StatefulWidget {
  const MyOfferDetail({super.key, required this.offer, required this.tests});
  final Offer offer;
  final List<Test> tests;

  @override
  State<MyOfferDetail> createState() => _MyOfferDetailState();
}

class _MyOfferDetailState extends State<MyOfferDetail> {
  Test? selectedTest;

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
              widget.offer.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Row(
              children: [
                Text(
                  'Posted ${DateTime.now().difference(widget.offer.initialDate!).inDays} days ago | ',
                  style: const TextStyle(fontSize: 15, color: Colors.grey),
                ),
                Text(
                  '${widget.offer.numberApplications} applicants',
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
                Text(widget.offer.description),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    children: [
                      OfferDetailRequirements(
                          requirement: widget.offer.positionProfile.name),
                      OfferDetailRequirements(
                          requirement:
                              widget.offer.positionProfile.course.course),
                      OfferDetailRequirements(
                          requirement:
                              widget.offer.positionProfile.experience.value),
                      OfferDetailRequirements(
                          requirement:
                              widget.offer.positionProfile.modality.value),
                      OfferDetailRequirements(
                          requirement: widget.offer.positionProfile.type.value),
                      OfferDetailRequirements(
                          requirement:
                              '${widget.offer.salary.mount.toString()} ${widget.offer.salary.currency.value}'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    children: [
                      const Icon(Icons.calendar_month),
                      Text(
                        'End date: ${widget.offer.initialDate?.day}/${widget.offer.initialDate?.month}/${widget.offer.initialDate?.year}',
                        style: const TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ),
                FilledButton(
                  onPressed: () {
                    showTeachers(widget.offer);
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
                DropdownButtonFormField<Test>(
                  hint: const Text(
                    'TESTS',
                    style: TextStyle(color: Colors.white),
                  ),
                  dropdownColor: Styles.secondaryColor,
                  value: selectedTest,
                  onChanged: (Test? newValue) {
                    setState(() {
                      selectedTest = newValue;
                    });
                  },
                  items: widget.tests.map((Test test) {
                    return DropdownMenuItem<Test>(
                      value: test,
                      child: Text(
                        test.title,
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    fillColor: Styles.secondaryColor,
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 5.0),
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                FilledButton(
                  onPressed: selectedTest != null
                      ? () {
                          print(selectedTest?.title);
                          final assessmentRemoteDataProvider =
                              AssessmentRemoteDataProvider();
                          assessmentRemoteDataProvider.selectedTestByOffer(
                              widget.offer.id, selectedTest!.id);
                          Navigator.pop(context);
                        }
                      : null,
                  style: FilledButton.styleFrom(
                    backgroundColor: Styles.secondaryColor,
                    minimumSize: Size(MediaQuery.of(context).size.width, 40),
                  ),
                  child: Text(
                    'Select test',
                    style: TextStyle(
                        color: Styles.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showTeachers(Offer offer) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ApplicationsListScreen(offerId: offer.id)));
  }

  void modifyOffer(Offer offer) {}
}
