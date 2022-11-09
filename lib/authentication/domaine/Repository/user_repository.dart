import 'package:dartz/dartz.dart';
import 'package:restaurent_app/authentication/domaine/Entities/user.dart';

import '../../../../core/error/failure.dart';

abstract class BaseUserRepository {

  Future<Either<Failure, Unit>> loginUser(User user);

  Future<Either<Failure, Unit>> createUser(User user);
}
