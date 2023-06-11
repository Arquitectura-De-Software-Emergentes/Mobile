import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:teacher_finder/offers/infrastructure/repositories/offer_repository.dart';

import '../../../domain/entities/offer.dart';
import 'offer_applicants_list_event.dart';
import 'offer_applicants_list_state.dart';

class OfferApplicantsListBloc extends Bloc<OfferApplicantsListEvent, OfferApplicantsListState> {
  final OfferRepository offerRepository;
  OfferApplicantsListBloc()
      : offerRepository = GetIt.instance<OfferRepository>(),
        super(MyOffersListInitial()) {
    on<LoadAllOfferApplicants>(_onGetAllOfferApplicants);
  }
  void _onGetAllOfferApplicants(
      LoadAllOfferApplicants event, Emitter<OfferApplicantsListState> emit) async {
    emit(MyOffersListLoading());
    try {
      final List<Offer> offers = await offerRepository.getAllOffers();
      emit(MyOffersListLoaded(offers));
    } catch (error) {
      emit(MyOffersListError(error.toString()));
    }
  }

  void getAllOfferApplicants() {
    add(LoadAllOfferApplicants());
  }


}
