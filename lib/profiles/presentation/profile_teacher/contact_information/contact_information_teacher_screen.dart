import 'package:flutter/material.dart';
import '../../../../common/widgets/custom_app_bar.dart';
import '../../../infrastucture/data_sources/profile_teacher_remote_data_provider.dart';
import '../../../infrastucture/models/profile_teacher_model.dart';

class ContactInformationTeacherScreen extends StatelessWidget {
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController mobilePhoneController;
  final bool isEditing;
  const ContactInformationTeacherScreen(
      {Key? key,
      required this.phoneController,
      required this.emailController,
      required this.mobilePhoneController,
      required this.isEditing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: 'Contact Information',
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
                          title: Text("Phone",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.apply(color: Colors.black)),
                          subtitle: TextFormField(
                            enabled: isEditing,
                            controller: phoneController,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.apply(color: Colors.black),
                            onChanged: (newValue) {},
                          ),
                        ),
                        ListTile(
                          title: Text("Email",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black)),
                          subtitle: TextFormField(
                            enabled: isEditing,
                            controller: emailController,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.apply(color: Colors.black),
                            onChanged: (newValue) {},
                          ),
                        ),
                        ListTile(
                          title: Text("Mobile Phone",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.apply(color: Colors.black)),
                          subtitle: TextFormField(
                            enabled: isEditing,
                            controller: mobilePhoneController,
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
