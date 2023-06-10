import '../../domain/entities/course.dart';
import '../../domain/entities/enums/experience.dart';
import '../../domain/entities/enums/modality.dart';
import '../../domain/entities/enums/type_x.dart';
import '../../domain/entities/position_profile.dart';
import 'course_model.dart';

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
        course: CourseModel.fromJson(json["course"]),
        modality: Modality.parseModality(json['modality']),
        experience: Experience.parseExperience(json['experience']),
        type: TypeX.parseModality(json['type']));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'course': (course as CourseModel).toJson(),
      'type': type.value,
      'experience': experience.value,
      'modality': modality.value
    };
  }
}
