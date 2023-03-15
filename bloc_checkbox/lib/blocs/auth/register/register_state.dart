import 'package:bloc_example_app/blocs/bloc_status.dart';
import 'package:equatable/equatable.dart';

class RegisterState extends Equatable {
  final String email;
  bool get isValidEmail => email.length > 3;

  final String password;
  bool get isValidPassword => password.length > 6;

  final FormSubmissionStatus formStatus;

  const RegisterState({
    this.email = '',
    this.password = '',
    this.formStatus = const InitialFormStatus(),
  });

  RegisterState copyWith({
    String? email,
    String? password,
    FormSubmissionStatus? formStatus,
  }) {
    return RegisterState(
      email: email ?? this.email,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus,
    );
  }

  @override
  List<Object?> get props => [email, password, formStatus];
}
