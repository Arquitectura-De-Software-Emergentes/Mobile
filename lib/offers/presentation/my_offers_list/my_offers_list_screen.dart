import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/widgets/custom_app_bar.dart';
import '../../../common/widgets/custom_drawer.dart';
import '../../domain/entities/offer.dart';
import '../new_offer/new_offer_screen.dart';
import 'bloc/my_offers_list_bloc.dart';
import 'bloc/my_offers_list_state.dart';
import 'widgets/my_offer_card.dart';
import 'widgets/my_offer_detail_screen.dart';

class MyOffersListScreen extends StatelessWidget {
  MyOffersListScreen({super.key});
  final MyOffersListBloc myOffersListBloc = MyOffersListBloc();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MyOffersListBloc>(
      create: (context) => myOffersListBloc,
      child: Scaffold(
        drawer: const CustomDrawer(),
        appBar: const CustomAppBar(
          title: 'Home',
        ),
        body: const MyOffersList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    NewOfferScreen(myOffersListBloc: myOffersListBloc),
              ),
            );
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}

class MyOffersList extends StatelessWidget {
  const MyOffersList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    context.read<MyOffersListBloc>().getAllMyOffers();
    context.read<MyOffersListBloc>().getAllTest();

    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Expanded(
          child: BlocBuilder<MyOffersListBloc, MyOffersListState>(
            builder: (context, state) {
              if (state.status == MyOffersListStatus.loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.status == MyOffersListStatus.success) {
                return ListView.builder(
                  itemCount: state.myOffersList.length,
                  itemBuilder: (BuildContext context, int index) {
                    Offer offer = state.myOffersList[index];
                    return GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(32)),
                          ),
                          isScrollControlled: true,
                          builder: (context) => DraggableScrollableSheet(
                            initialChildSize: 0.6,
                            maxChildSize: 0.6,
                            expand: false,
                            builder: (context, scrollController) => SizedBox(
                              child: SingleChildScrollView(
                                child: MyOfferDetail(
                                  offer: state.myOffersList[index],
                                  tests: state.availableTest,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      child: MyOfferCard(
                        offer: offer,
                      ),
                    );
                  },
                );
              } else if (state.status == MyOffersListStatus.error) {
                return Center(child: Text(state.errorMessage));
              }

              return Container();
            },
          ),
        ),
      ],
    );
  }
}
