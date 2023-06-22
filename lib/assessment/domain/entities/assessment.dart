import 'interview.dart';
import 'test.dart';
import 'video_presentation.dart';

class Assessment {
  Test test;
  VideoPresentation videoPresentation;
  Interview interview;

  Assessment(this.test, this.interview, this.videoPresentation);
}
