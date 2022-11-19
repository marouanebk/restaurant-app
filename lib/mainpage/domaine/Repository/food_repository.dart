import 'package:dartz/dartz.dart';
import 'package:restaurent_app/authentication/domaine/Entities/user.dart';
import 'package:restaurent_app/mainpage/domaine/Entities/food.dart';
import '../../../../core/error/failure.dart';
abstract class BaseFoodRepository {
Future<Either<Failure, List<Food>?>> getNewArrivals();


}
