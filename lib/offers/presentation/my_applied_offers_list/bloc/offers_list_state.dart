part of 'offers_list_bloc.dart';

enum OffersListStatus { initial, loading, success, error }

class AppliedOffersListState extends Equatable {
  const AppliedOffersListState({
    this.offerSearch = const <AppliedOfferModel>[],
    this.status = OffersListStatus.initial,
    this.offers = const <AppliedOfferModel>[],
    this.errorMessage = 'error',
  });

  final OffersListStatus status;
  final List<AppliedOfferModel> offers;
  final List<AppliedOfferModel> offerSearch;
  final String errorMessage;

  AppliedOffersListState copyWith({
    OffersListStatus? status,
    List<AppliedOfferModel>? offers,
    List<AppliedOfferModel>? offerSearch,
    String? errorMessage,
  }) {
    return AppliedOffersListState(
      status: status ?? this.status,
      offers: offers ?? this.offers,
      offerSearch: offerSearch ?? this.offerSearch,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, offers, offerSearch, errorMessage];
}
