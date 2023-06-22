import 'package:flutter/material.dart';
import 'package:teacher_finder/profiles/infrastucture/models/profile_teacher_model.dart';
import '../../../../common/widgets/custom_app_bar.dart';
import '../../../infrastucture/data_sources/profile_teacher_remove_data_provider.dart';

class AcademicInformationTeacher extends StatelessWidget {
  final String? school;
  final String? specialty;
  final String? reference;

  const AcademicInformationTeacher({Key? key, this.school, this.specialty, this.reference}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          appBar: const CustomAppBar(
            title: 'Academic Information',
          ),
          body: FutureBuilder<ProfileTeacherModel>(
            future: ProfileTeacherRemoveDataProvider().getProfileTeacherById(1),
            builder: (context,snapshot){
              final schoolController = TextEditingController(
                  text: snapshot.data?.academicInformation.school.toString());
              final specialtyController = TextEditingController(
                  text: snapshot.data?.academicInformation.specialty.toString());
              final referenceController = TextEditingController(
                  text: snapshot.data?.academicInformation.reference.toString());

              return Container(
              padding: const EdgeInsets.all(25),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    ListTile(
                      title:Text("School",style: Theme.of(context).textTheme.bodyMedium?.apply(color:Colors.black)),
                      subtitle: TextFormField(
                        controller: schoolController,
                        style: Theme.of(context).textTheme.bodyMedium?.apply(color:Colors.black),
                        onChanged: (newValue) {
                        },
                      ),
                    ),
                    ListTile(
                      title:Text("Specialty",style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w500, color: Colors.black)),
                      subtitle: TextFormField(
                        controller: specialtyController,
                        style: Theme.of(context).textTheme.bodyMedium?.apply(color:Colors.black),
                        onChanged: (newValue) {
                        },
                      ),
                    ),
                    ListTile(
                      title:Text("Reference",style: Theme.of(context).textTheme.bodyMedium?.apply(color:Colors.black)),
                      subtitle: TextFormField(
                        controller: referenceController,
                        style: Theme.of(context).textTheme.bodyMedium?.apply(color:Colors.black),
                        onChanged: (newValue) {
                        },
                      ),
                    ),
                  ]
              )
    );
            }
          ),
      );
  }
}
