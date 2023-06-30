part of 'create_question_bloc.dart';

class CreateQuestionState extends Equatable {
  const CreateQuestionState({
    this.points = const Points.pure(),
    this.isValid = false,
    this.testQuestion = const TestQuestion.pure(),
    this.alternativeA = const AlternativeA.pure(),
    this.alternativeB = const AlternativeB.pure(),
    this.alternativeC = const AlternativeC.pure(),
    this.alternativeD = const AlternativeD.pure(),
    this.alternativeE = const AlternativeE.pure(),
  });

  final bool isValid;
  final TestQuestion testQuestion;
  final AlternativeA alternativeA;
  final AlternativeB alternativeB;
  final AlternativeC alternativeC;
  final AlternativeD alternativeD;
  final AlternativeE alternativeE;
  final Points points;

  CreateQuestionState copyWith({
    bool? isValid,
    Points? points,
    TestQuestion? testQuestion,
    AlternativeA? alternativeA,
    AlternativeB? alternativeB,
    AlternativeC? alternativeC,
    AlternativeD? alternativeD,
    AlternativeE? alternativeE,
  }) =>
      CreateQuestionState(
        isValid: isValid ?? this.isValid,
        points: points ?? this.points,
        testQuestion: testQuestion ?? this.testQuestion,
        alternativeA: alternativeA ?? this.alternativeA,
        alternativeB: alternativeB ?? this.alternativeB,
        alternativeC: alternativeC ?? this.alternativeC,
        alternativeD: alternativeD ?? this.alternativeD,
        alternativeE: alternativeE ?? this.alternativeE,
      );
  @override
  List<Object> get props => [
        isValid,
        points,
        testQuestion,
        alternativeA,
        alternativeB,
        alternativeC,
        alternativeD,
        alternativeE,
      ];
}
