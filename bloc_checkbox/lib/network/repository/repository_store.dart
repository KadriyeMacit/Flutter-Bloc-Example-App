import 'package:bloc_example_app/network/repository/auth/auth_repository.dart';
import 'package:bloc_example_app/network/repository/home/home_repository.dart';
import 'package:bloc_example_app/network/service/auth/auth_service.dart';
import 'package:bloc_example_app/network/service/home/home_service.dart';

class RepositoryStore {
  static final AuthRepository authRepository =
      AuthRepository(service: AuthService());
  static final HomeRepository homeRepository =
      HomeRepository(service: HomeService());
}
