import 'package:http/http.dart' as http;
import 'package:teacher_finder/common/api_config/api_config.dart';
import 'package:teacher_finder/offers/domain/entities/offer.dart';
import 'package:teacher_finder/offers/domain/interfaces/offer_interface.dart';

class OfferRepository extends OfferInterface {
  String endpoint = 'offers';

  @override
  Future<List<Offer>> getAllOffers() async {
    final response =
        await http.get(Uri.parse("${ApiConfig.baseUrl}/$endpoint"));
    if (response.statusCode == 200) {
      return Offer.toOfferList(response.body);
    } else {
      throw Exception('Failed to fetch offers');
    }
  }
}
