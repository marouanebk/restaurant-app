import 'package:dartz/dartz.dart';
import 'package:restaurent_app/mainpage/domaine/Entities/restaurant.dart';
import 'package:restaurent_app/mainpage/domaine/Entities/restaurant_detail.dart';
import '../../../../core/error/failure.dart';
abstract class BaseRestaurantRepository {
Future<Either<Failure, List<Restaurant>?>> getRestaurants();
Future<Either<Failure, RestaurantDetail>> getRestaurantDetail(id);


}
