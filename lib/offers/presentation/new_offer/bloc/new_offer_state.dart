part of 'new_offer_bloc.dart';

enum FormStatus { invalid, valid, validating, posting }

abstract class NewOfferState extends Equatable {
  const NewOfferState();

  @override
  List<Object> get props => [];
}

class NewOfferFormState extends NewOfferState {
  final FormStatus formStatus;
  final Title title;
  final Description description;
  final Applications applications;
  final SalaryAmount salaryAmount;
  final InitialDate initialDate;
  final EndDate endDate;
  final bool isValid;
  const NewOfferFormState({
    this.isValid = false,
    this.formStatus = FormStatus.invalid,
    this.title = const Title.pure(),
    this.description = const Description.pure(),
    this.applications = const Applications.pure(),
    this.salaryAmount = const SalaryAmount.pure(),
    this.initialDate = const InitialDate.pure(),
    this.endDate = const EndDate.pure(),
  });

  NewOfferFormState copyWith({
    FormStatus? formStatus,
    bool? isValid,
    Title? title,
    Description? description,
    Applications? applications,
    SalaryAmount? salaryAmount,
    InitialDate? initialDate,
    EndDate? endDate,
  }) =>
      NewOfferFormState(
          isValid: isValid ?? this.isValid,
          formStatus: formStatus ?? this.formStatus,
          title: title ?? this.title,
          description: description ?? this.description,
          applications: applications ?? this.applications,
          salaryAmount: salaryAmount ?? this.salaryAmount,
          initialDate: initialDate ?? this.initialDate,
          endDate: endDate ?? this.endDate);

  @override
  List<Object> get props => [
        formStatus,
        isValid,
        title,
        description,
        applications,
        salaryAmount,
        initialDate,
        endDate
      ];
}
