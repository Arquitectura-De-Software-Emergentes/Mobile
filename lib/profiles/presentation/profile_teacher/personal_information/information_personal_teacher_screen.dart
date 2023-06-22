import 'package:flutter/material.dart';
import 'package:teacher_finder/common/widgets/custom_app_bar.dart';
import '../../../infrastucture/data_sources/profile_teacher_remove_data_provider.dart';
import '../../../infrastucture/models/profile_teacher_model.dart';


class InfomationPersonalTeacherScreen extends StatelessWidget {
  final String? name;
  final String? lastname;
  final String? dni;
  final DateTime? birthDate;
  final String? address;

  const InfomationPersonalTeacherScreen({Key? key, this.name, this.lastname, this.dni, this.birthDate, this.address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: 'Personal Information',
        ),
        body: FutureBuilder<ProfileTeacherModel>(
            future: ProfileTeacherRemoveDataProvider().getProfileTeacherById(1),
            builder: (context, snapshot) {
              final nameController = TextEditingController(
                  text: snapshot.data?.personalInformation.name.toString());
              final lastNameController = TextEditingController(
                  text: snapshot.data?.personalInformation.lastname.toString());
              final dniController = TextEditingController(
                  text: snapshot.data?.personalInformation.dni.toString());
              final birthDateController = TextEditingController(
                  text: snapshot.data?.personalInformation.birthDate.toString());
              final addressController = TextEditingController(
                  text: snapshot.data?.personalInformation.address.toString());

              return Container(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text('Name',
                              style: Theme.of(context).textTheme.headline6?.copyWith(
                                  fontWeight: FontWeight.w100,
                                  color: Colors.black)),
                          subtitle: TextFormField(
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
                              style: Theme.of(context).textTheme.headline6?.copyWith(
                                      fontWeight: FontWeight.w100,
                                      color: Colors.black)),
                          subtitle: TextFormField(
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
                              style: Theme.of(context).textTheme.headline6?.copyWith(
                                  fontWeight: FontWeight.w100,
                                  color: Colors.black)),
                          subtitle: TextFormField(
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
                              style: Theme.of(context).textTheme.headline6?.copyWith(
                                  fontWeight: FontWeight.w100,
                                  color: Colors.black)),
                          subtitle: TextFormField(
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
                              style: Theme.of(context).textTheme.headline6?.copyWith(
                                  fontWeight: FontWeight.w100,
                                  color: Colors.black)),
                          subtitle: TextFormField(
                            controller: addressController,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.apply(color: Colors.black),
                            onChanged: (newValue) {},
                          ),
                        ),
                      ]
                  )
              );}
            )
    );
  }
}
