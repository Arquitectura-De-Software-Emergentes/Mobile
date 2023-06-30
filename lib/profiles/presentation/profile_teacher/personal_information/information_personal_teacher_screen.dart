import 'package:flutter/material.dart';
import 'package:teacher_finder/common/widgets/custom_app_bar.dart';
import '../../../infrastucture/data_sources/profile_teacher_remote_data_provider.dart';
import '../../../infrastucture/models/profile_teacher_model.dart';

class InfomationPersonalTeacherScreen extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController lastNameController;
  final TextEditingController dniController;
  final TextEditingController birthDateController;
  final TextEditingController addressController;
  final bool isEditing;
  const InfomationPersonalTeacherScreen(
      {Key? key,
      required this.nameController,
      required this.lastNameController,
      required this.dniController,
      required this.birthDateController,
      required this.addressController,
      required this.isEditing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(isEditing);
    return Scaffold(
        appBar: const CustomAppBar(
          title: 'Personal Information',
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
                          title: Text('Name',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                      fontWeight: FontWeight.w100,
                                      color: Colors.black)),
                          subtitle: TextFormField(
                            enabled: isEditing,
                            controller: nameController,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.apply(color: Colors.black),
                            onChanged: (newValue) {},
                          ),
                        ),
                        ListTile(
                          title: Text("Last Name",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                      fontWeight: FontWeight.w100,
                                      color: Colors.black)),
                          subtitle: TextFormField(
                            enabled: isEditing,
                            controller: lastNameController,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.apply(color: Colors.black),
                            onChanged: (newValue) {},
                          ),
                        ),
                        ListTile(
                          title: Text("Dni",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                      fontWeight: FontWeight.w100,
                                      color: Colors.black)),
                          subtitle: TextFormField(
                            enabled: isEditing,
                            controller: dniController,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.apply(color: Colors.black),
                            onChanged: (newValue) {},
                          ),
                        ),
                        ListTile(
                          title: Text("BirthDate",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                      fontWeight: FontWeight.w100,
                                      color: Colors.black)),
                          subtitle: TextFormField(
                            enabled: isEditing,
                            controller: birthDateController,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.apply(color: Colors.black),
                            onChanged: (newValue) {},
                          ),
                        ),
                        ListTile(
                          title: Text("Address",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                      fontWeight: FontWeight.w100,
                                      color: Colors.black)),
                          subtitle: TextFormField(
                            enabled: isEditing,
                            controller: addressController,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.apply(color: Colors.black),
                            onChanged: (newValue) {},
                          ),
                        ),
                      ]));
            }));
  }
}
