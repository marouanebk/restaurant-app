import 'dart:async';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurent_app/authentication/data/Repository/user_repository_impl.dart';
import 'package:restaurent_app/authentication/data/dataSource/user_dataSource.dart';
import 'package:restaurent_app/authentication/domaine/Repository/user_repository.dart';
import 'package:restaurent_app/authentication/domaine/UseCase/create_user_usercase.dart';
import 'package:restaurent_app/authentication/domaine/UseCase/login_usercase.dart';
import 'package:restaurent_app/authentication/presentation/controller/bloc/user_bloc_event.dart';
import 'package:restaurent_app/authentication/presentation/controller/bloc/user_bloc_state.dart';
import 'package:restaurent_app/core/error/failure.dart';
import 'package:restaurent_app/core/string/failures.dart';
import 'package:restaurent_app/core/string/messages.dart';
import 'package:restaurent_app/core/utils/enums.dart';

class UserBloc extends Bloc<UserBlocEvent, UserBlocState> {
  final LoginUseCase loginUserCase;
  final CreateUserUseCase createUserUseCase;

      //   BaseUserRemoteDateSource baseUserRemoteDateSource =
      //     UserRemoteDataSource();
      // BaseUserRepository baseUserRepository =
      //     UserRepository(baseUserRemoteDateSource);

  UserBloc( this.loginUserCase,  this.createUserUseCase)
      : super(UserBlocStateInitial()) {
    on<UserBlocEvent>((event, emit) async {
      if (event is CreateUserEvent) {
        emit(LodingUserBlocState());
        log("before");
        final failuerOrDoneMessage = await createUserUseCase(event.user);
        log("in bloc");
        log(failuerOrDoneMessage.toString());

        emit(_eitherDoneMessageOrErrorState(
            either: failuerOrDoneMessage, message: ADD_SUCCESS_MESSAGE));
      } else if (event is LoginuserEvent) {
        emit(LodingUserBlocState());

        final failuerOrDoneMessage = await loginUserCase(event.user);

        emit(_eitherDoneMessageOrErrorState(
            either: failuerOrDoneMessage, message: UPDATE_SUCCESS_MESSAG));
      }
    });
  }
  // String _mapFailureToMessage(Failure failure) {
  //   switch (failure.runtimeType) {
  //     case ServerFailure:
  //       return "SOME BULLSHIT STUFF WORKING ";
  //     default:
  //       return "Unexpected Error, Please try again later.";
  //   }
  // }  
  String _mapFailureToMessage(Failure failure) {
        return  "SOME BULLSHIT STUFF WORKING ";
     
  }

  UserBlocState _eitherDoneMessageOrErrorState(
      {required Either<Failure, Unit> either, required String message}) {
    return either.fold(
        (failuer) => ErrorUserBlocState(message: _mapFailureToMessage(failuer)),
        (_) => const MessageUserBlocState(message: ADD_SUCCESS_MESSAGE));
  }
}


  //  s