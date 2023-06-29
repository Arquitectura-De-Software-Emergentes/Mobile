import '../../../domain/entities/user.dart';

abstract class AuthenticationState {}

class InitialState extends AuthenticationState {}

class LoadingState extends AuthenticationState {}

class AuthenticatedState extends AuthenticationState {
  final User user;
  AuthenticatedState(this.user);
}

class UnauthenticatedState extends AuthenticationState {}
