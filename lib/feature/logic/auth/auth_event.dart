part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class LoginBtnPressed extends AuthEvent {
  final String email;
  final String password;

  LoginBtnPressed({required this.email, required this.password});
}


class LogoutEvent extends AuthEvent{
  
}