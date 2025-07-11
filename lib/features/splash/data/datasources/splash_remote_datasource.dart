import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract interface class SplashRemoteDataSource {
  Stream<User?> userAuthStateChange();
  Future<User?> getCurrentUser();
}

class SplashRemoteDataSourceImpl implements SplashRemoteDataSource {
  final FirebaseAuth firebaseAuth;

  SplashRemoteDataSourceImpl({required this.firebaseAuth});

  @override
  Stream<User?> userAuthStateChange() async* {
    await for (final user in firebaseAuth.authStateChanges()) {
      if (user != null) {
        try {
          await user.reload(); // 🛡️ try to reload
          yield firebaseAuth.currentUser;
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            // 🔄 Sign out the user locally since they were deleted on server
            await firebaseAuth.signOut();
            yield null;
          } else {
            rethrow; // propagate other exceptions
          }
        }
      } else {
        yield null;
      }
    }
  }


  @override
  Future<User?> getCurrentUser() async {
    return firebaseAuth.currentUser;
  }

}