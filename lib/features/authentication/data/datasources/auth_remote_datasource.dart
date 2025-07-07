import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:skill_nest/core/exceptions/firebase_exceptions.dart';
import 'package:skill_nest/features/authentication/data/model/user_model.dart';

abstract interface class AuthRemoteDataSource {
  Stream<User?> get authStateChanges;

  Future<UserModel> loginWithEmailPassword(String email, String password);

  Future<UserModel> signUpWithEmailPassword(String email, String password);

  Future<UserModel> signInWithGoogle();

  Future<void> sendEmailVerification();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;

  AuthRemoteDataSourceImpl({
    required this.firebaseAuth,
    required this.googleSignIn,
  });

  @override
  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();

  @override
  Future<UserModel> loginWithEmailPassword(String email, String password) async {
    try {
      final res = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      if (res.user != null) {
        return UserModel.fromFirebase(res.user!);
      } else {
        throw Exception('No user found');
      }
    } catch (e) {
      throw FirebaseExceptionHandler.handleException(e);
    }
  }

  @override
  Future<UserModel> signUpWithEmailPassword(String email, String password) async {
    try {
      final res = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      if (res.user != null) {
        return UserModel.fromFirebase(res.user!);
      } else {
        throw Exception('SignUp Failed');
      }
    } catch (e) {
      throw FirebaseExceptionHandler.handleException(e);
    }
  }

  @override
  Future<UserModel> signInWithGoogle() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser != null) {
        final googleAuth = await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        final userCredential = await firebaseAuth.signInWithCredential(credential);
        if (userCredential.user != null) {
          return UserModel.fromFirebase(userCredential.user!);
        } else {
          throw Exception('Something went wrong try another method');
        }
      } else {
        throw Exception('Something went wrong try another method');
      }
    } catch (e) {
      throw FirebaseExceptionHandler.handleException(e);
    }
  }

  @override
  Future<void> sendEmailVerification() async {
    try {
      await firebaseAuth.currentUser?.sendEmailVerification();
    } catch (e) {
      throw FirebaseExceptionHandler.handleException(e);
    }
  }
}
