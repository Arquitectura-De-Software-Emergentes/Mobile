import 'package:equatable/equatable.dart';

import '../../../domain/entities/offer.dart';

abstract class OffersListEvent extends Equatable {
  const OffersListEvent();

  @override
  List<Object> get props => [];
}

class LoadAllOffers extends OffersListEvent {}
