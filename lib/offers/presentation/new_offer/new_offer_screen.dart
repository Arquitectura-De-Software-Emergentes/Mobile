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
import 'package:teacher_finder/offers/presentation/new_offer/bloc/new_offer_bloc.dart';
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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final myOffersListBloc = context.read<MyOffersListBloc>();
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
                  formKey: _formKey,
                  titleController: titleController,
                  descriptionController: descriptionController,
                  salaryAmountController: salaryAmountController,
                  salaryCurrencyController: salaryCurrencyController,
                  maxApplicationsController: maxApplicationsController,
                  initialDateController: initialDateController,
                  endDateController: endDateController,
                  myOffersListBloc: myOffersListBloc),
            ),
          ),
        ));
  }
}

class NewOfferForm extends StatelessWidget {
  const NewOfferForm({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.titleController,
    required this.descriptionController,
    required this.salaryAmountController,
    required this.salaryCurrencyController,
    required this.maxApplicationsController,
    required this.initialDateController,
    required this.endDateController,
    required this.myOffersListBloc,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final TextEditingController salaryAmountController;
  final TextEditingController salaryCurrencyController;
  final TextEditingController maxApplicationsController;
  final TextEditingController initialDateController;
  final TextEditingController endDateController;
  final MyOffersListBloc myOffersListBloc;

  @override
  Widget build(BuildContext context) {
    final newOfferBloc = context.watch<NewOfferBloc>();
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextInput(
            label: 'Ejm. Teacher Matj',
            controller: titleController,
            title: 'Title',
            onChanged: (value) {
              newOfferBloc.titleChanged(value);
              _formKey.currentState!.validate();
            },
            validator: (value) {
              if (value == null || value.isEmpty) return 'Campo requiridooo';
              if (value.trim().isEmpty) return 'Campo requerido';
              if (value.length < 6) return 'Mas de 6 letras';
              return null;
            },
          ),
          TextInput(
            label: 'Ejm. Lores lore re lors..',
            controller: descriptionController,
            title: 'Description',
            validator: (value) {
              if (value == null || value.isEmpty) return 'Campo requiridooo';
              if (value.trim().isEmpty) return 'Campo requerido';
              if (value.length < 6) return 'Mas de 6 letras';
              return null;
            },
          ),
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
                            horizontal: 16.0, vertical: 15.0),
                      ),
                      value: Currency.pen,
                      items: Currency.values
                          .map<DropdownMenuItem<Currency>>((Currency currency) {
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
            child: FilledButton(
              child: const Text('test'),
              onPressed: () {
                //final isValid = _formKey.currentState!.validate();
                //if (!isValid) return;

                newOfferBloc.onSubmit();
              },
            ),
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
                        mount: double.parse(salaryAmountController.text),
                        currency: Currency.parseCurrency(
                            salaryCurrencyController.text)),
                    maxApplications: int.parse(maxApplicationsController.text),
                    numberApplications: 0,
                    availability: Availability.parseAvailability('AVAILABLE'),
                    positionProfile: PositionProfile(
                        course: Course(course: 'MATH'),
                        experience: Experience.lessThan3years,
                        id: 30,
                        modality: Modality.blended,
                        name: 'MATH',
                        type: TypeX.fullTime),
                  );
                  final snackBar = SnackBar(
                    backgroundColor: Styles.success,
                    content: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(child: CircularProgressIndicator()),
                        SizedBox(
                          height: 15,
                        ),
                        Text('CREATING OFFER') // Barra de progreso circular
                      ],
                    ),
                    action: SnackBarAction(
                      textColor: Styles.white,
                      label: 'Undo',
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Styles.error,
                            content: const Text('creation canceled')));
                      },
                    ),
                  );
                  ScaffoldMessenger.of(context)
                      .showSnackBar(snackBar)
                      .closed
                      .then((SnackBarClosedReason reason) {
                    if (reason != SnackBarClosedReason.action) {
                      myOffersListBloc.addNewOffer(offer1);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyOffersListScreen()),
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
    );
  }
}
