import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:restaurent_app/authentication/data/Models/user_model.dart';
import 'package:restaurent_app/authentication/data/dataSource/user_dataSource.dart';
import 'package:restaurent_app/authentication/domaine/Entities/user.dart';
import 'package:restaurent_app/authentication/domaine/Repository/user_repository.dart';
import '../../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';

typedef DeleteOrUpdateOrAddPost = Future<Unit> Function();

class UserRepository implements BaseUserRepository {
  final BaseUserRemoteDateSource baseUserRemoteDateSource;

  UserRepository(this.baseUserRemoteDateSource);

  @override
  Future<Either<Failure, Unit>> createUser(user) async {
    final UserModel userModel = UserModel(
        id: user.id,
        fullname: user.fullname,
        email: user.email,
        password: user.password);

    try {
      final result = await baseUserRemoteDateSource.createUser(userModel);

      return Right(result);
    } on FirebaseAuthException catch (failure) {
      log(failure.toString());
      return Left(ServerFailure(failure.message.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> loginUser(user) async {
    final UserModel userModel = UserModel(
      id: user.id,
      fullname: user.fullname,
      email: user.email,
      password: user.password,
    );

    try {
      final result = await baseUserRemoteDateSource.loginUser(userModel);

      return Right(result);
    } on FirebaseAuthException catch (failure) {
      log(failure.code.toString());
      return Left(ServerFailure(failure.code.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      final result = await baseUserRemoteDateSource.logOutUser();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

// [log] user-not-found