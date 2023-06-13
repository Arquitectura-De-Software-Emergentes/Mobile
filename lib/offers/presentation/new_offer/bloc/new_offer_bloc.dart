import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../infrastructure/inputs/inputs.dart';

part 'new_offer_event.dart';
part 'new_offer_state.dart';

class NewOfferBloc extends Bloc<NewOfferEvent, NewOfferState> {
  NewOfferBloc() : super(const NewOfferForm()) {
    on<TitleChanged>(_titleChanged);
  }

  void _titleChanged(TitleChanged event, Emitter<NewOfferState> emit) async {
    final title = Title.dirty(event.title);

    emit(
      (state as NewOfferForm).copyWith(
        title: title,
        isValid: Formz.validate([title]),
      ),
    );
  }

  void _descriptionChanged(
      DescriptionChanged event, Emitter<NewOfferState> emit) async {
    final description = Description.dirty(event.description);

    emit(
      (state as NewOfferForm).copyWith(
        description: description,
        isValid: Formz.validate([description]),
      ),
    );
  }

  void _applicationsChanged(
      ApplicationsChanged event, Emitter<NewOfferState> emit) async {
    final applications = Applications.dirty(event.applications);

    emit(
      (state as NewOfferForm).copyWith(
        applications: applications,
        isValid: Formz.validate([applications]),
      ),
    );
  }

  void _salaryAmountChanged(
      SalaryAmountChanged event, Emitter<NewOfferState> emit) async {
    final salaryAmount = SalaryAmount.dirty(event.salaryAmount);
    emit(
      (state as NewOfferForm).copyWith(
        salaryAmount: salaryAmount,
        isValid: Formz.validate([salaryAmount]),
      ),
    );
  }

  void titleChanged(String title) {
    add(TitleChanged(title));
  }

  void descriptionChanged(String description) {
    add(DescriptionChanged(description));
  }

  void applicationsChanged(String applications) {
    add(ApplicationsChanged(applications));
  }

  void salaryAmountChanged(String salaryAmount) {
    add(SalaryAmountChanged(salaryAmount));
  }

  void onSubmit() {
    print('bloc: $state');
  }
}
