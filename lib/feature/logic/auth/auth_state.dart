part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class AuthException extends AuthState {
  final String code;

  AuthException({required this.code});
}
class AuthSucess extends AuthState{
}

class LogoutState extends AuthState{}