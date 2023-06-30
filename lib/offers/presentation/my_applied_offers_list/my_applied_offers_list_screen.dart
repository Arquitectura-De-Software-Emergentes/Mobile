import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_finder/assessment/infrastructure/data_sources/assessment_remote_data_provider.dart';
import 'package:teacher_finder/assessment/presentation/test/test_screen.dart';
import 'package:teacher_finder/assessment/presentation/video-presentation/video_presentation_teacher_screen.dart';
import 'package:teacher_finder/common/widgets/custom_app_bar.dart';
import 'package:teacher_finder/offers/infrastructure/models/applied_offer_model.dart';
import 'package:teacher_finder/offers/presentation/my_applied_offers_list/bloc/bloc.dart';
import '../../../common/styles/styles.dart';

class MyAppliedOffersListScreen extends StatefulWidget {
  const MyAppliedOffersListScreen({Key? key}) : super(key: key);

  @override
  State<MyAppliedOffersListScreen> createState() =>
      _MyAppliedOffersListScreenState();
}

class _MyAppliedOffersListScreenState extends State<MyAppliedOffersListScreen> {
  final bloc = AppliedOffersListBloc();

  Future<void> _showDialog(
      BuildContext context, int testId, int jobOfferId) async {
    await showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Are you sure ?'),
          actions: [
            SizedBox(
              height: 30,
              width: 90,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TestScreen(
                                testId: testId,
                                jobOfferId: jobOfferId,
                              )));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Styles.secondaryColor,
                    side: BorderSide.none,
                    shape: const StadiumBorder()),
                child: const Text(
                  "OK",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 30,
              width: 90,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Styles.secondaryColor,
                    side: BorderSide.none,
                    shape: const StadiumBorder()),
                child: const Text(
                  "CANCEL",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showDialogError(BuildContext context, String text) async {
    await showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Center(child: Text('There is no $text')),
          actions: [
            SizedBox(
              height: 30,
              width: 90,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Styles.secondaryColor,
                    side: BorderSide.none,
                    shape: const StadiumBorder()),
                child: const Text(
                  "OK",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppliedOffersListBloc>(
      create: (BuildContext context) => bloc..getAllAppliedOffers(),
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Applied offers',
        ),
        body: Column(
          children: [
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
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                SizedBox(
                                                  height: 30,
                                                  width: 80,
                                                  child: ElevatedButton(
                                                    onPressed: () async {
                                                      final assessmentRemoteDataProvider =
                                                          AssessmentRemoteDataProvider();
                                                      final object =
                                                          await assessmentRemoteDataProvider
                                                              .getTestByOfferId(
                                                                  offer
                                                                      .jobOfferId);
                                                      if (object['testId'] !=
                                                          0) {
                                                        //mostrar snackbar
                                                        _showDialog(
                                                            context,
                                                            object['testId'],
                                                            offer.jobOfferId);
                                                      } else {
                                                        _showDialogError(
                                                            context, 'exam');
                                                      }
                                                    },
                                                    style: ElevatedButton.styleFrom(
                                                        backgroundColor: Styles
                                                            .secondaryColor,
                                                        side: BorderSide.none,
                                                        shape:
                                                            const StadiumBorder()),
                                                    child: const Text(
                                                      "TEST",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                SizedBox(
                                                  height: 30,
                                                  width: 80,
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                VideoPresentationTeacherScreen(
                                                              jobOfferId: offer
                                                                  .jobOfferId,
                                                            ),
                                                          ));
                                                    },
                                                    style: ElevatedButton.styleFrom(
                                                        backgroundColor: Styles
                                                            .secondaryColor,
                                                        side: BorderSide.none,
                                                        shape:
                                                            const StadiumBorder()),
                                                    child: const Text(
                                                      "VIDEO",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
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
