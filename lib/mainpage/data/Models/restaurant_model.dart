import 'package:restaurent_app/mainpage/domaine/Entities/food.dart';
import 'package:restaurent_app/mainpage/domaine/Entities/restaurant.dart';

class RestaurantModel extends Restaurant {
  const RestaurantModel({
    required super.id,
    required super.name,
    required super.location,
    required super.picture,
  });

  // factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
  //       id: json["id"],
  //       name: json["name"],
  //       picture: json["backdrop_path"],
  //       restaurant: json["restaurant"],
  //     );

    factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
        id: json["id"],
        name: json["name"],
        picture: json["picture"],
        location: json["location"],
    );
  }

}
