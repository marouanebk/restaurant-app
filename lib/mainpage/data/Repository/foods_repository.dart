import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:restaurent_app/core/error/exceptions.dart';
import 'package:restaurent_app/core/error/failure.dart';
import 'package:restaurent_app/mainpage/data/DataSource/food_remote_datasource.dart';
import 'package:restaurent_app/mainpage/domaine/Entities/food.dart';
import 'package:restaurent_app/mainpage/domaine/Repository/food_repository.dart';

class FoodsRepository extends BaseFoodRepository {
  final BaseFoodRemoteDataSource baseFoodRemoteDataSource;

  FoodsRepository(this.baseFoodRemoteDataSource);

  @override
  Future<Either<Failure, List<Food>?>> getNewArrivals() async {
    final result = await baseFoodRemoteDataSource.getNewArrivals();
    try {
      return Right(result);
    }catch (failure) {
      return Left(ServerFailure(".statusMessage"));
    }
  }


}
