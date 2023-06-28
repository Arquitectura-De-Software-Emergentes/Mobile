import '../../../domain/applicant_cv.dart';

class ApplicantCvModel extends Cv{
  ApplicantCvModel({
    required String cv,
  }) : super(
          cv: cv,
        );

  factory ApplicantCvModel.fromJson(Map<String, dynamic> json) {
    return ApplicantCvModel(
      cv: json['cv'],
    );
  }
}