part of 'offers_list_bloc.dart';

enum OffersListStatus { initial, loading, success, error }

class OffersListState extends Equatable {
  const OffersListState({
    this.offerSearch = const <Offer>[],
    this.status = OffersListStatus.initial,
    this.offers = const <Offer>[],
    this.errorMessage = 'error',
  });

  final OffersListStatus status;
  final List<Offer> offers;
  final List<Offer> offerSearch;
  final String errorMessage;

  OffersListState copyWith({
    OffersListStatus? status,
    List<Offer>? offers,
    List<Offer>? offerSearch,
    String? errorMessage,
  }) {
    return OffersListState(
      status: status ?? this.status,
      offers: offers ?? this.offers,
      offerSearch: offerSearch ?? this.offerSearch,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, offers, offerSearch, errorMessage];
}
