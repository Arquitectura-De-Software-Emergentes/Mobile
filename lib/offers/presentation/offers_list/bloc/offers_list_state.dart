part of 'offers_list_bloc.dart';

abstract class OffersListState extends Equatable {
  const OffersListState();

  @override
  List<Object?> get props => [];
}

class OffersListInitial extends OffersListState {}

class OffersListLoading extends OffersListState {}

class OffersListLoaded extends OffersListState {
  final List<Offer> offersList;

  const OffersListLoaded(this.offersList);

  OffersListLoaded copyWith({List<Offer>? offersList}) {
    return OffersListLoaded(offersList ?? this.offersList);
  }

  @override
  List<Object?> get props => [offersList];
}

class OffersListError extends OffersListState {
  final String errorMessage;

  const OffersListError(this.errorMessage);
}
