import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:teacher_finder/offers/infrastructure/repositories/offer_repository.dart';

import '../../../domain/entities/offer.dart';
part 'offers_list_event.dart';
part 'offers_list_state.dart';

class OffersListBloc extends Bloc<OffersListEvent, OffersListState> {
  final OfferRepository offerRepository;

  OffersListBloc()
      : offerRepository = GetIt.instance<OfferRepository>(),
        super(const OffersListState()) {
    on<LoadAllOffers>(_onGetAllOffers);
    on<TextChanged>(_onTextChanged);
  }

  void _onGetAllOffers(
      LoadAllOffers event, Emitter<OffersListState> emit) async {
    emit(state.copyWith(
      status: OffersListStatus.loading,
    ));
    try {
      final offers = await offerRepository.getAllOffers();

      return emit(state.copyWith(
        status: OffersListStatus.success,
        offers: offers,
        offerSearch: offers,
      ));
    } catch (error) {
      emit(state.copyWith(
          status: OffersListStatus.error, errorMessage: error.toString()));
    }
  }

  void _onTextChanged(TextChanged event, Emitter<OffersListState> emit) async {
    if (event.text.isEmpty) {
      emit(state.copyWith(
          status: OffersListStatus.success,
          offers: state.offers,
          offerSearch: state.offers));
      return;
    }
    emit(state.copyWith(status: OffersListStatus.loading));
    try {
      List<Offer> filteredList = state.offers.where((offer) {
        final title = offer.title.toLowerCase();
        final search = event.text.toLowerCase();
        return title.contains(search);
      }).toList();

      emit(state.copyWith(
          status: OffersListStatus.success, offerSearch: filteredList));
    } catch (error) {
      emit(state.copyWith(
          status: OffersListStatus.error, errorMessage: error.toString()));
    }
  }

  void getAllOffers() {
    add(LoadAllOffers());
  }

  void filterByText(String text) {
    add(TextChanged(text: text));
  }
}
