import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../common/widgets/custom_app_bar.dart';
import '../infrastucture/data_sources/profile_teacher_remove_data_provider.dart';
import '../infrastucture/models/profile_teacher_model.dart';
import 'menu_information_screen.dart';

class ContactInformationTeacherScreen extends StatelessWidget {
  final String? phone;
  final String? email;
  final String? mobilePhone;
  const ContactInformationTeacherScreen({Key? key, this.phone, this.email, this.mobilePhone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: 'Contact Information',
        ),
        body: Container(
            padding: const EdgeInsets.all(25),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  ListTile(
                    title:Text("Phone",style: Theme.of(context).textTheme.bodyMedium?.apply(color:Colors.black)),
                    subtitle: TextFormField(
                      initialValue: "Pedrito",
                      style: Theme.of(context).textTheme.bodyMedium?.apply(color:Colors.black),
                      onChanged: (newValue) {
                      },
                    ),
                  ),
                  ListTile(
                    title:Text("Email",style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w500, color: Colors.black)),
                    subtitle: TextFormField(
                      initialValue: "Gonzales",
                      style: Theme.of(context).textTheme.bodyMedium?.apply(color:Colors.black),
                      onChanged: (newValue) {
                      },
                    ),
                  ),
                  ListTile(
                    title:Text("Mobile Phone",style: Theme.of(context).textTheme.bodyMedium?.apply(color:Colors.black)),
                    subtitle: TextFormField(
                      initialValue: "736658",
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
          final phone= profileData.contactInformation.phone;
          final email= profileData.contactInformation.email;
          final mobilePhone= profileData.contactInformation.mobilePhone;


          return ContactInformationTeacherScreen(
            phone: phone,
            email: email,
            mobilePhone: mobilePhone,
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
