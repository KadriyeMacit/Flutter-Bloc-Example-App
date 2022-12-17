import 'package:bloc_example_app/blocs/auth/register/register_bloc.dart';
import 'package:bloc_example_app/blocs/auth/register/register_event.dart';
import 'package:bloc_example_app/blocs/auth/register/register_state.dart';
import 'package:bloc_example_app/src/app_strings.dart';
import 'package:bloc_example_app/blocs/auth/login/login_bloc.dart';
import 'package:bloc_example_app/blocs/auth/login/login_event.dart';
import 'package:bloc_example_app/blocs/auth/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({Key? key, required this.isLogin}) : super(key: key);

  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return isLogin
        ? BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  icon: Icon(Icons.key),
                  hintText: AppStrings.password,
                ),
                validator: (value) => state.isValidPassword
                    ? null
                    : AppStrings.isValidPasswordMessage,
                onChanged: (value) => context.read<LoginBloc>().add(
                      LoginPasswordChanged(password: value),
                    ),
              );
            },
          )
        : BlocBuilder<RegisterBloc, RegisterState>(
            builder: (context, state) {
              return TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  icon: Icon(Icons.key),
                  hintText: AppStrings.password,
                ),
                validator: (value) => state.isValidPassword
                    ? null
                    : AppStrings.isValidPasswordMessage,
                onChanged: (value) => context.read<RegisterBloc>().add(
                      RegisterPasswordChanged(password: value),
                    ),
              );
            },
          );
  }
}
