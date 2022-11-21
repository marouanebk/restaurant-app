import 'package:restaurent_app/mainpage/domaine/Entities/restaurant.dart';
import 'package:restaurent_app/mainpage/domaine/Repository/restaurant_repository.dart';
import '../../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';

class GetRestaurantsUseCase {
  final BaseRestaurantRepository repository;

  GetRestaurantsUseCase(this.repository);

  Future<Either<Failure, List<Restaurant>?>> call() async {
    return await repository.getRestaurants();
  }
}
