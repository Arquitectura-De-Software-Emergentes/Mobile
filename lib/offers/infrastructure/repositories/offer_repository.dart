import 'package:teacher_finder/offers/domain/interfaces/offer_interface.dart';

import '../../domain/entities/offer.dart';
import '../data_sources/offer_remote_data_provider.dart';

class OfferRepository extends OfferInterface {
  String endpoint = 'offers';
  OfferRepository({
    required this.offerRemoteDataProvider
});
  final OfferRemoteDataProvider offerRemoteDataProvider;

  @override
  Future<List<Offer>> getAllOffers() async {
    final response = await offerRemoteDataProvider.getAllOffers();
    return response;
  }
}
