import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../../infrastructure/inputs/alternativeA.dart';
import '../../../infrastructure/inputs/alternativeB.dart';
import '../../../infrastructure/inputs/alternativeC.dart';
import '../../../infrastructure/inputs/alternativeD.dart';
import '../../../infrastructure/inputs/alternativeE.dart';
import '../../../infrastructure/inputs/points.dart';
import '../../../infrastructure/inputs/test_question.dart';

part 'create_question_event.dart';
part 'create_question_state.dart';

class CreateQuestionBloc
    extends Bloc<CreateQuestionEvent, CreateQuestionState> {
  CreateQuestionBloc() : super(const CreateQuestionState()) {
    on<TestQuestionChanged>(_testQuestionChanged);
    on<AlternativeAChanged>(_alternativeAChanged);
    on<AlternativeBChanged>(_alternativeBChanged);
    on<AlternativeCChanged>(_alternativeCChanged);
    on<AlternativeDChanged>(_alternativeDChanged);
    on<AlternativeEChanged>(_alternativeEChanged);
    on<PointsChanged>(_pointsChanged);
  }

  void _testQuestionChanged(
      TestQuestionChanged event, Emitter<CreateQuestionState> emit) async {
    final testQuestion = TestQuestion.dirty(event.testQuestion);
    emit(
      state.copyWith(
        testQuestion: testQuestion,
        isValid: Formz.validate([
          testQuestion,
          state.alternativeA,
          state.alternativeB,
          state.alternativeC,
          state.alternativeD,
          state.alternativeE,
          state.points
        ]),
      ),
    );
  }

  void _alternativeAChanged(
      AlternativeAChanged event, Emitter<CreateQuestionState> emit) async {
    final alternativeA = AlternativeA.dirty(event.alternativeA);
    emit(
      state.copyWith(
        alternativeA: alternativeA,
        isValid: Formz.validate([
          alternativeA,
          state.alternativeB,
          state.alternativeC,
          state.alternativeD,
          state.alternativeE,
          state.testQuestion,
          state.points
        ]),
      ),
    );
  }

  void _alternativeBChanged(
      AlternativeBChanged event, Emitter<CreateQuestionState> emit) async {
    final alternativeB = AlternativeB.dirty(event.alternativeB);
    emit(
      state.copyWith(
        alternativeB: alternativeB,
        isValid: Formz.validate([
          alternativeB,
          state.alternativeA,
          state.alternativeC,
          state.alternativeD,
          state.alternativeE,
          state.testQuestion,
          state.points
        ]),
      ),
    );
  }

  void _alternativeCChanged(
      AlternativeCChanged event, Emitter<CreateQuestionState> emit) async {
    final alternativeC = AlternativeC.dirty(event.alternativeC);
    emit(
      state.copyWith(
        alternativeC: alternativeC,
        isValid: Formz.validate([
          alternativeC,
          state.alternativeA,
          state.alternativeB,
          state.alternativeD,
          state.alternativeE,
          state.testQuestion,
          state.points
        ]),
      ),
    );
  }

  void _alternativeDChanged(
      AlternativeDChanged event, Emitter<CreateQuestionState> emit) async {
    final alternativeD = AlternativeD.dirty(event.alternativeD);
    emit(
      state.copyWith(
        alternativeD: alternativeD,
        isValid: Formz.validate([
          alternativeD,
          state.alternativeA,
          state.alternativeB,
          state.alternativeC,
          state.alternativeE,
          state.testQuestion,
          state.points
        ]),
      ),
    );
  }

  void _alternativeEChanged(
      AlternativeEChanged event, Emitter<CreateQuestionState> emit) async {
    final alternativeE = AlternativeE.dirty(event.alternativeE);
    emit(
      state.copyWith(
        alternativeE: alternativeE,
        isValid: Formz.validate([
          alternativeE,
          state.alternativeA,
          state.alternativeB,
          state.alternativeD,
          state.alternativeC,
          state.testQuestion,
          state.points
        ]),
      ),
    );
  }

  void _pointsChanged(
      PointsChanged event, Emitter<CreateQuestionState> emit) async {
    final points = Points.dirty(event.points);
    emit(
      state.copyWith(
        points: points,
        isValid: Formz.validate([
          state.alternativeE,
          state.alternativeA,
          state.alternativeB,
          state.alternativeD,
          state.alternativeC,
          state.testQuestion,
          state.points
        ]),
      ),
    );
    print(state.isValid);
  }

  void testQuestionChanged(String question) {
    add(TestQuestionChanged(question));
  }

  void alternativeA(String alternativeA) {
    add(AlternativeAChanged(alternativeA));
  }

  void alternativeB(String alternativeB) {
    add(AlternativeBChanged(alternativeB));
  }

  void alternativeC(String alternativeC) {
    add(AlternativeCChanged(alternativeC));
  }

  void alternativeD(String alternativeD) {
    add(AlternativeDChanged(alternativeD));
  }

  void alternativeE(String alternativeE) {
    add(AlternativeEChanged(alternativeE));
  }

  void points(String points) {
    add(PointsChanged(points));
  }
}
