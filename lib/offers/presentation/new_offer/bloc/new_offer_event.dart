part of 'new_offer_bloc.dart';

abstract class NewOfferEvent extends Equatable {
  const NewOfferEvent();

  @override
  List<Object> get props => [];
}

class TitleChanged extends NewOfferEvent {
  final String title;
  const TitleChanged(this.title);
}

class DescriptionChanged extends NewOfferEvent {
  final String description;

  const DescriptionChanged(this.description);
}

class ApplicationsChanged extends NewOfferEvent {
  final String applications;

  const ApplicationsChanged(this.applications);
}

class SalaryAmountChanged extends NewOfferEvent {
  final String salaryAmount;
  const SalaryAmountChanged(this.salaryAmount);
}

class InitialDateChanged extends NewOfferEvent {
  final String initialDate;
  const InitialDateChanged(this.initialDate);
}

class EndDateChanged extends NewOfferEvent {
  final String endDate;
  const EndDateChanged(this.endDate);
}
