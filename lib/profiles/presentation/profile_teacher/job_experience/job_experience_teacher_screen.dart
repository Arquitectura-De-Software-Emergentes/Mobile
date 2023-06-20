import 'package:flutter/material.dart';
import '../../../../common/widgets/custom_app_bar.dart';

class JobExperienceTeacherScreen extends StatelessWidget {
  const JobExperienceTeacherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: 'Job Experience',
        ),
        body: Container(
            padding: const EdgeInsets.all(25),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  ListTile(
                    title:Text("Company",style: Theme.of(context).textTheme.bodyMedium?.apply(color:Colors.black)),
                    subtitle: TextFormField(
                      initialValue: "Pedrito",
                      style: Theme.of(context).textTheme.bodyMedium?.apply(color:Colors.black),
                      onChanged: (newValue) {
                      },
                    ),
                  ),
                  ListTile(
                    title:Text("Position",style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w500, color: Colors.black)),
                    subtitle: TextFormField(
                      initialValue: "Gonzales",
                      style: Theme.of(context).textTheme.bodyMedium?.apply(color:Colors.black),
                      onChanged: (newValue) {
                      },
                    ),
                  ),
                  ListTile(
                    title:Text("Time",style: Theme.of(context).textTheme.bodyMedium?.apply(color:Colors.black)),
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
