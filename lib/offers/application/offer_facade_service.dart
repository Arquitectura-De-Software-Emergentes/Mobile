import '../domain/entities/offer.dart';
import '../infrastructure/repositories/offer_repository.dart';

class OfferFacadeService {
  OfferFacadeService({
    required this.repository
});
final OfferRepository repository;
  Future<List<Offer>> getAllOffers() async {
    return repository.getAllOffers();
  }
}