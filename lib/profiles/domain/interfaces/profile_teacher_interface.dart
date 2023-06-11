import 'package:teacher_finder/profiles/infrastucture/models/profile_teacher_model.dart';

abstract class ProfileTeacherInterface {
  Future<List<ProfileTeacherModel>> getAllProfileTeachers();
  Future<void> createProfileTeacher(ProfileTeacherModel profileTeacher);
}