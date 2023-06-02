import 'package:flutter/material.dart';
import 'package:teacher_finder/common/widgets/app_bar_custom.dart';
import 'package:teacher_finder/offers/infrastructure/repositories/offer_repository.dart';
import 'package:teacher_finder/offers/presentation/offers_list/widgets/filter_button.dart';
import '../../../common/widgets/offer_card.dart';
import '../../domain/entities/offer.dart';
import '../../infrastructure/data_sources/offer_remote_data_provider.dart';
import '../offer_detail/offer_detail_screen.dart';
import 'widgets/search_bar_custom.dart';

class OffersListScreen extends StatefulWidget {
  const OffersListScreen({Key? key}) : super(key: key);

  @override
  State<OffersListScreen> createState() => _OffersListScreenState();
}

class _OffersListScreenState extends State<OffersListScreen> {
  late Future<List<Offer>> _offersList;

  @override
  void initState() {
    final OfferRemoteDataProvider offerRemoteDataProvider =
        OfferRemoteDataProvider();
    final offerRepository =
        OfferRepository(offerRemoteDataProvider: offerRemoteDataProvider);
    _offersList = offerRepository.getAllOffers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(isHome: true),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: const SearchBarCustom()),
                  ),
                  const FilterButton(),
                ],
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Offer>>(
              future: _offersList,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No offers found'));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      Offer offer = snapshot.data![index];
                      return OfferCard(
                          offer: offer,
                          onPress: () {
                            goToOfferDetail(offer);
                          });
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  void goToOfferDetail(Offer offer) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: ((context) => OfferDetailScreen(
                  offer: offer,
                ))));
  }
}
