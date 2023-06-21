import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../common/styles/styles.dart';
import '../../../domain/entities/course.dart';
import '../../../domain/entities/enums/availability.dart';
import '../../../domain/entities/enums/currency.dart';
import '../../../domain/entities/enums/experience.dart';
import '../../../domain/entities/enums/modality.dart';
import '../../../domain/entities/enums/type_x.dart';
import '../../../domain/entities/offer.dart';
import '../../../domain/entities/position_profile.dart';
import '../../../domain/entities/salary.dart';
import '../../my_offers_list/bloc/my_offers_list_bloc.dart';
import '../bloc/new_offer_bloc.dart';
import 'date_input.dart';
import '../../../../common/widgets/text_input.dart';

class NewOfferForm extends StatelessWidget {
  NewOfferForm({
    super.key,
    required this.myOffersListBloc,
    required this.salaryCurrencyController,
  });

  final TextEditingController salaryCurrencyController;
  final MyOffersListBloc myOffersListBloc;

  final initialDateController = TextEditingController();
  final endDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final newOfferBloc = context.watch<NewOfferBloc>();
    final title = (newOfferBloc.state as NewOfferFormState).title;
    final description = (newOfferBloc.state as NewOfferFormState).description;
    final applications = (newOfferBloc.state as NewOfferFormState).applications;
    final salaryAmount = (newOfferBloc.state as NewOfferFormState).salaryAmount;
    final initialDate = (newOfferBloc.state as NewOfferFormState).initialDate;
    final endDate = (newOfferBloc.state as NewOfferFormState).endDate;

    final successSnackBar = SnackBar(
      backgroundColor: Styles.success,
      content: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(child: CircularProgressIndicator()),
          SizedBox(
            height: 15,
          ),
          Text('CREATING OFFER')
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

    void creatingOffer(BuildContext context) {
      final offer1 = Offer(
        id: 0,
        recruiterId: 1,
        title: title.value,
        description: description.value,
        initialDate: DateFormat('yyyy-MM-dd').parse((initialDate.value)),
        endDate: DateFormat('yyyy-MM-dd').parse((endDate.value)),
        salary: Salary(
            mount: double.parse(salaryAmount.value),
            currency: Currency.parseCurrency(salaryCurrencyController.text)),
        maxApplications: int.parse(applications.value),
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

      ScaffoldMessenger.of(context)
          .showSnackBar(successSnackBar)
          .closed
          .then((SnackBarClosedReason reason) {
        if (reason != SnackBarClosedReason.action) {
          myOffersListBloc.addNewOffer(offer1);
          Navigator.pop(context); //,
        }
      });
    }

    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextInput(
            label: 'Ejm. Teacher Math',
            title: 'Title',
            onChanged: (value) => newOfferBloc.titleChanged(value),
            errorMessage: title.errorMessage,
          ),
          TextInput(
            label: 'Ejm. Lores lore re lors..',
            title: 'Description',
            onChanged: (value) => newOfferBloc.descriptionChanged(value),
            errorMessage: description.errorMessage,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: TextInput(
                  label: 'Ejm: 1000',
                  title: 'Salary Amount',
                  onChanged: (value) => newOfferBloc.salaryAmountChanged(value),
                  errorMessage: salaryAmount.errorMessage,
                ),
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
                width: MediaQuery.of(context).size.width * 0.28,
                child: TextInput(
                  label: 'Ejm. 100',
                  title: 'Applications',
                  onChanged: (value) => newOfferBloc.applicationsChanged(value),
                  errorMessage: applications.errorMessage,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: DateInput(
                    onDateSelected: (selectedDate) {
                      newOfferBloc.initialDateChanged(
                          DateFormat('yyyy-MM-dd').format(selectedDate));
                    },
                    dateText: (newOfferBloc.state as NewOfferFormState)
                        .initialDate
                        .value,
                    newOfferBloc: newOfferBloc,
                    onChanged: (value) =>
                        newOfferBloc.initialDateChanged(value),
                    label: 'yyyy-MM-DD',
                    title: 'Initial Date'),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: DateInput(
                    onDateSelected: (selectedDate) {
                      newOfferBloc.endDateChanged(
                          DateFormat('yyyy-MM-dd').format(selectedDate));
                    },
                    dateText:
                        (newOfferBloc.state as NewOfferFormState).endDate.value,
                    newOfferBloc: newOfferBloc,
                    onChanged: (value) => newOfferBloc.endDateChanged(value),
                    errorMessage: initialDate.errorMessage,
                    label: 'yyyy-MM-DD',
                    title: 'End Date'),
              ),
            ],
          ),
          Center(
            child: SizedBox(
              height: 45,
              width: 150,
              child: ElevatedButton(
                onPressed: (newOfferBloc.state as NewOfferFormState).isValid
                    ? () => creatingOffer(context)
                    : null,
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
