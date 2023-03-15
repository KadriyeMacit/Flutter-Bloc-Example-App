import 'package:bloc_example_app/src/app_strings.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text(AppStrings.appBarText)),
        body: Column());
  }
}
