part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterEmailChanged extends RegisterEvent {
  final String email;
  const RegisterEmailChanged(this.email);

  @override
  List<Object> get props => [this.email];
}

class RegisterCheckChanged extends RegisterEvent {
  final bool isCheck;
  const RegisterCheckChanged(this.isCheck);

  @override
  List<Object> get props => [this.isCheck];
}

class RegisterSendCode extends RegisterEvent {
  const RegisterSendCode();
}
