part of 'auth_bloc.dart';

enum AuthStatus { initial, loading, success, failed }

class AuthState extends Equatable {
  const AuthState({
    required this.authStatus,
    required this.user,
    this.message,
  });
  final UserCredential? user;
  final AuthStatus authStatus;
  final String? message;
  AuthState copyWith(
      {UserCredential? user, AuthStatus? authStatus, String? message}) {
    return AuthState(
        user: user ?? this.user,
        authStatus: authStatus ?? this.authStatus,
        message: message ?? this.message);
  }

  @override
  List<Object?> get props => [
        user,
        authStatus,
        message,
      ];
}

class AuthInitial extends AuthState {
  const AuthInitial()
      : super(
          user: null,
          authStatus: AuthStatus.initial,
        );
}
