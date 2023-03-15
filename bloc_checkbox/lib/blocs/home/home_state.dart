import 'package:bloc_example_app/blocs/bloc_status.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final FormSubmissionStatus formStatus;

  const HomeState({
    this.formStatus = const InitialFormStatus(),
  });

  HomeState copyWith({
    FormSubmissionStatus? formStatus,
  }) {
    return HomeState(
      formStatus: formStatus ?? this.formStatus,
    );
  }

  @override
  List<Object?> get props => [formStatus];
}
