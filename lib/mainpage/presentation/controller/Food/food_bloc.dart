import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurent_app/core/utils/enums.dart';
import 'package:restaurent_app/mainpage/domaine/Entities/food.dart';
import 'package:restaurent_app/mainpage/domaine/Entities/restaurant.dart';
import 'package:restaurent_app/mainpage/domaine/Entities/restaurant_detail.dart';
import 'package:restaurent_app/mainpage/domaine/UseCases/get_new_arrivals_usecase.dart';
import 'package:restaurent_app/mainpage/domaine/UseCases/get_restaurant_detail.dart';
import 'package:restaurent_app/mainpage/domaine/UseCases/get_restaurants.dart';
part 'food_event.dart';
part 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  final GetNewArrivalsUseCase getNewArrivalsUseCase;
  final GetRestaurantsUseCase getRestaurantsUseCase;
  final GetRestaurantDetailUseCase getRestaurantDetailUseCase;
  FoodBloc(this.getNewArrivalsUseCase, this.getRestaurantsUseCase,
      this.getRestaurantDetailUseCase)
      : super(const FoodState()) {
    on<GetNewArrivalsEvent>(_getNewArrivals);
    on<GetRestaurantsEvent>(_getRestaurants);
    on<GetRestaurantDetailEvent>(_getRestaurantDetail);
    
  }

  FutureOr<void> _getNewArrivals(
      GetNewArrivalsEvent event, Emitter<FoodState> emit) async {
    final result = await getNewArrivalsUseCase();
    result.fold(
        (l) => emit(state.copyWith(
            getNewArrivalsState: RequestState.error,
            getNewArrivalsmessage: l.message)),
        (r) => emit(state.copyWith(
            getNewArrivals: r, getNewArrivalsState: RequestState.loaded)));
  }

  FutureOr<void> _getRestaurants(
      GetRestaurantsEvent event, Emitter<FoodState> emit) async {
    final result = await getRestaurantsUseCase();
    result.fold(
        (l) => emit(state.copyWith(
            getRestaurantsState: RequestState.error,
            getRestaurantsmessage: l.message)),
        (r) => emit(state.copyWith(
            getRestaurants: r, getRestaurantsState: RequestState.loaded)));
  }

   FutureOr<void> _getRestaurantDetail(
      GetRestaurantDetailEvent event, Emitter<FoodState> emit) async {
    final result = await getRestaurantDetailUseCase(event.id);
    result.fold(
        (l) => emit(state.copyWith(
            restaurantDetailState: RequestState.error,
            restaurantDetailMessage: l.message)),
        (r) => emit(state.copyWith(
            restaurantDetail: r, restaurantDetailState: RequestState.loaded)));
  }

  
}
