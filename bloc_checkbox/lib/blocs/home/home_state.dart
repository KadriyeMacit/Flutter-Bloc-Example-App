import 'package:bloc_example_app/blocs/bloc_status.dart';
import 'package:bloc_example_app/repository/home/model/home_card_model.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final HomeCardModel? homeCardModel;
  final AppSubmissionStatus appStatus;

  const HomeState({
    this.homeCardModel,
    this.appStatus = const InitialStatus(),
  });

  HomeState copyWith({
    HomeCardModel? homeCardModel,
    AppSubmissionStatus? appStatus,
  }) {
    return HomeState(
      homeCardModel: homeCardModel ?? this.homeCardModel,
      appStatus: appStatus ?? this.appStatus,
    );
  }

  @override
  List<Object?> get props => [homeCardModel, appStatus];
}
