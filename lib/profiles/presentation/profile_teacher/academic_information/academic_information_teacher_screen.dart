import 'package:flutter/material.dart';
import 'package:teacher_finder/profiles/infrastucture/models/profile_teacher_model.dart';
import '../../../../common/widgets/custom_app_bar.dart';
import '../../../infrastucture/data_sources/profile_teacher_remote_data_provider.dart';

class AcademicInformationTeacher extends StatelessWidget {
  final TextEditingController schoolController;
  final TextEditingController specialtyController;
  final TextEditingController referenceController;
  final bool isEditing;
  const AcademicInformationTeacher({
    Key? key,
    required this.schoolController,
    required this.specialtyController,
    required this.referenceController,
    required this.isEditing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Academic Information',
      ),
      body: FutureBuilder<Map<String, dynamic>>(
          future: ProfileTeacherRemoteDataProvider().getProfileTeacherById(),
          builder: (context, snapshot) {
            return Container(
                padding: const EdgeInsets.all(25),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text("School",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.apply(color: Colors.black)),
                        subtitle: TextFormField(
                          enabled: isEditing,
                          controller: schoolController,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.apply(color: Colors.black),
                          onChanged: (newValue) {},
                        ),
                      ),
                      ListTile(
                        title: Text("Specialty",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black)),
                        subtitle: TextFormField(
                          enabled: isEditing,
                          controller: specialtyController,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.apply(color: Colors.black),
                          onChanged: (newValue) {},
                        ),
                      ),
                      ListTile(
                        title: Text("Reference",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.apply(color: Colors.black)),
                        subtitle: TextFormField(
                          enabled: isEditing,
                          controller: referenceController,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.apply(color: Colors.black),
                          onChanged: (newValue) {},
                        ),
                      ),
                    ]));
          }),
    );
  }
}
