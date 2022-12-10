import 'package:chat_app/auth/model/user_model.dart';
import 'package:chat_app/repo_response/repo_response.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepo {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get getCurrentUser => _firebaseAuth.currentUser;

  /// object [fireStoreUser] : refers to user in firebase firestore
  CollectionReference fireStoreUser =
      FirebaseFirestore.instance.collection('users');

//Either<dynamic, Failure>
  Future<Either<dynamic, Failure>> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final response = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      String? token;
      if (response.user != null) {
        token = await response.user?.getIdToken();
      }
      return left({"token": token, "user_credentials": response});
      //return left(response);
    } on FirebaseAuthException catch (e) {
      return right(Failure(message: e.toString()));
    } catch (e) {
      return right(Failure(message: e.toString()));
    }
  }

  Future<Either<dynamic, Failure>> signUpWithLoginAndPasswordFirebase(
      {required String email, required String password}) async {
    try {
      final response = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      String? token;
      if (response.user != null) {
        token = await response.user?.getIdToken();
      }
      return left({"token": token, "user_credentials": response});
    } on FirebaseAuthException catch (e) {
      return right(Failure(message: e.toString()));
    } catch (e) {
      return right(Failure(message: e.toString()));
    }
  }

  Future<Either<UserModel, Failure>> storeInDatabase(
      {required UserModel userModel}) async {
    try {
      FirebaseFirestore.instance.collection('users').doc(userModel.uId).set({
        'id': userModel.uId,
        'first_name': userModel.name,
        'email': userModel.email,
      });
      return left(userModel);
    } on FirebaseAuthException catch (e) {
      return right(Failure(message: e.toString()));
    } catch (e) {
      return right(Failure(message: e.toString()));
    }
  }

  Future<void> signOut() async {
    await googleSignIn.disconnect();
    await _firebaseAuth.signOut();
  }

// google signin
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;
  Future<Either<dynamic, Failure>> googleSignin() async {
    final googleAcc = await googleSignIn.signIn();
    if (googleAcc == null) {}
    _user = googleAcc;
    final googleAuth = await googleAcc!.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    try {
      final response =
          await FirebaseAuth.instance.signInWithCredential(credential);

      String? token;
      if (response.user != null) {
        token = await response.user?.getIdToken();
      }
      return left({"token": token, "user_credentials": response});
    } catch (e) {
      return right(Failure(message: e.toString()));
    }
  }
}
