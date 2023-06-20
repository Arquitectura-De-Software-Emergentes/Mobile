import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:teacher_finder/common/widgets/custom_app_bar.dart';

import '../infrastucture/data_sources/profile_teacher_remove_data_provider.dart';
import '../infrastucture/models/profile_teacher_model.dart';
import 'menu_information_screen.dart';

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
        body: Container(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              ListTile(
                title:Text("Name",style: Theme.of(context).textTheme.bodyMedium?.apply(color:Colors.black)),
                subtitle: TextFormField(
                  initialValue: '${name ?? ''}',
                  style: Theme.of(context).textTheme.bodyMedium?.apply(color:Colors.black),
                  onChanged: (newValue) {
                  },
                ),
              ),
              ListTile(
                title:Text("Last Name",style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w500, color: Colors.black)),
                subtitle: TextFormField(
                  initialValue: '${lastname ?? ''}',
                  style: Theme.of(context).textTheme.bodyMedium?.apply(color:Colors.black),
                  onChanged: (newValue) {
                  },
                ),
              ),
              ListTile(
                title:Text("Dni",style: Theme.of(context).textTheme.bodyMedium?.apply(color:Colors.black)),
                subtitle: TextFormField(
                  initialValue: '${dni ?? ''}',
                  style: Theme.of(context).textTheme.bodyMedium?.apply(color:Colors.black),
                  onChanged: (newValue) {
                  },
                ),
              ),
              ListTile(
                title:Text("BirthDate",style: Theme.of(context).textTheme.bodyMedium?.apply(color:Colors.black)),
                subtitle: TextFormField(
                  initialValue: '${birthDate ?? ''}',
                  style: Theme.of(context).textTheme.bodyMedium?.apply(color:Colors.black),
                  onChanged: (newValue) {
                  },
                ),
              ),
              ListTile(
                title:Text("Address",style: Theme.of(context).textTheme.bodyMedium?.apply(color:Colors.black)),
                subtitle: TextFormField(
                  initialValue: '${address ?? ''}',
                  style: Theme.of(context).textTheme.bodyMedium?.apply(color:Colors.black),
                  onChanged: (newValue) {
                  },
                ),
              ),

            ]
          )
        ));
  }
}

class ProfileTeacherWidget extends StatelessWidget {
  const ProfileTeacherWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ProfileTeacherModel>(
      future: ProfileTeacherRemoveDataProvider().getProfileTeacherById(1),
      builder: (BuildContext context, AsyncSnapshot<ProfileTeacherModel> snapshot) {
        if (snapshot.hasData) {
          final profileData = snapshot.data!;
          final name = profileData.personalInformation.name;
          final lastname = profileData.personalInformation.lastname;
          final dni = profileData.personalInformation.dni;
          final birthDate = profileData.personalInformation.birthDate;
          final address = profileData.personalInformation.address;

          return InfomationPersonalTeacherScreen(
            name: name,
            lastname: lastname,
            dni: dni,
            birthDate: birthDate,
            address: address,
          );
        } else if (snapshot.hasError) {
          return Text('Error al cargar el perfil del docente');
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
