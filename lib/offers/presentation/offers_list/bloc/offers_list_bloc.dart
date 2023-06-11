import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:teacher_finder/offers/infrastructure/repositories/offer_repository.dart';

import '../../../domain/entities/offer.dart';
import 'offers_list_event.dart';
import 'offers_list_state.dart';

class OffersListBloc extends Bloc<OffersListEvent, OffersListState> {
  final OfferRepository offerRepository;

  OffersListBloc()
      : offerRepository = GetIt.instance<OfferRepository>(),
        super(OffersListInitial()) {
    //handlers
    on<LoadAllOffers>(_onGetAllOffers);
  }
  //shot events
  void _onGetAllOffers(
      LoadAllOffers event, Emitter<OffersListState> emit) async {
    emit(OffersListLoading()); // Emite el estado de carga inicial
    try {
      final List<Offer> offers = await offerRepository.getAllOffers();
      emit(OffersListLoaded(offers)); // Emite el estado actualizado
    } catch (error) {
      emit(OffersListError(error.toString())); // Emite el estado de error
    }
  }

  void getAllOffers() {
    add(LoadAllOffers());
  }
}
