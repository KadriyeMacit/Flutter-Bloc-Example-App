part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  RegisterStatus? status;
  String? email;
  bool? isCheck;

  @override
  List<Object> get props => [];
}

class RegisterValueState extends RegisterState {
  final RegisterStatus status;
  final String email;
  final bool isCheck;

  RegisterValueState(this.status, this.email, this.isCheck) {
    if (isCheck) {
      isCheck = true;
    } else {
      isCheck = false;
    }
  }

  RegisterValueState copyWith(
      {RegisterStatus? status, String? email, bool? isCheck}) {
    return RegisterValueState(
      status ?? this.status,
      email ?? this.email,
      isCheck ?? this.isCheck,
    );
  }
}

enum RegisterStatus {
  startStatus,
  readyStatus,
  failedStatus,
  loadingStatus,
  successfulStatus,
  invalidEmailStatus,
  emptyCheckStatus,
}
