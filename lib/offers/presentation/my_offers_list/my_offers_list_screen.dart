import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_finder/common/widgets/custom_app_bar.dart';
import 'package:teacher_finder/common/widgets/custom_drawer.dart';
import 'package:teacher_finder/offers/presentation/new_offer/new_offert_screen.dart';

import '../../../common/widgets/offer_card.dart';
import '../../domain/entities/offer.dart';

import '../my_offer_detail/my_offer_detail_screen.dart';
import 'bloc/my_offers_list_bloc.dart';
import 'bloc/my_offers_list_state.dart';

class MyOffersListScreen extends StatelessWidget {
  MyOffersListScreen({super.key});

  void goToMyOfferDetail(BuildContext context, Offer offer) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: ((context) => MyOfferDetailScreen(
                  offer: offer,
                ))));
  }

  final _myOffersListBloc = MyOffersListBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MyOffersListBloc()..getAllMyOffers(),
        child: Scaffold(
          drawer: const CustomDrawer(),
          appBar: const CustomAppBar(),
          body: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: BlocBuilder<MyOffersListBloc, MyOffersListState>(
                  builder: (context, state) {
                    if (state is MyOffersListLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is MyOffersListLoaded) {
                      return ListView.builder(
                        itemCount: state.myOffersList.length,
                        itemBuilder: (BuildContext context, int index) {
                          Offer offer = state.myOffersList[index];
                          return OfferCard(
                            offer: offer,
                            onPress: () {
                              goToMyOfferDetail(context, offer);
                            },
                          );
                        },
                      );
                    } else if (state is MyOffersListError) {
                      return const Text('error');
                    }

                    return Container();
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
                    builder: ((context) => BlocProvider.value(
                          value: _myOffersListBloc..getAllMyOffers(),
                          child: const NewOfferScreen(),
                        )),
                  ));
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add, color: Colors.white),
          ),
        ));
  }
}
