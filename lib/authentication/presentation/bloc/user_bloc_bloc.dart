import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurent_app/authentication/domaine/UseCase/create_user_usercase.dart';
import 'package:restaurent_app/authentication/domaine/UseCase/login_usercase.dart';
import 'package:restaurent_app/authentication/presentation/bloc/user_bloc_event.dart';
import 'package:restaurent_app/authentication/presentation/bloc/user_bloc_state.dart';
import 'package:restaurent_app/core/error/failure.dart';
import 'package:restaurent_app/core/string/failures.dart';
import 'package:restaurent_app/core/string/messages.dart';
import 'package:restaurent_app/core/utils/enums.dart';

class UserBlocBloc extends Bloc<UserBlocEvent, UserBlocState> {
  final LoginUseCase LoginUserCase;
  final CreateUserUseCase CreaseUserUseCase;

  UserBlocBloc({required this.LoginUserCase, required this.CreaseUserUseCase})
      : super(UserBlocStateInitial()) {
    on<UserBlocEvent>((event, emit) async {
      if (event is CreateUserEvent) {
        emit(LodingUserBlocState());
        final failuerOrDoneMessage = await LoginUserCase(event.user);

        emit(_eitherDoneMessageOrErrorState(
            either: failuerOrDoneMessage, message: ADD_SUCCESS_MESSAGE));
      } else if (event is LoginuserEvent) {
        emit(LodingUserBlocState());

        final failuerOrDoneMessage = await LoginUserCase(event.user);

        emit(_eitherDoneMessageOrErrorState(
            either: failuerOrDoneMessage, message: UPDATE_SUCCESS_MESSAG));
      }
    });
  }
  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILUERE_MESSAGE;
      default:
        return "Unexpected Error, Please try again later.";
    }
  }

  UserBlocState _eitherDoneMessageOrErrorState(
      {required Either<Failure, Unit> either, required String message}) {
    return either.fold(
        (failuer) => ErrorUserBlocState(message: _mapFailureToMessage(failuer)),
        (_) => const MessageUserBlocState(message: ADD_SUCCESS_MESSAGE));
  }
}
