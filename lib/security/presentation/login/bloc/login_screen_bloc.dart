import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../auth.dart';

class LoginScreenBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final BaseAuth authentication;

  LoginScreenBloc(this.authentication) : super(InitialState());

  Future<void> signIn(String email, String password) async {
    try {
      emit(LoadingState());
      final response = await authentication.signIn(email, password);
      if (response.success) {
        final user = await authentication.currentUser();
        emit(AuthenticatedState(user));
      } else {
        emit(UnauthenticatedState());
      }
    } catch (error) {
      // emit(ErrorState(error.toString()));
    }
  }
}

class SignOutEvent extends AuthenticationEvent {}

abstract class AuthenticationState {}

class InitialState extends AuthenticationState {}

class LoadingState extends AuthenticationState {}

class AuthenticatedState extends AuthenticationState {
  final Persona user;
  AuthenticatedState(this.user);
}
class UnauthenticatedState extends AuthenticationState {}
