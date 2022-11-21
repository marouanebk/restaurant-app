import 'package:dartz/dartz.dart';
import 'package:restaurent_app/core/error/failure.dart';
import 'package:restaurent_app/mainpage/data/DataSource/restaurant_remote_datasource.dart';
import 'package:restaurent_app/mainpage/domaine/Entities/restaurant.dart';
import 'package:restaurent_app/mainpage/domaine/Entities/restaurant_detail.dart';
import 'package:restaurent_app/mainpage/domaine/Repository/restaurant_repository.dart';

class RestaurantRepository extends BaseRestaurantRepository {
  final BaseRestaurantRemoteDataSource baseRestaurantRemoteDataSource;

  RestaurantRepository(this.baseRestaurantRemoteDataSource);

  @override
  Future<Either<Failure, List<Restaurant>?>> getRestaurants() async {
    final result = await baseRestaurantRemoteDataSource.getRestaurants();
    try {
      return Right(result);
    } catch (failure) {
      return const Left(ServerFailure(".statusMessage"));
    }
  }

  @override
  Future<Either<Failure, RestaurantDetail>> getRestaurantDetail(id) async {
    final result = await baseRestaurantRemoteDataSource.getRestaurantDetail(id);
    try {
      return Right(result);
    } catch (failure) {
      return const Left(ServerFailure(".statusMessage"));
    }
  }
}
