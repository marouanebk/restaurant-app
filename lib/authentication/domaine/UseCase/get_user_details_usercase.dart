import 'package:restaurent_app/authentication/data/Models/user_model.dart';
import 'package:restaurent_app/authentication/domaine/Repository/user_repository.dart';
import '../../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';

class GetUserDetailsUseCase {
  final BaseUserRepository repository;

  GetUserDetailsUseCase(this.repository);

  Future<Either<Failure, UserModel>> call() async {
    return await repository.getUserDetails();
  }
}
