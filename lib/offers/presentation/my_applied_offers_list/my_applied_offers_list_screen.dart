import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_finder/common/widgets/custom_app_bar.dart';
import 'package:teacher_finder/common/widgets/custom_drawer.dart';
import 'package:teacher_finder/offers/infrastructure/models/applied_offer_model.dart';
import 'package:teacher_finder/offers/presentation/my_applied_offers_list/bloc/bloc.dart';
import '../../../common/styles/styles.dart';

class MyAppliedOffersListScreen extends StatelessWidget {
  MyAppliedOffersListScreen({Key? key}) : super(key: key);

  final bloc = AppliedOffersListBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppliedOffersListBloc>(
      create: (BuildContext context) => bloc..getAllAppliedOffers(),
      child: Scaffold(
        drawer: const CustomDrawer(),
        appBar: const CustomAppBar(
          title: 'Applied offers',
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
            ),
            Expanded(
              child: BlocBuilder<AppliedOffersListBloc, AppliedOffersListState>(
                builder: (context, state) {
                  if (state.status == OffersListStatus.loading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state.status == OffersListStatus.success) {
                    return ListView.builder(
                      itemCount: state.offerSearch.length,
                      itemBuilder: (BuildContext context, int index) {
                        AppliedOfferModel offer = state.offerSearch[index];
                        return GestureDetector(
                          onTap: () {
                            print("Show offert applied detail");
                          },
                          child: SizedBox(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 0.0, vertical: 00),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25.0, vertical: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              offer.title,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 10,
                                          child: Text(
                                            offer.description,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: Styles.gray,
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else if (state.status == OffersListStatus.error) {
                    return Center(child: Text('Error: ${state.errorMessage}'));
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
