import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_finder/common/widgets/custom_app_bar.dart';
import 'package:teacher_finder/offers/domain/entities/course.dart';
import 'package:teacher_finder/offers/domain/entities/enums/availability.dart';
import 'package:teacher_finder/offers/domain/entities/enums/currency.dart';
import 'package:teacher_finder/offers/domain/entities/enums/experience.dart';
import 'package:teacher_finder/offers/domain/entities/enums/modality.dart';
import 'package:teacher_finder/offers/domain/entities/enums/type_x.dart';
import 'package:teacher_finder/offers/domain/entities/position_profile.dart';
import 'package:teacher_finder/offers/domain/entities/salary.dart';
import 'package:teacher_finder/offers/infrastructure/repositories/offer_repository.dart';
import 'package:teacher_finder/offers/presentation/new_offer/widgets/date_input.dart';
import 'package:teacher_finder/offers/presentation/new_offer/widgets/text_input.dart';

import '../../../common/styles/styles.dart';
import '../../domain/entities/offer.dart';
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
  final salaryAmountController = TextEditingController();
  final salaryCurrencyController = TextEditingController();

  final maxApplicationsController = TextEditingController();
  final endDateController = TextEditingController();
  final initialDateController = TextEditingController();
  final optionalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //final myOffersListBloc = context.read<MyOffersListBloc>();
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
                  TextInput(controller: titleController, title: 'Title'),
                  TextInput(
                      controller: descriptionController, title: 'Description'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextInput(
                            controller: salaryAmountController,
                            title: 'Salary Amount'),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Currency',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                  color: Colors.black)),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: DropdownButtonFormField<Currency>(
                              decoration: InputDecoration(
                                fillColor: const Color(0xFFEFEFF0),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                    vertical: 15.0), // Espaciado interno
                              ),
                              value: Currency.pen,
                              items: Currency.values
                                  .map<DropdownMenuItem<Currency>>(
                                      (Currency currency) {
                                return DropdownMenuItem<Currency>(
                                  value: currency,
                                  child: Text(currency.value),
                                );
                              }).toList(),
                              onChanged: (value) {
                                salaryCurrencyController.text = value!.value;
                              },
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  TextInput(
                      controller: maxApplicationsController,
                      title: 'Max Applications'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: DateInput(
                            controller: initialDateController,
                            title: 'Initial Date'),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: DateInput(
                            controller: endDateController, title: 'End Date'),
                      ),
                    ],
                  ),
                  Center(
                    child: SizedBox(
                      height: 45,
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          final offer1 = Offer(
                              id: 30,
                              recruiterId: 1,
                              title: 'title',
                              description: 'description',
                              initialDate: DateTime(2023 - 02 - 02),
                              endDate: DateTime(2023 - 02 - 02),
                              salary:
                                  Salary(mount: 100.0, currency: Currency.pen),
                              maxApplications: 10,
                              numberApplications: 1,
                              availability:
                                  Availability.parseAvailability('AVAILABLE'),
                              positionProfile: PositionProfile(
                                  course: Course(course: 'MATH'),
                                  experience: Experience.lessThan3years,
                                  id: 30,
                                  modality: Modality.blended,
                                  name: 'holas',
                                  type: TypeX.fullTime));
                          //final myOffersListBloc =  BlocProvider.of<MyOffersListBloc>(context);
                          myOffersListBloc.addNewOffer(offer1);
                          //myOffersListBloc.addNewOffer(offer1);
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
                            builder: (context) => MyOffersListScreen()),
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
