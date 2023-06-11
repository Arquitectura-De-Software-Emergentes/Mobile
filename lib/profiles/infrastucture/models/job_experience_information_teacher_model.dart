import '../../domain/entities/job_experience_information_teacher.dart';

class JobExperienceInformationTeacherModel extends JobExperienceInformationTeacher  {
 JobExperienceInformationTeacherModel(
      {required   int jobExperienceInformationId,
      required String company,
      required String position,
      required String time})
      : super(
           jobExperienceInformationId: jobExperienceInformationId,
          company: company,
          position: position,
          time: time,
        );
  factory JobExperienceInformationTeacherModel.fromJson(Map<String, dynamic> json) {
    return JobExperienceInformationTeacherModel(
      jobExperienceInformationId: json['jobExperienceInformationId'],
      company: json['company'],
      position: json['position'],
      time: json['time'],
    );
  }
}