import 'package:flutter/material.dart';
import 'package:teacher_finder/appications/infrastructure/applications_remote_data_source.dart';
import 'package:teacher_finder/common/user_config/user_config.dart';

import '../../../../common/styles/styles.dart';

class ApplyButton extends StatelessWidget {
  const ApplyButton({super.key, required this.jobOfferId});
  final int jobOfferId;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () async {
        final applicationsRemoteDateSource = ApplicationsRemoteDateSource();

        int applicantId = await UserConfig.getUserId();
        applicationsRemoteDateSource.applyJobOffer(jobOfferId, applicantId);
        Navigator.pop(context);

        const snackBar = SnackBar(
          content: Text(
            'You\'ve successfully applied to this job.',
          ),
          backgroundColor: Colors.green,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      style: FilledButton.styleFrom(
        backgroundColor: Styles.secondaryColor,
        minimumSize: Size(MediaQuery.of(context).size.width, 40),
      ),
      child: Text(
        'Apply',
        style: TextStyle(color: Styles.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
