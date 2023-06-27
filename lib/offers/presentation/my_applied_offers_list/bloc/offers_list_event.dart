part of 'offers_list_bloc.dart';

abstract class OffersAppliedListEvent extends Equatable {
  const OffersAppliedListEvent();

  @override
  List<Object> get props => [];
}

class LoadAllAppliedOffers extends OffersAppliedListEvent {}

class PostFetched extends OffersAppliedListEvent {}

class TextChanged extends OffersAppliedListEvent {
  final String text;

  const TextChanged({required this.text});

  @override
  List<Object> get props => [text];
}
