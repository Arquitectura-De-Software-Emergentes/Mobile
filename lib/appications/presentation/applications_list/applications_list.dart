import 'package:flutter/material.dart';
import 'package:teacher_finder/appications/infrastructure/applications_remote_data_source.dart';

import 'application_card.dart';

class ApplicationsListScreen extends StatefulWidget {
  const ApplicationsListScreen({Key? key, required this.offerId})
      : super(key: key);

  final int offerId;

  @override
  State<ApplicationsListScreen> createState() => _ApplicationsListScreenState();
}

class _ApplicationsListScreenState extends State<ApplicationsListScreen> {
  final applicationsRemoteDataSource = ApplicationsRemoteDateSource();
  late Future<List<dynamic>> _applicationsFuture;

  @override
  void initState() {
    super.initState();
    _loadApplications();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _loadApplications() async {
    _applicationsFuture = applicationsRemoteDataSource
        .getAllApplicationsByOfferId(widget.offerId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Applications'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _applicationsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error occurred while loading applications'),
            );
          }
          if (snapshot.hasData) {
            final applications = snapshot.data!;
            if (applications.isEmpty) {
              return const Center(
                child: Text(
                  'NO APPLICATIONS',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              );
            }
            return ListView.builder(
              itemCount: applications.length,
              itemBuilder: (BuildContext context, int index) {
                final application = applications[index];
                final personalInformation =
                    application['applicantProfile']['personalInformation'];
                final academicInformation =
                    application['applicantProfile']['academicInformation'];
                final contactInformation =
                    application['applicantProfile']['contactInformation'];
                final applicantId = application['applicationId']['applicantId'];
                final jobOfferId = application['applicationId']['jobOfferId'];
                return ApplicantCard(
                  name: personalInformation['name'],
                  lastName: personalInformation['lastname'],
                  school: academicInformation['school'],
                  specialty: academicInformation['specialty'],
                  reference: academicInformation['reference'],
                  address: personalInformation['address'],
                  birthDate: personalInformation['birthDate'],
                  email: contactInformation['email'],
                  phone: contactInformation['phone'],
                  applicantId: applicantId,
                  jobOfferId: jobOfferId,
                );
              },
            );
          }
          return const Center(
            child: Text('NO APPLICATIONS'),
          );
        },
      ),
    );
  }
}
