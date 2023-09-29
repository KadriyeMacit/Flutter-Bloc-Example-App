import 'package:bloc_example_app/network/service/auth/auth_service.dart';

class AuthRepository {
  AuthRepository({required this.service});
  final AuthService service;

  Future signUpWithEmail({required String email, required String password}) {
    return service.signUpWithEmail(email: email, password: password);
  }

  Future signInWithEmail({required String email, required String password}) {
    return service.signInWithEmail(email: email, password: password);
  }

  Future signOut() {
    return service.signOut();
  }
}
