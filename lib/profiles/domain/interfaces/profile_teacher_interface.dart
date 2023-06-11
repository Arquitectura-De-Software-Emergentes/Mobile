import 'package:teacher_finder/profiles/domain/entities/profile_teacher.dart';
import 'package:teacher_finder/profiles/infrastucture/models/profile_teacher_model.dart';

abstract class ProfileTeacherInterface {
  Future<List<ProfileTeacherModel>> getAllProfileTeachers();
  Future<void> createProfileTeacher(ProfileTeacherModel profileTeacher);
  Future<List<ProfileTeacher>>getProfileTeacherById(int id);
}