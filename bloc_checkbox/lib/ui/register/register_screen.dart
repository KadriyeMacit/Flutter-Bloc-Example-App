import 'package:bloc_checkbox/blocs/register/register_bloc.dart';
import 'package:bloc_checkbox/ui/register/register_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text("register with Bloc"),
        elevation: 0,
        backgroundColor: Colors.pink,
      ),
      body: BlocProvider<RegisterBloc>(
        create: (context) {
          return RegisterBloc();
        },
        child: RegisterLayout(),
      ),
    );
  }
}
