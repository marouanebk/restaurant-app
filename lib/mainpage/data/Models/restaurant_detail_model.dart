import 'package:restaurent_app/mainpage/domaine/Entities/restaurant_detail.dart';

class RestaurantDetailModel extends RestaurantDetail {
  const RestaurantDetailModel({
    required super.id,
    required super.name,
    required super.location,
    required super.bgpicture,
    required super.opTime,
    required super.clTime,
  });

  factory RestaurantDetailModel.fromJson(Map<String, dynamic> json) {
    return RestaurantDetailModel(
      id: json["id"],
      name: json["name"],
      bgpicture: json["bgpicture"],
      location: json["location"],
      opTime: json["opTime"],
      clTime: json["clTime"],
    );
  }
}
