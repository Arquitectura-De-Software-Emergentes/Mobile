import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../common/widgets/custom_app_bar.dart';
import 'menu_information_screen.dart';

class ContactInformationTeacherScreen extends StatelessWidget {
  const ContactInformationTeacherScreen({Key? key}) : super(key: key);

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
