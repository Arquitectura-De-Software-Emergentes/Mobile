import 'package:get_it/get_it.dart';
import 'package:teacher_finder/assessment/infrastructure/repositories/assessment_repository.dart';
import 'package:teacher_finder/offers/infrastructure/data_sources/offer_remote_data_provider.dart';
import 'package:teacher_finder/offers/infrastructure/repositories/offer_repository.dart';

import 'assessment/infrastructure/data_sources/assessment_remote_data_provider.dart';

final serviceLocator = GetIt.instance;

void offerDependencies() {
  serviceLocator.registerLazySingleton<OfferRemoteDataProvider>(
      () => OfferRemoteDataProvider());
  serviceLocator.registerLazySingleton<OfferRepository>(() => OfferRepository(
      offerRemoteDataProvider: serviceLocator<OfferRemoteDataProvider>()));
}

void assessmentDependencies() {
  serviceLocator.registerLazySingleton<AssessmentRemoteDataProvider>(
      () => AssessmentRemoteDataProvider());
  serviceLocator.registerLazySingleton<AssessmentRepository>(() =>
      AssessmentRepository(
          assessmentRemoteDataProvider:
              serviceLocator<AssessmentRemoteDataProvider>()));
}
