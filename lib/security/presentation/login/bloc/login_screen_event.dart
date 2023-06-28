class SignOutEvent extends AuthenticationEvent {}

abstract class AuthenticationEvent {}

class SignInEvent extends AuthenticationEvent {
  final String email;
  final String password;
  SignInEvent(this.email, this.password);
}

class CreateUserEvent extends AuthenticationEvent {
  final String email;
  final String password;
  CreateUserEvent(this.email, this.password);
}
