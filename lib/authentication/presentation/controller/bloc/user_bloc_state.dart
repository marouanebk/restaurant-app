// part of 'user_bloc_bloc.dart';

// class UserBlocState extends Equatable {
//   final String topRatedMovies;
//   final RequestState topRatedState;
//   final String topRatedmessage;
//   const UserBlocState(
//       {this.topRatedMovies = "",
//       this.topRatedState = RequestState.loading,
//       this.topRatedmessage = ""});

//   UserBlocState copyWith({
//     String? topRatedMovies,
//     RequestState? topRatedState,
//     String? topRatedmessage,
//   }) {
//     return UserBlocState(
//       topRatedMovies: topRatedMovies ?? this.topRatedMovies,
//       topRatedState: topRatedState ?? this.topRatedState,
//       topRatedmessage: topRatedmessage ?? this.topRatedmessage,
//     );
//   }

//   @override
//   List<Object> get props => [];
// }

// class UserBlocInitial extends UserBlocState {}

import 'package:equatable/equatable.dart';

abstract class UserBlocState extends Equatable {
  const UserBlocState();

  @override
  List<Object> get props => [];
}

class UserBlocStateInitial extends UserBlocState {}

class LodingUserBlocState extends UserBlocState {}

class ErrorUserBlocState extends UserBlocState {
  final String message;

  const ErrorUserBlocState({required this.message});
  @override
  List<Object> get props => [message];
}

class MessageUserBlocState extends UserBlocState {
  final String message;

  const MessageUserBlocState({required this.message});
  @override
  List<Object> get props => [message];
}

class AuthenticatedState extends UserBlocState {}

class UnAuthenticatedState extends UserBlocState {}

class SignOut extends UserBlocState {}

