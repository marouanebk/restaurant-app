import 'package:restaurent_app/mainpage/domaine/Entities/restaurant_detail.dart';
import 'package:restaurent_app/mainpage/domaine/Repository/restaurant_repository.dart';
import '../../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';

class GetRestaurantDetailUseCase {
  final BaseRestaurantRepository repository;

  GetRestaurantDetailUseCase(this.repository);

  Future<Either<Failure, RestaurantDetail>> call(id) async {
    return await repository.getRestaurantDetail(id);
  }
}
