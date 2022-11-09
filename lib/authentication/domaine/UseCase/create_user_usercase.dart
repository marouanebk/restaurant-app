import 'package:restaurent_app/authentication/domaine/Entities/user.dart';
import 'package:restaurent_app/authentication/domaine/Repository/user_repository.dart';

import '../../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';

class CreateUserUseCase {
  final BaseUserRepository repository;

  CreateUserUseCase(this.repository);

  Future<Either<Failure, Unit>> call(User user) async {
    return await repository.createUser(user);
  }
}
