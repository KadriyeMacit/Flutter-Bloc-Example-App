import 'package:bloc_example_app/src/app_assets.dart';
import 'package:bloc_example_app/blocs/auth/login/login_bloc.dart';
import 'package:bloc_example_app/blocs/auth/login/login_state.dart';
import 'package:bloc_example_app/repository/auth/login/login_repository.dart';
import 'package:bloc_example_app/src/app_colors.dart';
import 'package:bloc_example_app/views/auth/form_submission_status.dart';
import 'package:bloc_example_app/views/auth/widgets/form_widget.dart';
import 'package:bloc_example_app/views/auth/widgets/have_account_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageColor,
      body: BlocProvider(
        create: (context) => LoginBloc(authRepo: LoginRepository()),
        child: BlocListener<LoginBloc, LoginState>(
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
                    Image.asset(AppAssets.yogaGirl),
                    FormWidget(isLogin: true),
                    const SizedBox(height: 10),
                    const HaveAccountText(isLogin: true),
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
