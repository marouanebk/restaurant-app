part of 'food_bloc.dart';

abstract class FoodEvent extends Equatable {
  const FoodEvent();

  @override
  List<Object> get props => [];
}

class GetNewArrivalsEvent extends FoodEvent {}

class GetRestaurantsEvent extends FoodEvent {}

class GetRestaurantDetailEvent extends FoodEvent {
  final String id;

  const GetRestaurantDetailEvent(this.id);

  @override
  List<Object> get props => [id];
}
