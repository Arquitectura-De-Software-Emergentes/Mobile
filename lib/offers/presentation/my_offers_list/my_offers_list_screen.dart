import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_finder/common/widgets/custom_app_bar.dart';
import 'package:teacher_finder/common/widgets/custom_drawer.dart';

import 'package:teacher_finder/offers/presentation/new_offer/new_offert_screen.dart';

import '../../../common/widgets/offer_card.dart';
import '../../domain/entities/offer.dart';

import 'bloc/my_offers_list_bloc.dart';

import 'bloc/my_offers_list_state.dart';
import 'widgets/my_offer_detail_screen.dart';

class MyOffersListScreen extends StatelessWidget {
  const MyOffersListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MyOffersListBloc>(
      create: (context) => MyOffersListBloc()..getAllMyOffers(),
      child: Scaffold(
        drawer: const CustomDrawer(),
        appBar: const CustomAppBar(
          title: 'Home',
        ),
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
                            //goToOfferDetail(context, offer);
                            showModalBottomSheet(
                              context: context,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(32))),
                              isScrollControlled: true,
                              builder: (context) => DraggableScrollableSheet(
                                initialChildSize: 0.5,
                                expand: false,
                                builder: (context, scrollController) =>
                                    SizedBox(
                                  child: SingleChildScrollView(
                                    child: MyOfferDetail(
                                      offer: state.myOffersList[index],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  } else if (state is MyOffersListError) {
                    return Center(child: Text(state.errorMessage));
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
                    builder: ((context) => const NewOfferScreen())));
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}
