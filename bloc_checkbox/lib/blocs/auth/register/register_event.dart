import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {}

class RegisterEmailChanged extends RegisterEvent {
  RegisterEmailChanged({this.email});
  final String? email;

  @override
  List<Object?> get props => [email];
}

class RegisterPasswordChanged extends RegisterEvent {
  RegisterPasswordChanged({this.password});
  final String? password;

  @override
  List<Object?> get props => [password];
}

class RegisterSubmitted extends RegisterEvent {
  @override
  List<Object?> get props => [];
}
