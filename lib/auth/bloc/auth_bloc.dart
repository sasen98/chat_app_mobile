import 'package:bloc/bloc.dart';
import 'package:chat_app/auth/repo/auth_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthInitial()) {
    on<AuthLoginEvent>((event, emit) async {
      emit(state.copyWith(authStatus: AuthStatus.loading));
      final response = await AuthRepo().loginWithEmailAndPassword(
          email: event.email, password: event.password);
      emit(response.fold(
          (l) => state.copyWith(authStatus: AuthStatus.success, user: l),
          (r) => state.copyWith(authStatus: AuthStatus.failed)));
    });
    on<AuthSignInEvent>((event, emit) {});
  }
}
