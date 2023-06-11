import 'package:teacher_finder/profiles/domain/interfaces/profile_teacher_interface.dart';
import 'package:teacher_finder/profiles/infrastucture/models/profile_teacher_model.dart';
import '../../domain/entities/profile_teacher.dart';
import '../data_sources/profile_teacher_remove_data_provider.dart';

class ProfileTeacherRepository extends ProfileTeacherInterface {
  String endpoint = 'profile_teachers';

  ProfileTeacherRepository({required this.profileTeacherRemoteDataProvider});
  final ProfileTeacherRemoveDataProvider profileTeacherRemoteDataProvider;
  @override
  Future<List<ProfileTeacher>> getProfileTeacherById(int id) async {
    try {
      final response = await profileTeacherRemoteDataProvider.getProfileTeacherById(id);
      return [response];
    } catch (error) {
      throw Exception('Failed to fetch profile_teacher: $error');
    }
  }

  @override
  Future<void> createProfileTeacher(ProfileTeacherModel profileTeacher) {
    // TODO: implement createProfileTeacher
    throw UnimplementedError();
  }

  @override
  Future<List<ProfileTeacherModel>> getAllProfileTeachers() {
    // TODO: implement getAllProfileTeachers
    throw UnimplementedError();
  }

}
