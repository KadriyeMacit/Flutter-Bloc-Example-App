import 'package:bloc_example_app/blocs/auth/login/login_bloc.dart';
import 'package:bloc_example_app/blocs/auth/register/register_bloc.dart';
import 'package:bloc_example_app/blocs/home/home_bloc.dart';
import 'package:bloc_example_app/firebase_options.dart';
import 'package:bloc_example_app/network/repository/repository_store.dart';
import 'package:bloc_example_app/src/app_colors.dart';
import 'package:bloc_example_app/views/welcome/welcome_screen.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseAppCheck.instance.activate(
    appleProvider: AppleProvider.debug,
    webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
    // Set androidProvider to `AndroidProvider.debug`
    androidProvider: AndroidProvider.debug,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
            create: (_) => LoginBloc(authRepo: RepositoryStore.authRepository)),
        BlocProvider<RegisterBloc>(
            create: (context) =>
                RegisterBloc(authRepo: RepositoryStore.authRepository)),
        BlocProvider<HomeBloc>(
            create: (context) =>
                HomeBloc(homeRepo: RepositoryStore.homeRepository)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.primaryColor,
          primarySwatch: AppColors.primarySwatch,
        ),
        home: const WelcomeScreen(),
      ),
    );
  }
}
