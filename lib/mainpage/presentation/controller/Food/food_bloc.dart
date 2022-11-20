import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurent_app/core/utils/enums.dart';
import 'package:restaurent_app/mainpage/domaine/Entities/food.dart';
import 'package:restaurent_app/mainpage/domaine/UseCases/get_new_arrivals_usecase.dart';
part 'food_event.dart';
part 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  final GetNewArrivalsUseCase getNewArrivalsUseCase;
  FoodBloc(this.getNewArrivalsUseCase) : super(const FoodState()) {
    on<GetNewArrivalsEvent>(_getNewArrivals);
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
}
