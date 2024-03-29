import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/widgets/custom_app_bar.dart';
import '../my_offers_list/bloc/my_offers_list_bloc.dart';
import 'bloc/new_offer_bloc.dart';
import 'widgets/new_offer_form.dart';

class NewOfferScreen extends StatelessWidget {
  NewOfferScreen({
    Key? key,
    required this.myOffersListBloc,
  }) : super(key: key);
  final MyOffersListBloc myOffersListBloc;
  final salaryCurrencyController = TextEditingController(text: 'PEN');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: 'Create Offer',
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.8,
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: BlocProvider(
              create: (context) => NewOfferBloc(),
              child: NewOfferForm(
                myOffersListBloc: myOffersListBloc,
                salaryCurrencyController: salaryCurrencyController,
              ),
            ),
          ),
        ));
  }
}
