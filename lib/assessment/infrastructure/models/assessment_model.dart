import 'package:teacher_finder/assessment/domain/entities/interview.dart';
import 'package:teacher_finder/assessment/domain/entities/video_presentation.dart';

import '../../domain/entities/assessment.dart';
import '../../domain/entities/test.dart';

class AssessmentModel extends Assessment {
  AssessmentModel(
    Test test,
    Interview interview,
    VideoPresentation videoPresentation,
  ) : super(test, interview, videoPresentation);
}
