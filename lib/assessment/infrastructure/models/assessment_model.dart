import 'package:teacher_finder/assessment/domain/entities/interview.dart';
import 'package:teacher_finder/assessment/domain/entities/video_presentation.dart';

import '../../domain/entities/assessment.dart';
import '../../domain/entities/test.dart';

class AssessmentModel extends Assessment {
  AssessmentModel(
    int id,
    Test test,
    Interview interview,
    VideoPresentation videoPresentation,
  ) : super(id, test, interview, videoPresentation);
}
