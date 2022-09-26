import 'package:bloc_checkbox/ui/register/widgets/check_terms_policy.dart';
import 'package:bloc_checkbox/ui/register/widgets/email_textfield.dart';
import 'package:bloc_checkbox/ui/register/widgets/register_button.dart';
import 'package:flutter/material.dart';

class RegisterLayout extends StatelessWidget {
  RegisterLayout({
    Key? key,
  }) : super(key: key);

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("", textAlign: TextAlign.center),
            const SizedBox(height: 15),
            CustomTextField(
              controller: _usernameController,
              hintText: "Username",
            ),
            const SizedBox(height: 15),
            CustomTextField(
              controller: _emailController,
              hintText: "E-mail",
            ),
            const SizedBox(height: 15),
            CustomTextField(
              controller: _passwordController,
              hintText: "Password",
            ),
            const SizedBox(height: 15),
            const CheckTermsPolicy(),
            const SizedBox(height: 20),
            RegisterButton(
              emailController: _emailController,
              usernameController: _usernameController,
              passwordController: _passwordController,
            ),
          ],
        ),
      ),
    );
  }
}
