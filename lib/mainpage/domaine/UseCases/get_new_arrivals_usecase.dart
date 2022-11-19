import 'package:restaurent_app/mainpage/domaine/Entities/food.dart';
import 'package:restaurent_app/mainpage/domaine/Repository/food_repository.dart';
import '../../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';

class GetNewArrivalsUseCase {
  final BaseFoodRepository repository;

  GetNewArrivalsUseCase(this.repository);

  Future<Either<Failure, List<Food>?>> call() async {
    return await repository.getNewArrivals();
  }
}
