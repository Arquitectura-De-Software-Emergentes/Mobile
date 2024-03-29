part of 'offers_list_bloc.dart';

abstract class OffersListEvent extends Equatable {
  const OffersListEvent();

  @override
  List<Object> get props => [];
}

class LoadAllOffers extends OffersListEvent {}

class PostFetched extends OffersListEvent {}

class TextChanged extends OffersListEvent {
  final String text;

  const TextChanged({required this.text});

  @override
  List<Object> get props => [text];
}
