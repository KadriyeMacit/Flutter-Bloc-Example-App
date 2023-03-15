import 'package:bloc_example_app/blocs/auth/Register/Register_bloc.dart';
import 'package:bloc_example_app/blocs/auth/register/register_state.dart';
import 'package:bloc_example_app/repository/auth/register/register_repository.dart';
import 'package:bloc_example_app/src/app_assets.dart';
import 'package:bloc_example_app/src/app_colors.dart';
import 'package:bloc_example_app/blocs/bloc_status.dart';
import 'package:bloc_example_app/views/auth/widgets/form_widget.dart';
import 'package:bloc_example_app/views/auth/widgets/have_account_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageColor,
      body: BlocProvider(
        create: (context) => RegisterBloc(authRepo: RegisterRepository()),
        child: BlocListener<RegisterBloc, RegisterState>(
          listenWhen: (previous, current) =>
              previous.formStatus != current.formStatus,
          listener: (context, state) {
            final formStatus = state.formStatus;

            if (formStatus is SubmissionFailed) {
              _showSnackBar(context, formStatus.exception.toString());
            }
          },
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(AppAssets.yoga),
                    FormWidget(isLogin: false),
                    const SizedBox(height: 10),
                    const HaveAccountText(isLogin: false),
                  ],
                ),
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
