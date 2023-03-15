import 'package:bloc_example_app/blocs/home/home_event.dart';
import 'package:bloc_example_app/blocs/home/home_state.dart';
import 'package:bloc_example_app/repository/home/home_repository.dart';
import 'package:bloc_example_app/blocs/bloc_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository? homeRepo;

  HomeBloc({this.homeRepo}) : super(const HomeState()) {
    on<HomeEvent>((event, emit) async {
      await mapEventToState(event, emit);
    });
  }

  Future mapEventToState(HomeEvent event, Emitter<HomeState> emit) async {
    if (event is HomeGetCardData) {
      emit(state.copyWith(formStatus: FormSubmitting()));

      try {
        await homeRepo?.getCardData();
        emit(state.copyWith(formStatus: SubmissionSuccess()));
      } catch (e) {
        emit(state.copyWith(formStatus: SubmissionFailed(e)));
      }
    }
  }
}
