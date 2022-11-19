import 'dart:ffi';

import 'package:restaurent_app/authentication/domaine/Repository/user_repository.dart';
import '../../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';

class AuthenticationState {
  final BaseUserRepository repository;

  AuthenticationState(this.repository);

  Future<Either<Failure, bool>> call() async {
    return await repository.authenticationState();
  }
}
