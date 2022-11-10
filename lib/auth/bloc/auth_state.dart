part of 'auth_bloc.dart';

enum AuthStatus { initial, loading, success, failed }

class AuthState extends Equatable {
  const AuthState({
    required this.authStatus,
    required this.user,
  });
  final UserCredential? user;
  final AuthStatus authStatus;
  AuthState copyWith({UserCredential? user, AuthStatus? authStatus}) {
    return AuthState(
        user: user ?? this.user, authStatus: authStatus ?? this.authStatus);
  }

  @override
  List<Object?> get props => [
        user,
        authStatus,
      ];
}

class AuthInitial extends AuthState {
  const AuthInitial() : super(user: null, authStatus: AuthStatus.initial);
}
