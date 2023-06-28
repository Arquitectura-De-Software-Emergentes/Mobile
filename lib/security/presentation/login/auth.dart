
abstract class BaseAuth {
  Future<String> currentUserId();
  Future<Persona> currentUser();
  Future<LoginResponse> signIn(String email, String password);
  Future<String> createUser(String email, String password);
  Future<void> signOut();
}

class AuthImplementation extends BaseAuth {
  @override
  Future<String> currentUserId() async {
    // Implementa el código para obtener el ID del usuario actual
    return "12345";
  }

  @override
  Future<Persona> currentUser() async {
    // Implementa el código para obtener el usuario actual
    final userId = await currentUserId();
    return Persona(userId);
  }

  @override
  Future<LoginResponse> signIn(String email, String password) async {
    // Implementa el código para iniciar sesión con email y contraseña
    // Retorna una instancia de LoginResponse con el resultado del inicio de sesión
    return LoginResponse(true, "Inicio de sesión exitoso");
  }

  @override
  Future<String> createUser(String email, String password) async {
    // Implementa el código para crear un nuevo usuario con email y contraseña
    // Retorna el ID del nuevo usuario creado
    return "new_user_id";
  }

  @override
  Future<void> signOut() async {
    // Implementa el código para cerrar sesión
    // No retorna ningún valor, ya que no se necesita para el BLoC
    return;
  }
}

class Persona {
  final String id;
  Persona(this.id);
}

class LoginResponse {
  final bool success;
  final String message;
  LoginResponse(this.success, this.message);
}

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
