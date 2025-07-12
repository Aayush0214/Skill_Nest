import 'package:firebase_auth/firebase_auth.dart';
import 'package:skill_nest/core/exceptions/server_exception.dart';
import 'package:skill_nest/core/exceptions/firebase_exceptions.dart';

abstract interface class SplashRemoteDataSource {
  Stream<User?> userAuthStateChange();
}

class SplashRemoteDataSourceImpl implements SplashRemoteDataSource {
  final FirebaseAuth firebaseAuth;

  SplashRemoteDataSourceImpl({required this.firebaseAuth});

  @override
  Stream<User?> userAuthStateChange() async* {
    try {
      await for (final user in firebaseAuth.authStateChanges()) {
        if (user != null) {
          await user.reload();
          yield firebaseAuth.currentUser;
        } else {
          yield null;
        }
      }
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionHandler.fromCode(e.code);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}