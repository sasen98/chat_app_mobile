part of 'auth_bloc.dart';

enum AuthStatus { initial, loading, success, failed }

enum DataBaseStatus { initial, loading, success, failed }

class AuthState extends Equatable {
  const AuthState({
    required this.authStatus,
    required this.dataBaseStatus,
    required this.user,
    this.message,
  });
  final UserModel? user;
  final AuthStatus authStatus;
  final DataBaseStatus dataBaseStatus;
  final String? message;
  AuthState copyWith({
    UserModel? user,
    AuthStatus? authStatus,
    DataBaseStatus? dataBaseStatus,
    String? message,
  }) {
    return AuthState(
        user: user ?? this.user,
        authStatus: authStatus ?? this.authStatus,
        dataBaseStatus: dataBaseStatus ?? this.dataBaseStatus,
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
          dataBaseStatus: DataBaseStatus.initial,
        );
}
