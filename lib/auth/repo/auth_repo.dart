import 'package:chat_app/repo_response/repo_response.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepo {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get getCurrentUser => _firebaseAuth.currentUser;

  Future<Either<UserCredential, Failure>> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    final response = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    try {
      return left(
        response,
      );
    } catch (e) {
      return right(Failure(message: e.toString()));
    }
  }

  Future<Either<UserCredential, Failure>> signUpWithLoginAndPassword(
      {required String email, required String password}) async {
    final response = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    try {
      return left(response);
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
  Future<Either<UserCredential, Failure>> googleSignin() async {
    final googleAcc = await googleSignIn.signIn();
    if (googleAcc == null) {}
    _user = googleAcc;
    final googleAuth = await googleAcc!.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    final response =
        await FirebaseAuth.instance.signInWithCredential(credential);
    try {
      return left(response);
    } catch (e) {
      return right(Failure(message: e.toString()));
    }
  }
}
