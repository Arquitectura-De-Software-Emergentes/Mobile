import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_finder/common/widgets/applicant_custom_drawer.dart';
import 'package:teacher_finder/common/widgets/custom_app_bar.dart';
import 'package:teacher_finder/common/widgets/custom_drawer.dart';
import 'package:teacher_finder/common/widgets/error_handler.dart';

import 'widgets/offer_card.dart';
import '../../domain/entities/offer.dart';
import 'bloc/offers_list_bloc.dart';
import 'widgets/filter_button.dart';
import 'widgets/offer_detail.dart';
import 'widgets/search_bar_custom.dart';

class OffersListScreen extends StatelessWidget {
  OffersListScreen({Key? key}) : super(key: key);

  final bloc = OffersListBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OffersListBloc>(
      create: (BuildContext context) => bloc..getAllOffers(),
      child: Scaffold(
        drawer: const ApplicantCustomDrawer(),
        appBar: const CustomAppBar(
          title: 'Home',
        ),
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
                        child: SearchBarCustom(onChanged: (text) {
                          bloc.filterByText(text);
                        }),
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
                  if (state.status == OffersListStatus.loading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state.status == OffersListStatus.success) {
                    return ListView.builder(
                      itemCount: state.offerSearch.length,
                      itemBuilder: (BuildContext context, int index) {
                        Offer offer = state.offerSearch[index];
                        return GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(32),
                                ),
                              ),
                              isScrollControlled: true,
                              builder: (context) => DraggableScrollableSheet(
                                initialChildSize: 0.5,
                                expand: false,
                                builder: (context, scrollController) =>
                                    SizedBox(
                                  child: SingleChildScrollView(
                                    child: OfferDetail(
                                      offer: state.offerSearch[index],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          child: OfferCard(
                            offer: offer,
                          ),
                        );
                      },
                    );
                  } else if (state.status == OffersListStatus.error) {
                    return ErrorHandler(errorMessage: state.errorMessage);
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
}
