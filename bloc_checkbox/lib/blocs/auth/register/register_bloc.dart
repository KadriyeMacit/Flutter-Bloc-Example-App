import 'package:bloc_example_app/blocs/auth/register/register_event.dart';
import 'package:bloc_example_app/blocs/auth/register/register_state.dart';
import 'package:bloc_example_app/repository/auth/register/register_repository.dart';
import 'package:bloc_example_app/views/auth/form_submission_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterRepository? authRepo;

  RegisterBloc({this.authRepo}) : super(const RegisterState()) {
    on<RegisterEvent>((event, emit) async {
      await mapEventToState(event, emit);
    });
  }

  Future mapEventToState(
      RegisterEvent event, Emitter<RegisterState> emit) async {
    // Email updated
    if (event is RegisterEmailChanged) {
      emit(state.copyWith(email: event.email));

      // Password updated
    } else if (event is RegisterPasswordChanged) {
      emit(state.copyWith(password: event.password));

      // Form submitted
    } else if (event is RegisterSubmitted) {
      emit(state.copyWith(formStatus: FormSubmitting()));

      try {
        await authRepo?.register();
        emit(state.copyWith(formStatus: SubmissionSuccess()));
      } catch (e) {
        emit(state.copyWith(formStatus: SubmissionFailed(e)));
      }
    }
  }
}
