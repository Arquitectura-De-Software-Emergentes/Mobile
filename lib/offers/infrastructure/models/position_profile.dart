import 'package:teacher_finder/offers/domain/entities/enums/experience.dart';
import 'package:teacher_finder/offers/domain/entities/enums/modality.dart';
import 'package:teacher_finder/offers/domain/entities/position_profile.dart';
import 'package:teacher_finder/offers/infrastructure/models/course_model.dart';

import '../../domain/entities/course.dart';
import '../../domain/entities/enums/type_x.dart';

class PositionProfileModel extends PositionProfile {
  PositionProfileModel(
      {required int id,
      required String name,
      required Course course,
      required TypeX type,
      required Experience experience,
      required Modality modality})
      : super(
            id: id,
            name: name,
            course: course,
            type: type,
            experience: experience,
            modality: modality);

  factory PositionProfileModel.fromJson(Map<String, dynamic> json) {
    return PositionProfileModel(
        id: json['id'],
        name: json['name'],
        course: CourseModel.fromJson(json['course']),
        type: TypeX.parseModality(json['type']),
        experience: Experience.parseExperience(json['experience']),
        modality: Modality.parseModality(json['modality']));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'course': (course as CourseModel).toJson(),
      'type': type.value,
      'experience': experience?.value,
      'modality': modality?.value
    };
  }
}
