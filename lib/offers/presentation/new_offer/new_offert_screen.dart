import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_finder/common/widgets/custom_app_bar.dart';
import 'package:teacher_finder/offers/domain/entities/offer.dart';
import 'package:teacher_finder/offers/presentation/new_offer/widgets/date_input.dart';
import 'package:teacher_finder/offers/presentation/new_offer/widgets/text_input.dart';

import '../../../common/styles/styles.dart';
import '../my_offers_list/bloc/my_offers_list_bloc.dart';
import '../my_offers_list/my_offers_list_screen.dart';

class NewOfferScreen extends StatefulWidget {
  const NewOfferScreen({Key? key}) : super(key: key);

  @override
  State<NewOfferScreen> createState() => _NewOfferScreenState();
}

class _NewOfferScreenState extends State<NewOfferScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final salaryController = TextEditingController();
  final maxApplicationsController = TextEditingController();
  final endDateController = TextEditingController();
  final initialDateController = TextEditingController();
  final optionalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //final myOffersListBloc = BlocProvider.of<MyOffersListBloc>(context);
    final myOffersListBloc = context.read<MyOffersListBloc>();

    return Scaffold(
        appBar: const CustomAppBar(
          title: 'Create Offer',
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.8,
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Center(
                    child: Text("New Offer Job",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 30,
                            color: Colors.black)),
                  ),
                  TextInput(controller: titleController, title: 'Title'),
                  TextInput(
                      controller: descriptionController, title: 'Description'),
                  TextInput(controller: salaryController, title: 'Salary'),
                  TextInput(
                      controller: maxApplicationsController,
                      title: 'Max Application'),
                  DateInput(
                      controller: initialDateController, title: 'Initial Date'),
                  DateInput(controller: endDateController, title: 'End Date'),
                  Center(
                    child: SizedBox(
                      height: 45,
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          /*Offer offer = Offer(
                              id: 10,
                              title: 'lorem lr er dsosodosdao ',
                              description: 'lorem lr er dsosodosdao ',
                              initialDate: DateTime(2013 - 10 - 10),
                              endDate: DateTime(2013 - 10 - 10),
                              maxApplications: 90,
                              numberApplications: 30);
                          myOffersListBloc.addNewOffer(offer);*/
                          offerCreated(context);
                          //print(endDat1eController.text);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Styles.secondaryColor,
                            side: BorderSide.none,
                            shape: const StadiumBorder()),
                        child: const Text(
                          "Create",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  void offerCreated(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 80.0,
              ),
              const SizedBox(height: 16.0),
              const Text(
                "Offer created",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              Center(
                child: SizedBox(
                  height: 45,
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyOffersListScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF171740),
                        side: BorderSide.none,
                        shape: const StadiumBorder()),
                    child: const Text(
                      "OK",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
