import 'package:bloc/bloc.dart';
import 'package:chat_app/auth/model/user_model.dart';
import 'package:chat_app/auth/repo/auth_repo.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthInitial()) {
    on<StoreInDataBaseEvent>((event, emit) async {
      emit(state.copyWith(dataBaseStatus: DataBaseStatus.loading));
      final dbRespo =
          await AuthRepo().storeInDatabase(userModel: event.userModel);
      emit(
        dbRespo.fold(
          (l) => state.copyWith(dataBaseStatus: DataBaseStatus.success),
          (r) => state.copyWith(dataBaseStatus: DataBaseStatus.failed),
        ),
      );
    });
    on<AuthLoginEvent>((event, emit) async {
      emit(state.copyWith(authStatus: AuthStatus.loading));
      final response = await AuthRepo().loginWithEmailAndPassword(
          email: event.email, password: event.password);
      emit(response.fold(
          (l) => state.copyWith(
                authStatus: AuthStatus.success,
                user: UserModel(
                    name: l.user?.displayName,
                    email: l.user?.email,
                    uId: l.user?.uid,
                    token: l.credential?.token),
              ),
          (r) => state.copyWith(
              authStatus: AuthStatus.failed, message: r.message)));
    });
    on<AuthSignUpEvent>((event, emit) async {
      emit(state.copyWith(authStatus: AuthStatus.loading));
      final response = await AuthRepo().signUpWithLoginAndPasswordFirebase(
          email: event.email, password: event.password);
      emit(response.fold(
          (l) => state.copyWith(
                authStatus: AuthStatus.success,
                user: UserModel(
                    name: l.user?.displayName,
                    email: l.user?.email,
                    uId: l.user?.uid,
                    token: l.credential?.token),
              ),
          (r) => state.copyWith(
              authStatus: AuthStatus.failed, message: r.message)));
    });
    on<AuthGoogleSignInEvent>((event, emit) async {
      emit(state.copyWith(authStatus: AuthStatus.loading));
      final response = await AuthRepo().googleSignin();
      emit(response.fold(
          (l) => state.copyWith(
                authStatus: AuthStatus.success,
                user: UserModel(
                    name: l.user?.displayName,
                    email: l.user?.email,
                    uId: l.user?.uid,
                    token: l.credential?.token),
              ),
          (r) => state.copyWith(
              authStatus: AuthStatus.failed, message: r.message)));
    });
  }
}
