import 'package:restaurent_app/mainpage/domaine/Entities/food.dart';

class FoodModel extends Food {
  const FoodModel({
    required super.id,
    required super.name,
    required super.restaurant,
    required super.picture,
  });

  // factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
  //       id: json["id"],
  //       name: json["name"],
  //       picture: json["backdrop_path"],
  //       restaurant: json["restaurant"],
  //     );

    factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
        id: json["id"],
        name: json["name"],
        picture: json["picture"],
        restaurant: json["restaurant"],
    );
  }

}
