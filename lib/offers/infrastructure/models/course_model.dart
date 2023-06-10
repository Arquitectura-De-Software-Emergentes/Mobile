import '../../domain/entities/course.dart';

class CourseModel extends Course {
  CourseModel({required String course}) : super(course: course);

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(course: json['course']);
  }

  Map<String, dynamic> toJson() {
    return {
      'course': course,
    };
  }
}
