import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:teacher_finder/offers/infrastructure/models/applied_offer_model.dart';
import 'package:teacher_finder/offers/infrastructure/repositories/offer_repository.dart';
part 'offers_list_event.dart';
part 'offers_list_state.dart';

class AppliedOffersListBloc
    extends Bloc<OffersAppliedListEvent, AppliedOffersListState> {
  final OfferRepository offerRepository;

  AppliedOffersListBloc()
      : offerRepository = GetIt.instance<OfferRepository>(),
        super(const AppliedOffersListState()) {
    on<LoadAllAppliedOffers>(_onGetAllAppliedOffers);
  }

  void _onGetAllAppliedOffers(
      LoadAllAppliedOffers event, Emitter<AppliedOffersListState> emit) async {
    emit(state.copyWith(
      status: OffersListStatus.loading,
    ));
    try {
      final offers = await offerRepository.getAllAppliedOffers('6');

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

  void getAllAppliedOffers() {
    add(LoadAllAppliedOffers());
  }

  void filterByText(String text) {
    add(TextChanged(text: text));
  }
}
