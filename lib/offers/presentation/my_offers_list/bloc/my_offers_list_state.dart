import 'package:equatable/equatable.dart';

import '../../../domain/entities/offer.dart';

enum MyOffersListStatus { initial, loading, success, error }

class MyOffersListState extends Equatable {
  const MyOffersListState({
    this.myOffersList = const <Offer>[],
    this.status = MyOffersListStatus.initial,
    this.errorMessage = 'error',
  });

  final List<Offer> myOffersList;
  final MyOffersListStatus status;
  final String errorMessage;

  MyOffersListState copyWith({
    List<Offer>? myOffersList,
    MyOffersListStatus? status,
    String? errorMessage,
  }) {
    return MyOffersListState(
        myOffersList: myOffersList ?? this.myOffersList,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage);
  }

  @override
  List<Object?> get props => [myOffersList, status, errorMessage];
}
