import 'package:flutter/material.dart';
import 'package:teacher_finder/assessment/infrastructure/data_sources/assessment_remote_data_provider.dart';
import 'package:teacher_finder/common/widgets/applicant_custom_drawer.dart';
import 'package:teacher_finder/offers/presentation/offers_list/offers_list_screen.dart';

import '../../../common/styles/styles.dart';

class VideoPresentationResult extends StatefulWidget {
  const VideoPresentationResult(
      {super.key, required this.result, required this.jobOfferId});
  final String result;
  final int jobOfferId;
  @override
  State<VideoPresentationResult> createState() =>
      _VideoPresentationResultState();
}

class _VideoPresentationResultState extends State<VideoPresentationResult> {
  final assessmentRemoteDataProvider = AssessmentRemoteDataProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const ApplicantCustomDrawer(),
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.check_circle,
            size: 200,
            color: Colors.green,
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.result,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Container(
            constraints: const BoxConstraints.tightFor(width: 230, height: 40),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Styles.secondaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              onPressed: () {
                assessmentRemoteDataProvider.saveRecommendation(
                    widget.result, widget.jobOfferId);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => OffersListScreen()),
                    (route) => false);
              },
              child: const Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home,
                      color: Colors.white,
                      size: 18,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Home',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
