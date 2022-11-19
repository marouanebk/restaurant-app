import 'package:equatable/equatable.dart';
import 'package:restaurent_app/authentication/domaine/Entities/user.dart';

abstract class UserBlocEvent extends Equatable {
  const UserBlocEvent();

  @override
  List<Object> get props => [];
}

class CreateUserEvent extends UserBlocEvent {
  final User user;

  const CreateUserEvent({required this.user});

  @override
  List<Object> get props => [user];
}

class LogOutUserEvent extends UserBlocEvent {
  const LogOutUserEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationEvent extends UserBlocEvent {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class UserDetailsEvent extends UserBlocEvent {
  const UserDetailsEvent();

  @override
  List<Object> get props => [];
}


class LoginuserEvent extends UserBlocEvent {
  final User user;

  const LoginuserEvent({required this.user});

  @override
  List<Object> get props => [user];
}
