import 'package:equatable/equatable.dart';

class Food extends Equatable {
  final String? id;
  final String name;
  final String restaurant;
  final String picture;

  const Food({
    this.id,
    required this.name,
    required this.restaurant,
    required this.picture,
  });

  @override
  List<Object?> get props => [id, name, restaurant, picture];
}
