import 'package:flutter/material.dart';
import '../../../../common/widgets/custom_app_bar.dart';
import '../../../infrastucture/data_sources/profile_teacher_remove_data_provider.dart';
import '../../../infrastucture/models/profile_teacher_model.dart';

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
        body: FutureBuilder<ProfileTeacherModel>(
          future: ProfileTeacherRemoveDataProvider().getProfileTeacherById(1),
          builder: (context,snapshot) {
            final phoneController = TextEditingController(
                text: snapshot.data?.contactInformation.phone.toString());
            final emailController = TextEditingController(
                text: snapshot.data?.contactInformation.email.toString());
            final mobilePhoneController = TextEditingController(
                text: snapshot.data?.contactInformation.mobilePhone.toString());

            return Container(
                padding: const EdgeInsets.all(25),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      ListTile(
                        title:Text("Phone",style: Theme.of(context).textTheme.bodyMedium?.apply(color:Colors.black)),
                        subtitle: TextFormField(
                          controller: phoneController,
                          style: Theme.of(context).textTheme.bodyMedium?.apply(color:Colors.black),
                          onChanged: (newValue) {
                          },
                        ),
                      ),
                      ListTile(
                        title:Text("Email",style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w500, color: Colors.black)),
                        subtitle: TextFormField(
                          controller: emailController,
                          style: Theme.of(context).textTheme.bodyMedium?.apply(color:Colors.black),
                          onChanged: (newValue) {
                          },
                        ),
                      ),
                      ListTile(
                        title:Text("Mobile Phone",style: Theme.of(context).textTheme.bodyMedium?.apply(color:Colors.black)),
                        subtitle: TextFormField(
                          controller: mobilePhoneController,
                          style: Theme.of(context).textTheme.bodyMedium?.apply(color:Colors.black),
                          onChanged: (newValue) {
                          },
                        ),
                      ),
                    ]
                )
            );
          }
        ));
  }
}

