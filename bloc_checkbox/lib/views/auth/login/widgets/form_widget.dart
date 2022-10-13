import 'package:bloc_example_app/views/auth/login/widgets/login_button.dart';
import 'package:bloc_example_app/views/auth/login/widgets/password_field.dart';
import 'package:bloc_example_app/views/auth/login/widgets/username_field.dart';
import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  FormWidget({Key? key}) : super(key: key);

  final dynamic _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            const UsernameField(),
            const PasswordField(),
            const SizedBox(
              height: 15,
            ),
            LoginButton(
              formKey: _formKey,
            ),
          ],
        ),
      ),
    );
  }
}
