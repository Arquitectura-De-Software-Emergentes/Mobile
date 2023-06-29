import 'package:equatable/equatable.dart';

import '../../../domain/entities/offer.dart';

abstract class MyOffersListEvent extends Equatable {
  const MyOffersListEvent();

  @override
  List<Object> get props => [];
}

class LoadAllMyOffers extends MyOffersListEvent {}

class AddMyOffer extends MyOffersListEvent {
  final Offer offer;

  const AddMyOffer(this.offer);
}

class LoadAllTestAvailable extends MyOffersListEvent {}
