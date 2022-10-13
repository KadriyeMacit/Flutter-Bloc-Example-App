import 'package:bloc_example_app/blocs/auth/login/login_bloc.dart';
import 'package:bloc_example_app/blocs/auth/login/login_state.dart';
import 'package:bloc_example_app/repository/auth/login/login_repository.dart';
import 'package:bloc_example_app/views/auth/form_submission_status.dart';
import 'package:bloc_example_app/views/auth/login/widgets/login_button.dart';
import 'package:bloc_example_app/views/auth/login/widgets/password_field.dart';
import 'package:bloc_example_app/views/auth/login/widgets/username_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  final dynamic _formKey = GlobalKey<FormState>();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            LoginBloc(authRepo: context.read<LoginRepository>()),
        child: BlocListener<LoginBloc, LoginState>(
          listenWhen: (previous, current) =>
              previous.formStatus != current.formStatus,
          listener: (context, state) {
            final formStatus = state.formStatus;

            if (formStatus is SubmissionFailed) {
              _showSnackBar(context, formStatus.exception.toString());
            }
          },
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
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
          ),
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
