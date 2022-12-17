import 'package:bloc_example_app/src/app_strings.dart';
import 'package:bloc_example_app/views/auth/login/login_screen.dart';
import 'package:bloc_example_app/views/auth/register/register_screen.dart';
import 'package:flutter/material.dart';

class HaveAccountText extends StatelessWidget {
  const HaveAccountText({Key? key, required this.isLogin}) : super(key: key);

  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLogin ? () => _goToRegister(context) : () => _goToLogin(context),
      child: Text(isLogin ? AppStrings.haventAccount : AppStrings.haveAccount),
    );
  }

  void _goToRegister(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const RegisterScreen()),
        (route) => false);
  }

  void _goToLogin(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (route) => false);
  }
}
