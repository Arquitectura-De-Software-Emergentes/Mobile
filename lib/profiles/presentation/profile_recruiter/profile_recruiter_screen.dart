import 'package:flutter/material.dart';
import 'package:teacher_finder/common/styles/styles.dart';
import 'package:teacher_finder/common/user_config/user_config.dart';
import 'package:teacher_finder/profiles/infrastucture/data_sources/profile_recruiter_remote_data_provider.dart';

import '../../../common/widgets/custom_app_bar.dart';

class ProfileRecruiterScreen extends StatefulWidget {
  const ProfileRecruiterScreen({super.key});

  @override
  State<ProfileRecruiterScreen> createState() => _ProfileRecruiterScreenState();
}

class _ProfileRecruiterScreenState extends State<ProfileRecruiterScreen> {
  bool isEditing = false;
  final _profileDataProvider = ProfileRecruiterRemoteDataProvider();

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController webPageController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Profile'),
      body: Container(
        padding: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                width: 160,
                height: 160,
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Icon(
                    color: Colors.white,
                    Icons.person_rounded,
                    size: 100,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 260),
                child: Text(
                  'Name',
                  style: TextStyle(
                    color: Styles.secondaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Container(
                width: 340,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      //spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  enabled: isEditing,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(right: 220),
                child: Text(
                  'Description',
                  style: TextStyle(
                    color: Styles.secondaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Container(
                width: 340,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      //spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  enabled: isEditing,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(right: 220),
                child: Text(
                  'Web Page',
                  style: TextStyle(
                    color: Styles.secondaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Container(
                width: 340,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      //spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  controller: webPageController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  enabled: isEditing,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(right: 180),
                child: Text(
                  'Phone Number',
                  style: TextStyle(
                    color: Styles.secondaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Container(
                width: 340,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      //spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  controller: phoneNumberController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  enabled: isEditing,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(right: 220),
                child: Text(
                  'Address',
                  style: TextStyle(
                    color: Styles.secondaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Container(
                width: 340,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      //spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  controller: addressController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  enabled: isEditing,
                ),
              ),
              const SizedBox(height: 30),
              Container(
                width: 150,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      isEditing = !isEditing;
                    });
                    if (!isEditing) {
                      try {
                        //verificar que datos se envian
                        print('Name: ${nameController.text}');
                        print('Description: ${descriptionController.text}');
                        print('Web Page: ${webPageController.text}');
                        print('Phone Number: ${phoneNumberController.text}');
                        print('Address: ${addressController.text}');
                        int recruiterId = await UserConfig.getUserId();
                        await _profileDataProvider.updateRecruiterProfile(
                            recruiterId,
                            nameController.text,
                            descriptionController.text,
                            webPageController.text,
                            phoneNumberController.text,
                            '',
                            addressController.text);
                      } catch (e) {
                        print('Error: $e');
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Styles.secondaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                  child: (const Text(
                    'Edit Profile',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//{
//   "name": "string",
//   "description": "string",
//   "urlWebPage": "string",
//   "phoneNumber": "string",
//   "image": "string",
//   "address": "string"
// }
