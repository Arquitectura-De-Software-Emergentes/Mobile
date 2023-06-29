part of 'create_question_bloc.dart';

class CreateQuestionState extends Equatable {
  const CreateQuestionState({
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

  CreateQuestionState copyWith({
    bool? isValid,
    TestQuestion? testQuestion,
    AlternativeA? alternativeA,
    AlternativeB? alternativeB,
    AlternativeC? alternativeC,
    AlternativeD? alternativeD,
    AlternativeE? alternativeE,
  }) =>
      CreateQuestionState(
        isValid: isValid ?? this.isValid,
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
        testQuestion,
        alternativeA,
        alternativeB,
        alternativeC,
        alternativeD,
        alternativeE,
      ];
}
