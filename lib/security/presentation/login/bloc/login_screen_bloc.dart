import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../application/auth_service.dart';
import 'login_screen_event.dart';
import 'login_screen_state.dart';

class LoginScreenBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final BaseAuth authentication;

  LoginScreenBloc(this.authentication) : super(InitialState());

  Future<void> signIn(String email, String password) async {
    try {
      emit(LoadingState());
      final success = await authentication.signIn(email, password);
      if (success) {
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