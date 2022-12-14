import 'package:dartz/dartz.dart';
import 'package:restaurent_app/authentication/data/Models/user_model.dart';
import 'package:restaurent_app/authentication/domaine/Entities/user.dart';

import '../../../../core/error/failure.dart';

abstract class BaseUserRepository {
  Future<Either<Failure, Unit>> loginUser(User user);

  Future<Either<Failure, Unit>> createUser(User user);

  Future<Either<Failure, Unit>> logout();

  Future<Either<Failure, bool>> authenticationState();

  Future<Either<Failure , UserModel>> getUserDetails();

}
