import 'package:equatable/equatable.dart';
import '../../../domain/entities/offer.dart';

abstract class OfferApplicantsListState extends Equatable {
  const OfferApplicantsListState();

  @override
  List<Object?> get props => [];
}

class MyOffersListInitial extends OfferApplicantsListState {}

class MyOffersListLoading extends OfferApplicantsListState {}

class MyOffersListLoaded extends OfferApplicantsListState {
  final List<Offer> offerApplicantsList;

  const MyOffersListLoaded(this.offerApplicantsList);

  MyOffersListLoaded copyWith({List<Offer>? offerApplicantsList}) {
    return MyOffersListLoaded(offerApplicantsList ?? this.offerApplicantsList);
  }

  @override
  List<Object?> get props => [offerApplicantsList];
}

class MyOffersListError extends OfferApplicantsListState {
  final String errorMessage;

  const MyOffersListError(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
}
