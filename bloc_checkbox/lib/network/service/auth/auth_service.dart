import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final String host = "localhost";

  Future<User?> signUpWithEmail(
      {required String email, required String password}) async {
    final UserCredential user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return user.user;
  }

  Future<User?> signInWithEmail(
      {required String email, required String password}) async {
    // _callFirebaseEmulator();
    final UserCredential user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return user.user;
  }

  Future signOut() async {
    return await _auth.signOut();
  }

  void _callFirebaseEmulator() {
    _auth.useAuthEmulator(host, 8080);
  }
}
