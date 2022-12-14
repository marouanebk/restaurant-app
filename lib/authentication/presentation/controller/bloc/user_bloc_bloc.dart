import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurent_app/authentication/data/Models/user_model.dart';
import 'package:restaurent_app/authentication/domaine/UseCase/authentication_state_usecase.dart';
import 'package:restaurent_app/authentication/domaine/UseCase/create_user_usercase.dart';
import 'package:restaurent_app/authentication/domaine/UseCase/get_user_details_usercase.dart';
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
  final AuthenticationState authenticationState;
  final GetUserDetailsUseCase getUserDetailsUseCase;

  //   BaseUserRemoteDateSource baseUserRemoteDateSource =
  //     UserRemoteDataSource();
  // BaseUserRepository baseUserRepository =
  //     UserRepository(baseUserRemoteDateSource);

  UserBloc(this.loginUserCase, this.createUserUseCase, this.logOutUseCase,
      this.authenticationState, this.getUserDetailsUseCase)
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
        emit(_logOut(result: failuerOrDoneMessage, message: DC));
      } else if (event is AuthenticationEvent) {
        emit(LodingUserBlocState());
        final failuerOrDoneMessage = await authenticationState();
        emit(
          _authenticationState(
              result: failuerOrDoneMessage, message: statestuff),
        );
      } else if (event is UserDetailsEvent) {
        final failuerOrDoneMessage = await getUserDetailsUseCase();
        emit(
          _userDetails(result: failuerOrDoneMessage, message: statestuff),
        );
      }
    });
  }

  UserBlocState _eitherDoneMessageOrErrorState(
      {required Either<Failure, Unit> result, required String message}) {
    return result.fold(
        (l) => ErrorUserBlocState(message: _mapFailureToMessage(l)),
        (r) => const MessageUserBlocState(message: ADD_SUCCESS_MESSAGE));
  }

  UserBlocState _logOut(
      {required Either<Failure, Unit> result, required String message}) {
    return result.fold(
        (l) => ErrorUserBlocState(message: _mapFailureToMessage(l)),
        (r) => SignOut());
  }

  UserBlocState _userDetails(
      {required Either<Failure, UserModel> result, required String message}) {
    return result.fold(
        (l) => ErrorUserBlocState(message: _mapFailureToMessage(l)),
        (r) => UserDetailsState(fullname: r.fullname, email: r.email));
  }

  UserBlocState _authenticationState(
      {required Either<Failure, bool> result, required String message}) {
    return result.fold(
      (l) => const ErrorUserBlocState(
        message: 'uknown Error',
      ),
      (r) {
        UserBlocState temp = AuthenticatedState();
        if (r) {
          temp = AuthenticatedState();
        } else if (r == false) {
          temp = UnAuthenticatedState();
        }
        return temp;
      },
    );
  }
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
