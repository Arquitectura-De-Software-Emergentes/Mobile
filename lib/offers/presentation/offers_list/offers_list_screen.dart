import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_finder/common/widgets/custom_app_bar.dart';
import 'package:teacher_finder/common/widgets/custom_drawer.dart';
import 'package:teacher_finder/offers/presentation/offers_list/bloc/bloc.dart';
import 'package:teacher_finder/offers/presentation/offers_list/widgets/filter_button.dart';
import '../../../common/widgets/offer_card.dart';
import '../../domain/entities/offer.dart';
import '../offer_detail/offer_detail_screen.dart';
import 'widgets/search_bar_custom.dart';

class OffersListScreen extends StatelessWidget {
  const OffersListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OffersListBloc>(
      create: (BuildContext context) => OffersListBloc()..getAllOffers(),
      child: Scaffold(
        drawer: const CustomDrawer(),
        appBar: const CustomAppBar(),
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
                        child: const SearchBarCustom(),
                      ),
                    ),
                    const FilterButton(),
                  ],
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<OffersListBloc, OffersListState>(
                builder: (context, state) {
                  if (state is OffersListLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is OffersListLoaded) {
                    return ListView.builder(
                      itemCount: state.offersList.length,
                      itemBuilder: (BuildContext context, int index) {
                        Offer offer = state.offersList[index];
                        return OfferCard(
                          offer: offer,
                          onPress: () {
                            goToOfferDetail(context, offer);
                          },
                        );
                      },
                    );
                  } else if (state is OffersListError) {
                    return const Text('error');
                  }

                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void goToOfferDetail(BuildContext context, Offer offer) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: ((context) => OfferDetailScreen(
                  offer: offer,
                ))));
  }
}
