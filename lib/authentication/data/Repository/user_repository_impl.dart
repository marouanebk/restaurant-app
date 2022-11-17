import 'package:restaurent_app/authentication/data/Models/user_model.dart';
import 'package:restaurent_app/authentication/data/dataSource/user_dataSource.dart';
import 'package:restaurent_app/authentication/domaine/Entities/user.dart';
import 'package:restaurent_app/authentication/domaine/Repository/user_repository.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';

typedef DeleteOrUpdateOrAddPost = Future<Unit> Function();

class UserRepository implements BaseUserRepository {
  final BaseUserRemoteDateSource baseUserRemoteDateSource;

  UserRepository(this.baseUserRemoteDateSource);

  @override
  Future<Either<Failure, Unit>> createUser(User user) async {
    final UserModel userModel = UserModel(
        id: user.id,
        fullname: user.fullname,
        email: user.email,
        password: user.password);

    final result = await baseUserRemoteDateSource.createUser(userModel);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
      // return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, Unit>> loginUser(User user) async {
    final UserModel userModel = UserModel(
        id: user.id,
        fullname: user.fullname,
        email: user.email,
        password: user.password);

    final result = await baseUserRemoteDateSource.createUser(userModel);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
