part of 'create_question_bloc.dart';

abstract class CreateQuestionEvent extends Equatable {
  const CreateQuestionEvent();

  @override
  List<Object> get props => [];
}

class TestQuestionChanged extends CreateQuestionEvent {
  final String testQuestion;

  const TestQuestionChanged(this.testQuestion);
}

class AlternativeAChanged extends CreateQuestionEvent {
  final String alternativeA;

  const AlternativeAChanged(this.alternativeA);
}

class AlternativeBChanged extends CreateQuestionEvent {
  final String alternativeB;

  const AlternativeBChanged(this.alternativeB);
}

class AlternativeCChanged extends CreateQuestionEvent {
  final String alternativeC;

  const AlternativeCChanged(this.alternativeC);
}

class AlternativeDChanged extends CreateQuestionEvent {
  final String alternativeD;

  const AlternativeDChanged(this.alternativeD);
}

class AlternativeEChanged extends CreateQuestionEvent {
  final String alternativeE;

  const AlternativeEChanged(this.alternativeE);
}

class PointsChanged extends CreateQuestionEvent {
  final String points;

  const PointsChanged(this.points);
}
