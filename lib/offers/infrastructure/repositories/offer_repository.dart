import 'package:teacher_finder/offers/domain/interfaces/offer_interface.dart';
import 'package:teacher_finder/offers/infrastructure/models/applied_offer_model.dart';
import '../../domain/entities/offer.dart';
import '../data_sources/offer_remote_data_provider.dart';

class OfferRepository extends OfferInterface {
  OfferRepository({required this.offerRemoteDataProvider});
  final OfferRemoteDataProvider offerRemoteDataProvider;

  @override
  Future<List<Offer>> getAllOffers() async {
    final response = await offerRemoteDataProvider.getAllOffers();

    return response;
  }

  @override
  Future<Offer> createOffer(Offer offer) async {
    final response = await offerRemoteDataProvider.createOffer(offer);
    return response;
  }

  @override
  Future<List<Offer>> getAllOffersByRecruiterId(int id) async {
    final response =
        await offerRemoteDataProvider.getAllOffersByRecruiterId(id);

    return response;
  }

  Future<List<AppliedOfferModel>> getAllAppliedOffers(String id) async {
    final response = await offerRemoteDataProvider.getAllAppliedOffersByApplicantId(id);
    return response;
  }
}
