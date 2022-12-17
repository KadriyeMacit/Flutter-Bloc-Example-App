import 'package:bloc_example_app/src/app_strings.dart';
import 'package:bloc_example_app/views/auth/login/login_screen.dart';
import 'package:bloc_example_app/views/auth/register/register_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () => _goToLogin(context),
            child: const Text(AppStrings.login),
          ),
          ElevatedButton(
            onPressed: () => _goToRegister(context),
            child: const Text(AppStrings.register),
          ),
        ],
      ),
    ));
  }

  void _goToRegister(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegisterScreen()),
    );
  }

  void _goToLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }
}
