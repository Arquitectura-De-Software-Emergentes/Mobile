import 'package:flutter/material.dart';
import 'package:teacher_finder/common/widgets/app_bar_custom.dart';
import 'package:teacher_finder/offers/infrastructure/repositories/offer_repository.dart';

import '../../../common/styles/styles.dart';
import '../../../common/widgets/offer_card.dart';
import '../../domain/entities/offer.dart';
import '../../infrastructure/data_sources/offer_remote_data_provider.dart';
import '../offer_detail/offer_detail_screen.dart';

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
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 8.0),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          labelText: 'Search',
                          prefixIcon: Icon(Icons.search, color: Styles.gray),
                          labelStyle: TextStyle(color: Styles.gray),
                        ),
                      ),
                    ),
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      side: BorderSide(color: Styles.black),
                    ),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Icon(Icons.filter_list, color: Styles.gray),
                    ),
                  ),
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
