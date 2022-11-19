part of 'food_bloc.dart';

class FoodState extends Equatable {
  final List<Food> getNewArrivals;
  final RequestState getNewArrivalsState;
  final String getNewArrivalsmessage;

  const FoodState(
      {this.getNewArrivals = const [],
      this.getNewArrivalsState = RequestState.loading,
      this.getNewArrivalsmessage = ""});

  FoodState copyWith({
    List<Food>? getNewArrivals,
    RequestState? getNewArrivalsState,
    String? getNewArrivalsmessage,
  }) {
    return FoodState(
      getNewArrivals: getNewArrivals ?? this.getNewArrivals,
      getNewArrivalsState: getNewArrivalsState ?? this.getNewArrivalsState,
      getNewArrivalsmessage:
          getNewArrivalsmessage ?? this.getNewArrivalsmessage,
    );
  }

  @override
  List<Object?> get props => [
        getNewArrivals,
        getNewArrivalsState,
        getNewArrivalsmessage,
      ];
}
