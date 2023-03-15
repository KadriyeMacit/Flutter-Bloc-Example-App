class LoginRepository {
  Future login() async {
    await Future.delayed(const Duration(seconds: 3));

    // throw Exception('login failed');
  }
}
