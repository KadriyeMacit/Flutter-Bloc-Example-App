import 'package:bloc_example_app/src/app_strings.dart';
import 'package:bloc_example_app/blocs/auth/login/login_bloc.dart';
import 'package:bloc_example_app/blocs/auth/login/login_event.dart';
import 'package:bloc_example_app/blocs/auth/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsernameField extends StatelessWidget {
  const UsernameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          decoration: const InputDecoration(
            icon: Icon(Icons.person),
            hintText: AppStrings.username,
          ),
          validator: (value) =>
              state.isValidUsername ? null : AppStrings.isValidUsernameMessage,
          onChanged: (value) => context.read<LoginBloc>().add(
                LoginUsernameChanged(username: value),
              ),
        );
      },
    );
  }
}
