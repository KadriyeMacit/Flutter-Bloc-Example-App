class LoginRepository {
  Future<void> login() async {
    // print('attempting login');
    await Future.delayed(const Duration(seconds: 3));
    // print('logged in');
    throw Exception('login failed');
  }
}
