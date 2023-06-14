import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../infrastructure/inputs/inputs.dart';

part 'new_offer_event.dart';
part 'new_offer_state.dart';

class NewOfferBloc extends Bloc<NewOfferEvent, NewOfferState> {
  NewOfferBloc() : super(const NewOfferFormState()) {
    on<TitleChanged>(_titleChanged);
    on<DescriptionChanged>(_descriptionChanged);
    on<ApplicationsChanged>(_applicationsChanged);
    on<SalaryAmountChanged>(_salaryAmountChanged);
    on<InitialDateChanged>(_initialDateChanged);
    on<EndDateChanged>(_endDateChanged);
  }

  void _titleChanged(TitleChanged event, Emitter<NewOfferState> emit) async {
    final title = Title.dirty(event.title);

    emit(
      (state as NewOfferFormState).copyWith(
        title: title,
        isValid: Formz.validate([
          title,
          (state as NewOfferFormState).description,
          (state as NewOfferFormState).applications,
          (state as NewOfferFormState).salaryAmount,
          (state as NewOfferFormState).initialDate,
          (state as NewOfferFormState).endDate,
        ]),
      ),
    );
  }

  void _descriptionChanged(
      DescriptionChanged event, Emitter<NewOfferState> emit) async {
    final description = Description.dirty(event.description);

    emit(
      (state as NewOfferFormState).copyWith(
        description: description,
        isValid: Formz.validate([
          description,
          (state as NewOfferFormState).title,
          (state as NewOfferFormState).applications,
          (state as NewOfferFormState).salaryAmount,
          (state as NewOfferFormState).initialDate,
          (state as NewOfferFormState).endDate,
        ]),
      ),
    );
  }

  void _applicationsChanged(
      ApplicationsChanged event, Emitter<NewOfferState> emit) async {
    final applications = Applications.dirty(event.applications);

    emit(
      (state as NewOfferFormState).copyWith(
        applications: applications,
        isValid: Formz.validate([
          applications,
          (state as NewOfferFormState).title,
          (state as NewOfferFormState).description,
          (state as NewOfferFormState).applications,
          (state as NewOfferFormState).salaryAmount,
          (state as NewOfferFormState).initialDate,
          (state as NewOfferFormState).endDate,
        ]),
      ),
    );
  }

  void _salaryAmountChanged(
      SalaryAmountChanged event, Emitter<NewOfferState> emit) async {
    final salaryAmount = SalaryAmount.dirty(event.salaryAmount);
    emit(
      (state as NewOfferFormState).copyWith(
        salaryAmount: salaryAmount,
        isValid: Formz.validate([
          salaryAmount,
          (state as NewOfferFormState).title,
          (state as NewOfferFormState).description,
          (state as NewOfferFormState).applications,
          (state as NewOfferFormState).initialDate,
          (state as NewOfferFormState).endDate,
        ]),
      ),
    );
  }

  void _initialDateChanged(
      InitialDateChanged event, Emitter<NewOfferState> emit) async {
    final initialDate = InitialDate.dirty(event.initialDate);
    emit(
      (state as NewOfferFormState).copyWith(
        initialDate: initialDate,
        isValid: Formz.validate([
          initialDate,
          (state as NewOfferFormState).title,
          (state as NewOfferFormState).description,
          (state as NewOfferFormState).applications,
          (state as NewOfferFormState).salaryAmount,
          (state as NewOfferFormState).endDate,
        ]),
      ),
    );
  }

  void _endDateChanged(
      EndDateChanged event, Emitter<NewOfferState> emit) async {
    final endDate = EndDate.dirty(event.endDate);
    emit(
      (state as NewOfferFormState).copyWith(
        endDate: endDate,
        isValid: Formz.validate([
          endDate,
          (state as NewOfferFormState).title,
          (state as NewOfferFormState).description,
          (state as NewOfferFormState).applications,
          (state as NewOfferFormState).salaryAmount,
          (state as NewOfferFormState).initialDate
        ]),
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

  void initialDateChanged(String initialDate) {
    add(InitialDateChanged(initialDate));
  }

  void endDateChanged(String endDate) {
    add(EndDateChanged(endDate));
  }

  void onSubmit() {
    emit(
      (state as NewOfferFormState).copyWith(
        formStatus: FormStatus.validating,
        title: Title.dirty((state as NewOfferFormState).title.value),
        description:
            Description.dirty((state as NewOfferFormState).description.value),
        applications:
            Applications.dirty((state as NewOfferFormState).applications.value),
        salaryAmount:
            SalaryAmount.dirty((state as NewOfferFormState).salaryAmount.value),
        initialDate:
            InitialDate.dirty((state as NewOfferFormState).initialDate.value),
        endDate: EndDate.dirty((state as NewOfferFormState).endDate.value),
        isValid: Formz.validate([
          (state as NewOfferFormState).title,
          (state as NewOfferFormState).description,
          (state as NewOfferFormState).applications,
          (state as NewOfferFormState).salaryAmount,
          (state as NewOfferFormState).initialDate,
          (state as NewOfferFormState).endDate,
        ]),
      ),
    );
  }
}
