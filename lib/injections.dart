import 'package:get_it/get_it.dart';
import 'package:teacher_finder/offers/infrastructure/data_sources/offer_remote_data_provider.dart';
import 'package:teacher_finder/offers/infrastructure/repositories/offer_repository.dart';

final serviceLocator = GetIt.instance;

void offerDependencies() {
  serviceLocator.registerLazySingleton<OfferRemoteDataProvider>(
      () => OfferRemoteDataProvider());
  serviceLocator.registerLazySingleton<OfferRepository>(() => OfferRepository(
      offerRemoteDataProvider: serviceLocator<OfferRemoteDataProvider>()));
}
