import 'package:bloc/bloc.dart';
import 'package:chat_app/auth/model/user_model.dart';
import 'package:chat_app/auth/repo/auth_repo.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
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
      if (response.isLeft()) {
        response.leftMap((l) async {
          /// l is Map? Map.of(l) :.....
          /// var map1 = Map.of(l);
          /// map1.containsKey/contains("token")? map1["token"]:"....."
          /// map["user_credentials"] as UserCredentials
          //String? token = await l.user?.getIdToken();
          UserModel? user = _mapDecoder(l: l);
          emit(state.copyWith(
            authStatus: AuthStatus.success,
            user: UserModel(
                name: user?.name,
                email: user?.email,
                uId: user?.uId,
                token: user?.token),
          ));
        });
      } else {
        response.fold((l) => {}, (r) {
          emit(state.copyWith(
              authStatus: AuthStatus.failed, message: r.message));
        });
      }
    });
    on<AuthSignUpEvent>((event, emit) async {
      emit(state.copyWith(authStatus: AuthStatus.loading));
      final response = await AuthRepo().signUpWithLoginAndPasswordFirebase(
          email: event.email, password: event.password);
      if (response.isLeft()) {
        response.leftMap((l) async {
          /// l is Map? Map.of(l) :.....
          /// var map1 = Map.of(l);
          /// map1.containsKey/contains("token")? map1["token"]:"....."
          /// map["user_credentials"] as UserCredentials
          //String? token = await l.user?.getIdToken();

          UserModel? user = _mapDecoder(l: l);
          emit(state.copyWith(
            authStatus: AuthStatus.success,
            user: UserModel(
                name: user?.name,
                email: user?.email,
                uId: user?.uId,
                token: user?.token),
          ));
        });
      } else {
        response.fold((l) => {}, (r) {
          emit(state.copyWith(
              authStatus: AuthStatus.failed, message: r.message));
        });
      }
    });
    on<AuthGoogleSignInEvent>((event, emit) async {
      emit(state.copyWith(authStatus: AuthStatus.loading));
      final response = await AuthRepo().googleSignin();
      if (response.isLeft()) {
        response.leftMap((l) async {
          /// l is Map? Map.of(l) :.....
          /// var map1 = Map.of(l);
          /// map1.containsKey/contains("token")? map1["token"]:"....."
          /// map["user_credentials"] as UserCredentials
          UserModel? user = _mapDecoder(l: l);
          emit(state.copyWith(
            authStatus: AuthStatus.success,
            user: UserModel(
                name: user?.name,
                email: user?.email,
                uId: user?.uId,
                token: user?.token),
          ));
        });
      } else {
        response.fold((l) => {}, (r) {
          emit(state.copyWith(
              authStatus: AuthStatus.failed, message: r.message));
        });
      }
    });
    on<AuthFacebookSignInEvent>(
      (event, emit) async {
        emit(state.copyWith(authStatus: AuthStatus.loading));
        final response = await AuthRepo().signInWithFacebook();
        if (response.isLeft()) {
          response.leftMap((l) async {
            UserModel? user = _mapDecoder(l: l);
            emit(state.copyWith(
              authStatus: AuthStatus.success,
              user: UserModel(
                  name: user?.name,
                  email: user?.email,
                  uId: user?.uId,
                  token: user?.token),
            ));
          });
        } else {
          response.fold((l) => {}, (r) {
            emit(state.copyWith(
                authStatus: AuthStatus.failed, message: r.message));
          });
        }
      },
    );
  }
  UserModel? _mapDecoder({required Map l}) {
    UserModel? userModel;
    String? token;
    UserCredential? userCredential;
    var map1 = Map.of(l);
    if (map1.containsKey('token')) {
      token = map1['token'];
    }
    if (map1.containsKey('user_credentials')) {
      userCredential = map1['user_credentials'];
    }

    if (token != null && userCredential != null) {
      userModel = UserModel(
          email: userCredential.user!.email,
          name: userCredential.user!.displayName,
          token: token,
          uId: userCredential.user!.uid);
    }
    return userModel;
  }
}
