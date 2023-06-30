import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:teacher_finder/common/widgets/custom_app_bar.dart';
import 'package:teacher_finder/profiles/presentation/profile_teacher/academic_information/academic_information_teacher_screen.dart';
import 'package:teacher_finder/profiles/presentation/profile_teacher/contact_information/contact_information_teacher_screen.dart';
import 'package:teacher_finder/profiles/presentation/profile_teacher/job_experience/job_experience_teacher_screen.dart';
import '../../infrastucture/data_sources/profile_teacher_remote_data_provider.dart';
import 'personal_information/information_personal_teacher_screen.dart';

class ProfileTeacherScreen extends StatefulWidget {
  ProfileTeacherScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileTeacherScreen> createState() => _ProfileTeacherScreenState();
}

class _ProfileTeacherScreenState extends State<ProfileTeacherScreen> {
  final profileTeacherRemoveDataProvider = ProfileTeacherRemoteDataProvider();
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final dniController = TextEditingController();
  final birthDateController = TextEditingController();
  final addressController = TextEditingController();
  final schoolController = TextEditingController();
  final specialtyController = TextEditingController();
  final referenceController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final mobilePhoneController = TextEditingController();
  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    print(isEditing);
    return Scaffold(
      appBar: const CustomAppBar(title: 'Profile'),
      body: Column(
        children: [
          FutureBuilder<Map<String, dynamic>>(
            future: profileTeacherRemoveDataProvider.getProfileTeacherById(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: const Center(child: CircularProgressIndicator()));
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.data == null) {
                return const Text('No data available');
              } else {
                final personalInformation =
                    snapshot.data?['personalInformation'];
                nameController.text = personalInformation['name'];
                lastNameController.text = personalInformation['lastname'];
                dniController.text = personalInformation['dni'];
                birthDateController.text = personalInformation['birthDate'];
                addressController.text = personalInformation['address'];
                final academicInformation =
                    snapshot.data?['academicInformation'];
                schoolController.text = academicInformation['school'];
                specialtyController.text = academicInformation['specialty'];
                referenceController.text = academicInformation['reference'];
                final contactInformation = snapshot.data?['contactInformation'];
                phoneController.text = contactInformation['phone'];
                emailController.text = contactInformation['email'];
                mobilePhoneController.text = contactInformation['mobilePhone'];

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
                        Text(
                          nameController.text + " " + lastNameController.text,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                        ),
                        const SizedBox(height: 40),
                        menuProfile(
                          //endIcon: !isEditing ? true : false,
                          trailingIcon: isEditing ? Icons.edit : null,
                          onTrailingIconPressed: () {
                            setState(() {
                              isEditing = !isEditing;
                            });
                          },
                          title: "Personal Information",
                          icon: LineAwesomeIcons.user,
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    InfomationPersonalTeacherScreen(
                                  addressController: addressController,
                                  birthDateController: birthDateController,
                                  dniController: dniController,
                                  lastNameController: lastNameController,
                                  nameController: nameController,
                                  isEditing: isEditing,
                                ),
                              ),
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
                                    AcademicInformationTeacher(
                                  referenceController: referenceController,
                                  schoolController: schoolController,
                                  specialtyController: specialtyController,
                                  isEditing: isEditing,
                                ),
                              ),
                            );
                          },
                          trailingIcon: isEditing ? Icons.edit : null,
                          onTrailingIconPressed: () {
                            setState(() {
                              isEditing = !isEditing;
                            });
                          },
                        ),
                        const SizedBox(height: 15),
                        menuProfile(
                          title: "Contact Information",
                          icon: LineAwesomeIcons.phone,
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ContactInformationTeacherScreen(
                                  emailController: emailController,
                                  mobilePhoneController: mobilePhoneController,
                                  phoneController: phoneController,
                                  isEditing: isEditing,
                                ),
                              ),
                            );
                          },
                          trailingIcon: isEditing ? Icons.edit : null,
                          onTrailingIconPressed: () {
                            setState(() {
                              isEditing = !isEditing;
                            });
                          },
                        ),
                        const SizedBox(height: 15),
                        menuProfile(
                          title: "Job Experience",
                          icon: LineAwesomeIcons.file,
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const JobExperienceTeacherScreen(),
                              ),
                            );
                          },
                          trailingIcon: isEditing ? Icons.edit : null,
                          onTrailingIconPressed: () {
                            setState(() {
                              isEditing = !isEditing;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
      floatingActionButton: isEditing
          ? FloatingActionButton(
              onPressed: () async {
                final obj = {
                  "academicInformation": {
                    "school": schoolController.text,
                    "specialty": specialtyController.text,
                    "reference": referenceController.text
                  },
                  "contactInformation": {
                    "phone": phoneController.text,
                    "email": emailController.text,
                    "mobilePhone": mobilePhoneController.text
                  },
                  "personalInformation": {
                    "name": nameController.text,
                    "lastname": lastNameController.text,
                    "dni": dniController.text,
                    "birthDate": birthDateController.text,
                    "address": addressController.text
                  }
                };
                await profileTeacherRemoveDataProvider.editProfile(obj);
                final updatedData = await profileTeacherRemoveDataProvider
                    .getProfileTeacherById();
                updateData(updatedData);
                setState(() {
                  isEditing = !isEditing;
                });
              },
              child: const Icon(
                Icons.done,
                color: Colors.white,
              ),
            )
          : FloatingActionButton(
              onPressed: () {
                setState(() {
                  isEditing = !isEditing;
                });
              },
              child: const Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
    );
  }

  void updateData(Map<String, dynamic> data) {
    final personalInformation = data['personalInformation'];
    nameController.text = personalInformation['name'];
    lastNameController.text = personalInformation['lastname'];
    dniController.text = personalInformation['dni'];
    birthDateController.text = personalInformation['birthDate'];
    addressController.text = personalInformation['address'];
    final academicInformation = data['academicInformation'];
    schoolController.text = academicInformation['school'];
    specialtyController.text = academicInformation['specialty'];
    referenceController.text = academicInformation['reference'];
    final contactInformation = data['contactInformation'];
    phoneController.text = contactInformation['phone'];
    emailController.text = contactInformation['email'];
    mobilePhoneController.text = contactInformation['mobilePhone'];
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
    this.trailingIcon,
    this.onTrailingIconPressed,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;
  final VoidCallback? onTrailingIconPressed;
  final IconData? trailingIcon;

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
          ? GestureDetector(
              onTap: onTrailingIconPressed,
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: Icon(
                  trailingIcon ?? LineAwesomeIcons.angle_right,
                  size: 18.0,
                  color: Colors.black,
                ),
              ),
            )
          : null,
    );
  }
}
