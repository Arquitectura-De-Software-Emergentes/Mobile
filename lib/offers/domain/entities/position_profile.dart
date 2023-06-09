import 'package:teacher_finder/offers/domain/entities/enums/experience.dart';
import 'package:teacher_finder/offers/domain/entities/enums/modality.dart';

import 'course.dart';
import 'enums/type_x.dart';

class PositionProfile {
  final int id;
  final String name;
  final Course course;
  final Modality modality;
  final Experience experience;
  final TypeX type;

  PositionProfile({
    required this.id,
    required this.name,
    required this.course,
    required this.modality,
    required this.experience,
    required this.type,
  });
}
