import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:travelgo_admin/core/service/auth_services.dart';
import 'package:travelgo_admin/core/service/auth_error_code.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginBtnPressed>(loginBtnPressed);
    on<LogoutEvent>(logoutEvent);
  }

  FutureOr<void> loginBtnPressed(
    LoginBtnPressed event,
    Emitter<AuthState> emit,
  ) async {
    log(event.email);
    log(event.password);
    final authservice = AuthServices();
    try {
      await authservice.signinWithEmailAndPassword(event.email, event.password);
      log(authservice.getUserCredential()!.uid.toString());
      emit(AuthSucess());
    } on AuthException catch (e) {
      log(e.code);
      String message = getErrorMessage(e.code.toString());
      log(message);
      emit(AuthException(code: message));
    }
  }

  FutureOr<void> logoutEvent(LogoutEvent event, Emitter<AuthState> emit) {
    final auth = AuthServices();
    auth.signOut();
    emit(LogoutState());
  }
}
