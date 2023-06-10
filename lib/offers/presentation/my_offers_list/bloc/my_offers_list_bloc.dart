import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:teacher_finder/offers/infrastructure/repositories/offer_repository.dart';

import '../../../domain/entities/offer.dart';
import '../../../infrastructure/models/offer_model.dart';
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
      emit(MyOffersListLoaded(offers));
    } catch (error) {
      emit(MyOffersListError(error.toString()));
    }
  }

  void _onAddOffer(AddMyOffer event, Emitter<MyOffersListState> emit) async {
    try {
      if (state is MyOffersListLoaded) {
        final List<Offer> currentList =
            (state as MyOffersListLoaded).myOffersList;
        final List<Offer> updatedList = List<Offer>.from(currentList);
        final Offer response =
            await offerRepository.createOffer(currentList[0]);
        updatedList.add(response);
        emit(MyOffersListLoaded(updatedList));
      }
    } catch (error) {
      emit(MyOffersListError(error.toString()));
    }
  }

  void getAllMyOffers() {
    add(LoadAllMyOffers());
  }

  void addNewOffer(Offer offer) {
    add(AddMyOffer(offer));
  }
}
