import '../../domain/entities/personal_information_teacher.dart';

class PersonalInformationTeacherModel extends PersonalInformationTeacher {
  PersonalInformationTeacherModel(
      {required String name,
      required String lastname,
      required String dni,
      required DateTime birthDate,
      required String address})
      : super(
          name: name,
          lastname: lastname,
          dni: dni,
          birthDate: birthDate,
          address: address,
        );

  factory PersonalInformationTeacherModel.fromJson(Map<String, dynamic> json) {
    return PersonalInformationTeacherModel(
      name: json['name'],
      lastname: json['lastname'],
      dni: json['dni'],
      birthDate: DateTime.parse(json['birthDate']),
      address: json['address'],
    );
  }
}