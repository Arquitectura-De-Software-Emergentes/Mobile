part of 'offers_list_bloc.dart';

enum OffersListStatus { initial, loading, success, error }

class OffersListState extends Equatable {
  const OffersListState({
    this.offerSearch = const <Offer>[],
    this.status = OffersListStatus.initial,
    this.offers = const <Offer>[],
  });

  final OffersListStatus status;
  final List<Offer> offers;
  final List<Offer> offerSearch;

  OffersListState copyWith({
    OffersListStatus? status,
    List<Offer>? offers,
    List<Offer>? offerSearch,
  }) {
    return OffersListState(
      status: status ?? this.status,
      offers: offers ?? this.offers,
      offerSearch: offerSearch ?? this.offerSearch,
    );
  }

  @override
  List<Object?> get props => [status, offers, offerSearch];
}
