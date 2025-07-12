import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:skill_nest/core/exceptions/server_exception.dart';
import 'package:skill_nest/core/exceptions/firebase_exceptions.dart';
import 'package:skill_nest/features/authentication/data/model/user_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserModel> loginWithEmailPassword(String email, String password);

  Future<UserModel> signUpWithEmailPassword(String username, String email, String password);

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
  Future<UserModel> loginWithEmailPassword(String email, String password) async {
    try {
      final res = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      if (res.user != null) {
        return UserModel.fromFirebase(res.user!).copyWith(
          isEmailVerified: res.user?.emailVerified,
        );
      } else {
        throw Exception('No user found');
      }
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionHandler.fromCode(e.code);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel> signUpWithEmailPassword(String username, String email, String password) async {
    try {
      final res = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      if (res.user != null) {
        await res.user?.updateDisplayName(username);
        await res.user?.reload(); // Refresh local data

        final updatedUser = firebaseAuth.currentUser;
        return UserModel.fromFirebase(updatedUser!);
      } else {
        throw ServerException('SignUp Failed');
      }
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionHandler.fromCode(e.code);
    } catch (e) {
      throw ServerException(e.toString());
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
          throw ServerException('Something went wrong try another method');
        }
      } else {
        throw ServerException('Something went wrong try another method');
      }
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionHandler.fromCode(e.code);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> sendEmailVerification() async {
    try {
      if (firebaseAuth.currentUser != null) {
        await firebaseAuth.currentUser?.sendEmailVerification();
      } else {
        throw ServerException('No user signed in.');
      }
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionHandler.fromCode(e.code);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
