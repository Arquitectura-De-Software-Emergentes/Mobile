import 'package:flutter/material.dart';
import 'package:teacher_finder/offers/infrastructure/repositories/offer_repository.dart';
import 'package:teacher_finder/offers/presentation/offers_list/widgets/offer_card.dart';

import '../../../common/styles/styles.dart';
import '../../domain/entities/offer.dart';
import '../my_offer_detail/my_offer_detail_screen.dart';

class MyOffersListScreen extends StatefulWidget {
  const MyOffersListScreen({Key? key}) : super(key: key);

  @override
  State<MyOffersListScreen> createState() => _MyOffersListScreenState();
}

class _MyOffersListScreenState extends State<MyOffersListScreen> {
  late Future<List<Offer>> _offersList;
  final offerRepository = OfferRepository();

  @override
  void initState() {
    super.initState();
    _offersList = offerRepository.getAllOffers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teacher Finder'),
        backgroundColor: Styles.primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundColor: Colors.grey,
            ),
          ),
        ],
      ),
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
          // Implementation for create new
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
