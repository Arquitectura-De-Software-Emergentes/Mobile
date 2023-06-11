import 'package:equatable/equatable.dart';

abstract class OfferApplicantsListEvent extends Equatable {
  const OfferApplicantsListEvent();

  @override
  List<Object> get props => [];
}
class LoadAllOfferApplicants extends OfferApplicantsListEvent {}

