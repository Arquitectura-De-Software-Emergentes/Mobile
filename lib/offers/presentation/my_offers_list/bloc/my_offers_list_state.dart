import 'package:equatable/equatable.dart';

import '../../../domain/entities/offer.dart';

abstract class MyOffersListState extends Equatable {
  const MyOffersListState();

  @override
  List<Object?> get props => [];
}

class MyOffersListInitial extends MyOffersListState {}

class MyOffersListLoading extends MyOffersListState {}

class MyOffersListLoaded extends MyOffersListState {
  final List<Offer> myOffersList;

  const MyOffersListLoaded(this.myOffersList);

  MyOffersListLoaded copyWith({List<Offer>? myOffersList}) {
    return MyOffersListLoaded(myOffersList ?? this.myOffersList);
  }

  @override
  List<Object?> get props => [myOffersList];
}

class MyOffersListError extends MyOffersListState {
  final String errorMessage;

  const MyOffersListError(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
}
