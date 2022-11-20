import 'package:restaurent_app/authentication/domaine/Repository/user_repository.dart';

import '../../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';

class LogOutUseCase {
  final BaseUserRepository repository;

  LogOutUseCase(this.repository);

  Future<Either<Failure, Unit>> call() async {
    return await repository.logout();
  }
}
