import 'interview.dart';
import 'test.dart';
import 'video_presentation.dart';

class Assessment {
  int id;
  Test test;
  VideoPresentation videoPresentation;
  Interview interview;

  Assessment(this.id, this.test, this.interview, this.videoPresentation);
}
