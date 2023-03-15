import 'package:bloc_example_app/blocs/bloc_status.dart';
import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final String email;
  bool get isValidEmail => email.length > 3;

  final String password;
  bool get isValidPassword => password.length > 6;

  final AppSubmissionStatus appStatus;

  const LoginState({
    this.email = '',
    this.password = '',
    this.appStatus = const InitialStatus(),
  });

  LoginState copyWith({
    String? email,
    String? password,
    AppSubmissionStatus? appStatus,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      appStatus: appStatus ?? this.appStatus,
    );
  }

  @override
  List<Object?> get props => [email, password, appStatus];
}
