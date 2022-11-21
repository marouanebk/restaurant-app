import 'package:equatable/equatable.dart';

class Restaurant extends Equatable {
  final String? id;
  final String name;
  final String location;
  final String picture;

  const Restaurant({
    this.id,
    required this.name,
    required this.location,
    required this.picture,
  });

  @override
  List<Object?> get props => [id, name, location, picture];
}
