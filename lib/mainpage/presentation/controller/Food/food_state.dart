part of 'food_bloc.dart';

class FoodState extends Equatable {
  final List<Food> getNewArrivals;
  final RequestState getNewArrivalsState;
  final String getNewArrivalsmessage;
  //
  final List<Restaurant> getRestaurants;
  final RequestState getRestaurantsState;
  final String getRestaurantsmessage;
  //
  final RestaurantDetail? restaurantDetail;
  final RequestState restaurantDetailState;
  final String restaurantDetailMessage;
  const FoodState({
    this.getNewArrivals = const [],
    this.getNewArrivalsState = RequestState.loading,
    this.getNewArrivalsmessage = "",
    //
    this.getRestaurants = const [],
    this.getRestaurantsState = RequestState.loading,
    this.getRestaurantsmessage = "",
    //
    this.restaurantDetail,
    this.restaurantDetailState = RequestState.loading,
    this.restaurantDetailMessage = "",
  });

  FoodState copyWith({
    List<Food>? getNewArrivals,
    RequestState? getNewArrivalsState,
    String? getNewArrivalsmessage,
    //
    List<Restaurant>? getRestaurants,
    RequestState? getRestaurantsState,
    String? getRestaurantsmessage,
    //
    RestaurantDetail? restaurantDetail,
    RequestState? restaurantDetailState,
    String? restaurantDetailMessage,
  }) {
    return FoodState(
        getNewArrivals: getNewArrivals ?? this.getNewArrivals,
        getNewArrivalsState: getNewArrivalsState ?? this.getNewArrivalsState,
        getNewArrivalsmessage:
            getNewArrivalsmessage ?? this.getNewArrivalsmessage,
        //
        getRestaurants: getRestaurants ?? this.getRestaurants,
        getRestaurantsState: getRestaurantsState ?? this.getRestaurantsState,
        getRestaurantsmessage:
            getRestaurantsmessage ?? this.getRestaurantsmessage,
        //
        restaurantDetail: restaurantDetail ?? this.restaurantDetail,
        restaurantDetailState:
            restaurantDetailState ?? this.restaurantDetailState,
        restaurantDetailMessage:
            restaurantDetailMessage ?? this.restaurantDetailMessage);
    //
  }

  @override
  List<Object?> get props => [
        getNewArrivals,
        getNewArrivalsState,
        getNewArrivalsmessage,
        //
        getRestaurants,
        getRestaurantsState,
        getRestaurantsmessage,
        //
        restaurantDetail,
        restaurantDetailState,
        restaurantDetailMessage,
      ];
}
