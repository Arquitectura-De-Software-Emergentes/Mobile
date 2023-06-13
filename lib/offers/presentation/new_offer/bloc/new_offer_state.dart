part of 'new_offer_bloc.dart';

enum FormStatus { invalid, valid, validating, posting }

abstract class NewOfferState extends Equatable {
  const NewOfferState();

  @override
  List<Object> get props => [];
}

class NewOfferForm extends NewOfferState {
  final FormStatus formStatus;
  final Title title;
  final Description description;
  final Applications applications;
  final SalaryAmount salaryAmount;
  final bool isValid;
  const NewOfferForm(
      {this.isValid = false,
      this.formStatus = FormStatus.invalid,
      this.title = const Title.pure(),
      this.description = const Description.pure(),
      this.applications = const Applications.pure(),
      this.salaryAmount = const SalaryAmount.pure()});

  NewOfferForm copyWith({
    FormStatus? formStatus,
    bool? isValid,
    Title? title,
    Description? description,
    Applications? applications,
    SalaryAmount? salaryAmount,
  }) =>
      NewOfferForm(
          isValid: isValid ?? this.isValid,
          formStatus: formStatus ?? this.formStatus,
          title: title ?? this.title,
          description: description ?? this.description,
          applications: applications ?? this.applications,
          salaryAmount: salaryAmount ?? this.salaryAmount);

  @override
  List<Object> get props =>
      [formStatus, isValid, title, description, applications, salaryAmount];
}
