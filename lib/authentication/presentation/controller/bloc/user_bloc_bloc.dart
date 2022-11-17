import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurent_app/authentication/domaine/UseCase/create_user_usercase.dart';
import 'package:restaurent_app/authentication/domaine/UseCase/login_usercase.dart';
import 'package:restaurent_app/authentication/domaine/UseCase/logout_usecase.dart';
import 'package:restaurent_app/authentication/presentation/controller/bloc/user_bloc_event.dart';
import 'package:restaurent_app/authentication/presentation/controller/bloc/user_bloc_state.dart';
import 'package:restaurent_app/core/error/failure.dart';
import 'package:restaurent_app/core/string/messages.dart';

class UserBloc extends Bloc<UserBlocEvent, UserBlocState> {
  final LoginUseCase loginUserCase;
  final CreateUserUseCase createUserUseCase;
  final LogOutUseCase logOutUseCase;

  //   BaseUserRemoteDateSource baseUserRemoteDateSource =
  //     UserRemoteDataSource();
  // BaseUserRepository baseUserRepository =
  //     UserRepository(baseUserRemoteDateSource);

  UserBloc(this.loginUserCase, this.createUserUseCase, this.logOutUseCase)
      : super(UserBlocStateInitial()) {
    on<UserBlocEvent>((event, emit) async {
      if (event is CreateUserEvent) {
        emit(LodingUserBlocState());
        final failuerOrDoneMessage = await createUserUseCase(event.user);
        log(failuerOrDoneMessage.toString());
        emit(_eitherDoneMessageOrErrorState(
            result: failuerOrDoneMessage, message: ADD_SUCCESS_MESSAGE));
      } else if (event is LoginuserEvent) {
        emit(LodingUserBlocState());
        final failuerOrDoneMessage = await loginUserCase(event.user);
        emit(_eitherDoneMessageOrErrorState(
            result: failuerOrDoneMessage, message: UPDATE_SUCCESS_MESSAG));
      } else if (event is LogOutUserEvent) {
        emit(LodingUserBlocState());
        final failuerOrDoneMessage = await logOutUseCase();
        emit(_eitherDoneMessageOrErrorState(
            result: failuerOrDoneMessage, message: DC));
      }
    });
  }
  String _mapFailureToMessage(Failure failure) {
    switch (failure.message) {
      case "user-not-found":
        return "Invalid Creds";
      case "wrong-passord":
        return "Wrong Password";
      case "invalid-email":
        return "Invalid Email Adress";
      case "user-disabled":
        return "User Disables";
      case "email-already-in-use":
        return "Email Already In Use";
      case "operation-not-allowed":
        return "Error";
      case "weak-password":
        return "Weak Password";
    }
    return "Uknown Error ";
  }

  UserBlocState _eitherDoneMessageOrErrorState(
      {required Either<Failure, Unit> result, required String message}) {
    return result.fold(
        (l) => ErrorUserBlocState(message: _mapFailureToMessage(l)),
        (r) => const MessageUserBlocState(message: ADD_SUCCESS_MESSAGE));

    //     topRatedState: RequestState.error, topRatedmessage: l.message)),

    // (failuer) => ErrorUserBlocState(message: _mapFailureToMessage(failuer)),
    // (_) => const MessageUserBlocState(message: ADD_SUCCESS_MESSAGE));
  }
}

// result.fold(
//         (l) => emit(state.copyWith(
//             topRatedState: RequestState.error, topRatedmessage: l.message)),
//         (r) => emit(state.copyWith(
//             topRatedMovies: r, topRatedState: RequestState.loaded)));

//  s
