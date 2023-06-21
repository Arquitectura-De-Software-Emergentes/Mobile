import 'package:teacher_finder/offers/domain/entities/offer.dart';

abstract class OfferInterface {
  Future<List<Offer>> getAllOffers();
  Future<List<Offer>> getAllOffersByRecruiterId(int id);

  Future<void> createOffer(Offer offer);
}
