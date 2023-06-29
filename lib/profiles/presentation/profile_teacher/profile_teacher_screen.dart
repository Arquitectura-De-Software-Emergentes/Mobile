import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:teacher_finder/common/widgets/custom_app_bar.dart';
import 'package:teacher_finder/profiles/presentation/profile_teacher/academic_information/academic_information_teacher_screen.dart';
import 'package:teacher_finder/profiles/presentation/profile_teacher/contact_information/contact_information_teacher_screen.dart';
import 'package:teacher_finder/profiles/presentation/profile_teacher/job_experience/job_experience_teacher_screen.dart';
import '../../infrastucture/data_sources/profile_teacher_remove_data_provider.dart';
import '../../infrastucture/models/profile_teacher_model.dart';
import 'personal_information/information_personal_teacher_screen.dart';

class ProfileTeacherScreen extends StatelessWidget {
  final String? name;
  final String? lastname;
  const ProfileTeacherScreen({Key? key, this.name, this.lastname})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: 'Profile'),
        body: FutureBuilder<ProfileTeacherModel>(
            future: ProfileTeacherRemoveDataProvider().getProfileTeacherById(2),
            builder: (context, snapshot) {
              final nameController = TextEditingController(
                  text: snapshot.data?.personalInformation.name.toString());
              final lastNameController = TextEditingController(
                  text: snapshot.data?.personalInformation.lastname.toString());

              return Container(
                padding: const EdgeInsets.all(25),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        width: 160,
                        height: 160,
                        child: CircleAvatar(
                          backgroundColor: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(nameController.text + " " + lastNameController.text,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black)),
                      const SizedBox(height: 40),
                      menuProfile(
                        title: "Personal Information",
                        icon: LineAwesomeIcons.user,
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const InfomationPersonalTeacherScreen()),
                          );
                        },
                      ),
                      const SizedBox(height: 15),
                      menuProfile(
                          title: "Academic Information",
                          icon: LineAwesomeIcons.book,
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AcademicInformationTeacher()),
                            );
                          }),
                      const SizedBox(height: 15),
                      menuProfile(
                          title: "Contact Information",
                          icon: LineAwesomeIcons.phone,
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ContactInformationTeacherScreen()),
                            );
                          }),
                      const SizedBox(height: 15),
                      menuProfile(
                          title: "Job Experience",
                          icon: LineAwesomeIcons.file,
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const JobExperienceTeacherScreen()),
                            );
                          }),
                    ],
                  ),
                ),
              );
            }));
  }
}

class menuProfile extends StatelessWidget {
  const menuProfile({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Color(0xFFFBBB3F).withOpacity(0.1),
        ),
        child: Icon(icon, color: Colors.black),
      ),
      title: Text(title,
          style:
              Theme.of(context).textTheme.headline6?.apply(color: textColor)),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: const Icon(LineAwesomeIcons.angle_right,
                  size: 18.0, color: Colors.black))
          : null,
    );
  }
}
