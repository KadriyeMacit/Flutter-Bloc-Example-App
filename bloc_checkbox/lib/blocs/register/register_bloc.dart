import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc()
      : super(RegisterValueState(RegisterStatus.startStatus, "", false)) {
    on<RegisterEvent>(_mapEventToState);
  }

  void _mapEventToState(
      RegisterEvent event, Emitter<RegisterState> emit) async {
    if (event is RegisterEmailChanged) {
      //emit(mapEmailChangedToState(event, state));
    } else if (event is RegisterCheckChanged) {
      // emit(mapCheckChangedToState(event, state));
    } else if (event is RegisterSendCode) {
      // emit(mapSendCodeToState(event, state));
    }
  }

  RegisterValueState mapCheckChangedToState(
      RegisterCheckChanged event, RegisterValueState state) {
    return state.copyWith(isCheck: event.isCheck);
  }

  RegisterValueState mapEmailChangedToState(
      RegisterEmailChanged event, RegisterValueState state) {
    return state.copyWith(
        email: event.email, status: RegisterStatus.startStatus);
  }

  RegisterValueState mapSendCodeToState(
      RegisterSendCode event, RegisterValueState state) {
    state.copyWith(status: RegisterStatus.loadingStatus);

    if (state.email.isValidEmail() && state.isCheck) {
      try {
        print("kkkkk");
        // _sendCodeRequest();
        return state.copyWith(status: RegisterStatus.successfulStatus);
      } on Exception catch (_) {
        return state.copyWith(status: RegisterStatus.failedStatus);
      }
    } else {
      if (!state.email.isValidEmail()) {
        return state.copyWith(status: RegisterStatus.invalidEmailStatus);
      } else if (!state.isCheck) {
        return state.copyWith(status: RegisterStatus.emptyCheckStatus);
      } else {
        return state.copyWith(status: RegisterStatus.startStatus);
      }
    }
  }

  Future _sendCodeRequest() async {}

  @override
  Future<void> close() {
    return super.close();
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
  }
}
