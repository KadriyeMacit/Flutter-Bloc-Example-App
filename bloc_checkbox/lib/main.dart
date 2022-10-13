import 'package:bloc_example_app/repository/auth/login/login_repository.dart';
import 'package:bloc_example_app/views/auth/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RepositoryProvider(
        create: (context) => LoginRepository(),
        child: LoginScreen(),
      ),
    );
  }
}
