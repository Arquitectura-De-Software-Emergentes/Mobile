import 'package:flutter/material.dart';
import 'package:teacher_finder/common/widgets/custom_app_bar.dart';
import 'package:teacher_finder/common/widgets/custom_drawer.dart';

import 'package:teacher_finder/offers/presentation/new_offer/new_offert_screen.dart';


import '../../../common/widgets/offer_card.dart';
import '../../domain/entities/offer.dart';
import '../../infrastructure/data_sources/offer_remote_data_provider.dart';
import '../../infrastructure/repositories/offer_repository.dart';
import '../my_offer_detail/my_offer_detail_screen.dart';

class MyOffersListScreen extends StatefulWidget {
  const MyOffersListScreen({Key? key}) : super(key: key);

  @override
  State<MyOffersListScreen> createState() => _MyOffersListScreenState();
}

class _MyOffersListScreenState extends State<MyOffersListScreen> {
  late Future<List<Offer>> _offersList;

  @override
  void initState() {
    final OfferRemoteDataProvider offerRemoteDataProvider =
        OfferRemoteDataProvider();
    final offerRepository =
        OfferRepository(offerRemoteDataProvider: offerRemoteDataProvider);
    super.initState();
    _offersList = offerRepository.getAllOffers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          const SizedBox(
            height: 15,
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
                          goToMyOfferDetail(offer);
                        },
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => const NewOfferScreen())));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  void goToMyOfferDetail(Offer offer) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: ((context) => MyOfferDetailScreen(
                  offer: offer,
                ))));
  }
}
