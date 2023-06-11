import 'package:teacher_finder/injections.dart';
import 'package:teacher_finder/offers/application/offer_facade_service.dart';

import '../domain/entities/offer.dart';

class OfferApi {
  final OfferFacadeService offerFacade = serviceLocator<OfferFacadeService>();
  Future<List<Offer>> getOffers() async {
    return offerFacade.getAllOffers();
  }
}
