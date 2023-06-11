import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:teacher_finder/common/widgets/custom_app_bar.dart';
import 'package:teacher_finder/offers/domain/entities/course.dart';
import 'package:teacher_finder/offers/domain/entities/enums/availability.dart';
import 'package:teacher_finder/offers/domain/entities/enums/currency.dart';
import 'package:teacher_finder/offers/domain/entities/enums/experience.dart';
import 'package:teacher_finder/offers/domain/entities/enums/modality.dart';
import 'package:teacher_finder/offers/domain/entities/enums/type_x.dart';
import 'package:teacher_finder/offers/domain/entities/position_profile.dart';
import 'package:teacher_finder/offers/domain/entities/salary.dart';
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
  final salaryCurrencyController = TextEditingController(text: 'PEN');
  final maxApplicationsController = TextEditingController();
  final endDateController = TextEditingController();
  final initialDateController = TextEditingController();
  final optionalController = TextEditingController();
  bool isButtonEnabled = false;

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
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextInput(
                      label: 'Ejm. Teacher Matj',
                      controller: titleController,
                      title: 'Title'),
                  TextInput(
                      label: 'Ejm. Lores lore re lors..',
                      controller: descriptionController,
                      title: 'Description'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextInput(
                            label: 'Ejm: 1000',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: TextInput(
                              label: 'Ejm. 100',
                              controller: maxApplicationsController,
                              title: 'Applications')),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: DateInput(
                            label: 'yyyy-MM-DD',
                            controller: initialDateController,
                            title: 'Initial Date'),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: DateInput(
                            label: 'yyyy-MM-DD',
                            controller: endDateController,
                            title: 'End Date'),
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
                              id: 0,
                              recruiterId: 1,
                              title: titleController.text,
                              description: descriptionController.text,
                              initialDate: DateFormat('yyyy-MM-dd')
                                  .parse((initialDateController.text)),
                              endDate: DateFormat('yyyy-MM-dd')
                                  .parse((endDateController.text)),
                              salary: Salary(
                                  mount:
                                      double.parse(salaryAmountController.text),
                                  currency: Currency.parseCurrency(
                                      salaryCurrencyController.text)),
                              maxApplications:
                                  int.parse(maxApplicationsController.text),
                              numberApplications: 0,
                              availability:
                                  Availability.parseAvailability('AVAILABLE'),
                              positionProfile: PositionProfile(
                                  course: Course(course: 'MATH'),
                                  experience: Experience.lessThan3years,
                                  id: 30,
                                  modality: Modality.blended,
                                  name: 'MATH',
                                  type: TypeX.fullTime));
                          final snackBar = SnackBar(
                            backgroundColor: Styles.sucess,
                            content: const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Center(child: CircularProgressIndicator()),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                    'CREATING OFFER') // Barra de progreso circular
                              ],
                            ),
                            action: SnackBarAction(
                              textColor: Styles.white,
                              label: 'Undo',
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        backgroundColor: Styles.error,
                                        content:
                                            const Text('creation canceled')));
                              },
                            ),
                          );
                          ScaffoldMessenger.of(context)
                              .showSnackBar(snackBar)
                              .closed
                              .then((SnackBarClosedReason reason) {
                            if (reason != SnackBarClosedReason.action) {
                              myOffersListBloc.addNewOffer(offer1);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyOffersListScreen()),
                              );
                            }
                          });
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
}
