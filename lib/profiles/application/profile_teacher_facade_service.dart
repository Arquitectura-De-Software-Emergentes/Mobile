import 'package:teacher_finder/profiles/infrastucture/models/profile_teacher_model.dart';

import '../domain/entities/profile_teacher.dart';
import '../infrastucture/repositories/profile_teacher_repository.dart';

class ProfileTeacherFacadeService {
   ProfileTeacherFacadeService ({required this.repository});
    final ProfileTeacherRepository repository;
    Future<List<ProfileTeacher>> getProfileTeacherById() async {
      return repository.getProfileTeacherById(1);
    }

}
