import 'package:equatable/equatable.dart';

class RestaurantDetail extends Equatable {
  final String? id;
  final String name;
  final String location;
  final String bgpicture;
  final int opTime;
  final int clTime;

  const RestaurantDetail({
    this.id,
    required this.name,
    required this.location,
    required this.bgpicture,
    required this.opTime,
    required this.clTime,
  });

  @override
  List<Object?> get props => [id, name, location, bgpicture, opTime, clTime];
}
