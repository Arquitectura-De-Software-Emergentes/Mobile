import '../../domain/entities/academic_information_teacher.dart';

class AcademicInformationTeacherModel extends AcademicInformationTeacher {
  AcademicInformationTeacherModel(
      {required String school,
      required String specialty,
      required String reference})
      : super(
          school: school,
          specialty: specialty,
          reference: reference,
        );

  factory AcademicInformationTeacherModel.fromJson(Map<String, dynamic> json) {
    return AcademicInformationTeacherModel(
      school: json['school'],
      specialty: json['specialty'],
      reference: json['reference'],
    );
  }
}