class RegisterRepository {
  Future<void> register() async {
    // print('attempting register');
    await Future.delayed(const Duration(seconds: 3));
    // print('register in');
    throw Exception('register failed');
  }
}
