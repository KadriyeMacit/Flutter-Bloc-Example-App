import 'package:bloc_checkbox/blocs/register/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    Key? key,
    required this.usernameController,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {},
      child: ElevatedButton(
        child: const Text("Register"),
        onPressed: () {
          context.read<RegisterBloc>().add(
                RegisterEmailChanged(emailController.text),
              );
          context.read<RegisterBloc>().add(const RegisterSendCode());
        },
      ),
    );
  }
}
