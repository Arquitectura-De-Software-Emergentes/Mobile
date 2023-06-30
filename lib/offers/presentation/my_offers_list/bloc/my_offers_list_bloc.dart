import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:teacher_finder/assessment/infrastructure/data_sources/assessment_remote_data_provider.dart';
import 'package:teacher_finder/common/user_config/user_config.dart';
import 'package:teacher_finder/offers/infrastructure/repositories/offer_repository.dart';

import '../../../../assessment/domain/entities/test.dart';
import '../../../domain/entities/offer.dart';
import 'my_offers_list_event.dart';
import 'my_offers_list_state.dart';

class MyOffersListBloc extends Bloc<MyOffersListEvent, MyOffersListState> {
  final OfferRepository offerRepository;
  MyOffersListBloc()
      : offerRepository = GetIt.instance<OfferRepository>(),
        super(const MyOffersListState()) {
    on<LoadAllMyOffers>(_onGetAllMyOffers);
    on<AddMyOffer>(_onAddOffer);
    on<LoadAllTestAvailable>(_onGetAllTestAvailable);
  }
  void _onGetAllMyOffers(
      LoadAllMyOffers event, Emitter<MyOffersListState> emit) async {
    emit(state.copyWith(status: MyOffersListStatus.loading));
    try {
      var recruiterId = await UserConfig.getUserId();
      final List<Offer> offers =
          await offerRepository.getAllOffersByRecruiterId(recruiterId);
      emit(state.copyWith(
          status: MyOffersListStatus.success, myOffersList: offers));
    } catch (error) {
      emit(state.copyWith(
          status: MyOffersListStatus.error, errorMessage: error.toString()));
    }
  }

  void _onAddOffer(AddMyOffer event, Emitter<MyOffersListState> emit) async {
    try {
      emit(state.copyWith(
        status: MyOffersListStatus.loading,
        myOffersList: state.myOffersList,
      ));
      final List<Offer> currentList = state.myOffersList;
      final List<Offer> updatedList = List<Offer>.from(currentList);
      final Offer response = await offerRepository.createOffer(event.offer);

      updatedList.add(response);

      emit(state.copyWith(
        status: MyOffersListStatus.success,
        myOffersList: updatedList,
      ));
    } catch (error) {
      emit(state.copyWith(
        status: MyOffersListStatus.error,
        errorMessage: error.toString(),
      ));
    }
  }

  void _onGetAllTestAvailable(
      LoadAllTestAvailable event, Emitter<MyOffersListState> emit) async {
    emit(state.copyWith(
      status: MyOffersListStatus.loading,
    ));
    try {
      final assessmentRemoteDataProvider = AssessmentRemoteDataProvider();
      int recruiterId = await UserConfig.getUserId();
      final List<Test> tests = await assessmentRemoteDataProvider
          .getAllTestsByRecruiterId(recruiterId);
      emit(state.copyWith(
          status: MyOffersListStatus.success, availableTest: tests));
    } catch (error) {
      emit(state.copyWith(
        status: MyOffersListStatus.error,
        errorMessage: error.toString(),
      ));
    }
  }

  void getAllMyOffers() {
    add(LoadAllMyOffers());
  }

  void addNewOffer(Offer offer) {
    add(AddMyOffer(offer));
  }

  void getAllTest() {
    add(LoadAllTestAvailable());
  }
}
