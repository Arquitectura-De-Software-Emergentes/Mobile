
import '../../injections.dart';
import '../application/profile_teacher_facade_service.dart';
import '../domain/entities/profile_teacher.dart';

class ProfileTeacherApi{
final ProfileTeacherFacadeService profileTeacherFacade = serviceLocator<ProfileTeacherFacadeService>();
  Future<List<ProfileTeacher>> getProfileTeacher() async {
  return profileTeacherFacade.getProfileTeacherById();
  }
}

