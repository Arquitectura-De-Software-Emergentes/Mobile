part of 'offers_list_bloc.dart';

abstract class OffersListEvent extends Equatable {
  const OffersListEvent();

  @override
  List<Object> get props => [];
}

class LoadAllOffers extends OffersListEvent {}
