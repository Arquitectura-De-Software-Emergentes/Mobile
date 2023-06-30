import 'package:flutter/material.dart';
import 'package:teacher_finder/appications/infrastructure/applications_remote_data_source.dart';
import 'package:teacher_finder/assessment/infrastructure/data_sources/assessment_remote_data_provider.dart';

class ApplicantCard extends StatefulWidget {
  final String name;
  final String lastName;
  final String school;
  final String specialty;
  final String reference;
  final String phone;
  final String email;
  final String birthDate;
  final String address;
  final int jobOfferId;
  final int applicantId;

  const ApplicantCard({
    Key? key,
    required this.school,
    required this.specialty,
    required this.reference,
    required this.phone,
    required this.email,
    required this.name,
    required this.lastName,
    required this.birthDate,
    required this.address,
    required this.jobOfferId,
    required this.applicantId,
  }) : super(key: key);

  @override
  _ApplicantCardState createState() => _ApplicantCardState();
}

class _ApplicantCardState extends State<ApplicantCard> {
  bool _expanded = false;
  final assessmentRemoteDataProvider = AssessmentRemoteDataProvider();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: FutureBuilder(
        future: assessmentRemoteDataProvider.getTestResult(
          widget.jobOfferId,
          widget.applicantId,
        ),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final score = snapshot.data?["score"];
            final hasPassed = snapshot.data?["hasPassed"];
            return ExpansionTile(
              subtitle: SizedBox(
                  width: 100,
                  child: score == null
                      ? Text('Test result: N/A')
                      : Text('Test Result: $score')),
              leading: score == null
                  ? const Icon(
                      Icons.person,
                      size: 50,
                    )
                  : hasPassed
                      ? const Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.green,
                        )
                      : const Icon(Icons.person, size: 50, color: Colors.red),
              title: Text('${widget.name} ${widget.lastName}'),
              trailing: IconButton(
                icon: Icon(
                  _expanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                ),
                onPressed: () {
                  setState(() {
                    _expanded = !_expanded;
                  });
                },
              ),
              onExpansionChanged: (expanded) {
                setState(() {
                  _expanded = expanded;
                });
              },
              children: [
                ListTile(
                  title: const Text('Academic Information'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('School: ${widget.school}'),
                      Text('Specialty: ${widget.specialty}'),
                      Text('Reference: ${widget.reference}'),
                    ],
                  ),
                ),
                ListTile(
                  title: const Text('Contact Information'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Phone: ${widget.phone}'),
                      Text('Email: ${widget.email}'),
                    ],
                  ),
                ),
                ListTile(
                  title: const Text('Personal Information'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Birth Date: ${widget.birthDate}'),
                      Text('Address: ${widget.address}'),
                    ],
                  ),
                ),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
