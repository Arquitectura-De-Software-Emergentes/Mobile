import 'package:teacher_finder/offers/domain/entities/offer.dart';

abstract class OfferInterface {
  Future<List<Offer>> getAllOffers();
  Future<void> createOffer(Offer offer);
}
