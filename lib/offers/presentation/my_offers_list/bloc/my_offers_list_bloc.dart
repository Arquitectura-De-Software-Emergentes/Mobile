import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:teacher_finder/offers/infrastructure/repositories/offer_repository.dart';

import '../../../domain/entities/offer.dart';
import 'my_offers_list_event.dart';
import 'my_offers_list_state.dart';

class MyOffersListBloc extends Bloc<MyOffersListEvent, MyOffersListState> {
  final OfferRepository offerRepository;
  MyOffersListBloc()
      : offerRepository = GetIt.instance<OfferRepository>(),
        super(MyOffersListInitial()) {
    on<LoadAllMyOffers>(_onGetAllMyOffers);
    on<AddMyOffer>(_onAddOffer);
  }
  void _onGetAllMyOffers(
      LoadAllMyOffers event, Emitter<MyOffersListState> emit) async {
    emit(MyOffersListLoading());
    try {
      print('get');
      final List<Offer> offers = await offerRepository.getAllOffers();
      emit(MyOffersListLoaded(offers)); // Emite el estado actualizado
    } catch (error) {
      emit(MyOffersListError()); // Emite el estado de error
    }
  }

  void _onAddOffer(AddMyOffer event, Emitter<MyOffersListState> emit) {
    print('entre');
    try {
      print('entre1');
      if (state is MyOffersListLoaded) {
        print('entr2');
        final List<Offer> currentList =
            (state as MyOffersListLoaded).myOffersList;
        final List<Offer> updatedList = List<Offer>.from(currentList);
        updatedList.add(event.offer);
        emit(MyOffersListLoaded(updatedList));
      }
    } catch (error) {
      emit(MyOffersListError());
    }
  }

  void getAllMyOffers() {
    add(LoadAllMyOffers());
  }

  void addNewOffer(Offer offer) {
    add(AddMyOffer(offer));
  }
}
