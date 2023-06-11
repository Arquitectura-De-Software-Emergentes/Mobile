import '../../domain/entities/contact_information_teacher.dart';

class ContactInformationTeacherModel extends ContactInformationTeacher {
  ContactInformationTeacherModel(
      {required String phone,
      required String email,
      required String mobilePhone})
      : super(
          phone: phone,
          email: email,
          mobilePhone: mobilePhone,
        );
  factory ContactInformationTeacherModel.fromJson(Map<String, dynamic> json) {
    return ContactInformationTeacherModel(
      phone: json['phone'],
      email: json['email'],
      mobilePhone: json['mobilePhone'],
    );
  }
}