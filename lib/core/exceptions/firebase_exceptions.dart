import 'package:firebase_core/firebase_core.dart';

class FirebaseAuthExceptionHandler implements Exception {
  final String code;
  final String message;

  FirebaseAuthExceptionHandler(this.code, [this.message = '']);

  factory FirebaseAuthExceptionHandler.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return FirebaseAuthExceptionHandler(code, 'The email address is badly formatted.');
      case 'user-disabled':
        return FirebaseAuthExceptionHandler(code, 'This user has been disabled.');
      case 'user-not-found':
        return FirebaseAuthExceptionHandler(code, 'No user found with this email.');
      case 'wrong-password':
        return FirebaseAuthExceptionHandler(code, 'Wrong password provided.');
      case 'email-already-in-use':
        return FirebaseAuthExceptionHandler(code, 'Email already in use.');
      case 'operation-not-allowed':
        return FirebaseAuthExceptionHandler(code, 'Email/password accounts are not enabled.');
      case 'weak-password':
        return FirebaseAuthExceptionHandler(code, 'Password is too weak.');
      case 'requires-recent-login':
        return FirebaseAuthExceptionHandler(code, 'Requires recent authentication.');
      case 'too-many-requests':
        return FirebaseAuthExceptionHandler(code, 'Too many requests. Try again later.');
      case 'account-exists-with-different-credential':
        return FirebaseAuthExceptionHandler(code, 'Account exists with different credentials.');
      case 'invalid-credential':
        return FirebaseAuthExceptionHandler(code, 'Invalid credential.');
      case 'invalid-verification-code':
        return FirebaseAuthExceptionHandler(code, 'Invalid verification code.');
      case 'invalid-verification-id':
        return FirebaseAuthExceptionHandler(code, 'Invalid verification ID.');
      case 'session-cookie-expired':
        return FirebaseAuthExceptionHandler(code, 'Firebase session cookie expired.');
      case 'uid-already-exists':
        return FirebaseAuthExceptionHandler(code, 'UID already exists.');
      case 'invalid-phone-number':
        return FirebaseAuthExceptionHandler(code, 'Invalid phone number.');
      case 'missing-phone-number':
        return FirebaseAuthExceptionHandler(code, 'Missing phone number.');
      case 'credential-already-in-use':
        return FirebaseAuthExceptionHandler(code, 'Credential already in use.');
      case 'provider-already-linked':
        return FirebaseAuthExceptionHandler(code, 'Provider already linked.');
      case 'app-not-authorized':
        return FirebaseAuthExceptionHandler(code, 'App not authorized.');
      case 'expired-action-code':
        return FirebaseAuthExceptionHandler(code, 'Expired action code.');
      case 'invalid-action-code':
        return FirebaseAuthExceptionHandler(code, 'Invalid action code.');
      case 'missing-action-code':
        return FirebaseAuthExceptionHandler(code, 'Missing action code.');
      case 'unauthorized-domain':
        return FirebaseAuthExceptionHandler(code, 'Unauthorized domain.');
      case 'network-request-failed':
        return FirebaseAuthExceptionHandler(code, 'Network error occurred.');
      default:
        return FirebaseAuthExceptionHandler(code, 'Unknown Firebase authentication error.');
    }
  }

  @override
  String toString() => 'FirebaseAuthException($code): $message';
}

class FirebaseFirestoreExceptionHandler implements Exception {
  final String code;
  final String message;

  FirebaseFirestoreExceptionHandler(this.code, [this.message = '']);

  factory FirebaseFirestoreExceptionHandler.fromCode(String code) {
    switch (code) {
      case 'cancelled':
        return FirebaseFirestoreExceptionHandler(code, 'Operation cancelled.');
      case 'unknown':
        return FirebaseFirestoreExceptionHandler(code, 'Unknown Firestore error.');
      case 'invalid-argument':
        return FirebaseFirestoreExceptionHandler(code, 'Invalid argument provided.');
      case 'deadline-exceeded':
        return FirebaseFirestoreExceptionHandler(code, 'Deadline exceeded.');
      case 'not-found':
        return FirebaseFirestoreExceptionHandler(code, 'Document not found.');
      case 'already-exists':
        return FirebaseFirestoreExceptionHandler(code, 'Document already exists.');
      case 'permission-denied':
        return FirebaseFirestoreExceptionHandler(code, 'Permission denied.');
      case 'resource-exhausted':
        return FirebaseFirestoreExceptionHandler(code, 'Resource exhausted.');
      case 'failed-precondition':
        return FirebaseFirestoreExceptionHandler(code, 'Precondition failed.');
      case 'aborted':
        return FirebaseFirestoreExceptionHandler(code, 'Operation aborted.');
      case 'out-of-range':
        return FirebaseFirestoreExceptionHandler(code, 'Operation out of range.');
      case 'unimplemented':
        return FirebaseFirestoreExceptionHandler(code, 'Operation not implemented.');
      case 'internal':
        return FirebaseFirestoreExceptionHandler(code, 'Internal Firestore error.');
      case 'unavailable':
        return FirebaseFirestoreExceptionHandler(code, 'Service unavailable.');
      case 'data-loss':
        return FirebaseFirestoreExceptionHandler(code, 'Data loss occurred.');
      case 'unauthenticated':
        return FirebaseFirestoreExceptionHandler(code, 'User unauthenticated.');
      default:
        return FirebaseFirestoreExceptionHandler(code, 'Unknown Firestore error.');
    }
  }

  @override
  String toString() => 'FirebaseFirestoreException($code): $message';
}

class FirebaseStorageExceptionHandler implements Exception {
  final String code;
  final String message;

  FirebaseStorageExceptionHandler(this.code, [this.message = '']);

  factory FirebaseStorageExceptionHandler.fromCode(String code) {
    switch (code) {
      case 'object-not-found':
        return FirebaseStorageExceptionHandler(code, 'No object exists at the reference.');
      case 'bucket-not-found':
        return FirebaseStorageExceptionHandler(code, 'No bucket is configured.');
      case 'project-not-found':
        return FirebaseStorageExceptionHandler(code, 'No project is configured.');
      case 'quota-exceeded':
        return FirebaseStorageExceptionHandler(code, 'Quota exceeded.');
      case 'unauthenticated':
        return FirebaseStorageExceptionHandler(code, 'User unauthenticated.');
      case 'unauthorized':
        return FirebaseStorageExceptionHandler(code, 'User unauthorized.');
      case 'retry-limit-exceeded':
        return FirebaseStorageExceptionHandler(code, 'Retry limit exceeded.');
      case 'invalid-checksum':
        return FirebaseStorageExceptionHandler(code, 'Checksum mismatch.');
      case 'canceled':
        return FirebaseStorageExceptionHandler(code, 'Operation canceled.');
      case 'invalid-argument':
        return FirebaseStorageExceptionHandler(code, 'Invalid argument.');
      case 'invalid-default-bucket':
        return FirebaseStorageExceptionHandler(code, 'Invalid default bucket.');
      case 'cannot-slice-blob':
        return FirebaseStorageExceptionHandler(code, 'Cannot slice blob.');
      case 'server-file-wrong-size':
        return FirebaseStorageExceptionHandler(code, 'Server file size mismatch.');
      case 'download-range':
        return FirebaseStorageExceptionHandler(code, 'Invalid download range.');
      default:
        return FirebaseStorageExceptionHandler(code, 'Unknown Firebase Storage error.');
    }
  }

  @override
  String toString() => 'FirebaseStorageException($code): $message';
}

class FirebaseFunctionsExceptionHandler implements Exception {
  final String code;
  final String message;
  final dynamic details;

  FirebaseFunctionsExceptionHandler(this.code, [this.message = '', this.details]);

  factory FirebaseFunctionsExceptionHandler.fromCode(String code) {
    switch (code) {
      case 'ok':
        return FirebaseFunctionsExceptionHandler(code, 'Operation completed successfully.');
      case 'cancelled':
        return FirebaseFunctionsExceptionHandler(code, 'Operation was cancelled.');
      case 'unknown':
        return FirebaseFunctionsExceptionHandler(code, 'Unknown error.');
      case 'invalid-argument':
        return FirebaseFunctionsExceptionHandler(code, 'Invalid argument provided.');
      case 'deadline-exceeded':
        return FirebaseFunctionsExceptionHandler(code, 'Deadline exceeded.');
      case 'not-found':
        return FirebaseFunctionsExceptionHandler(code, 'Resource not found.');
      case 'already-exists':
        return FirebaseFunctionsExceptionHandler(code, 'Resource already exists.');
      case 'permission-denied':
        return FirebaseFunctionsExceptionHandler(code, 'Permission denied.');
      case 'resource-exhausted':
        return FirebaseFunctionsExceptionHandler(code, 'Resource exhausted.');
      case 'failed-precondition':
        return FirebaseFunctionsExceptionHandler(code, 'Precondition failed.');
      case 'aborted':
        return FirebaseFunctionsExceptionHandler(code, 'Operation aborted.');
      case 'out-of-range':
        return FirebaseFunctionsExceptionHandler(code, 'Operation out of range.');
      case 'unimplemented':
        return FirebaseFunctionsExceptionHandler(code, 'Operation not implemented.');
      case 'internal':
        return FirebaseFunctionsExceptionHandler(code, 'Internal error.');
      case 'unavailable':
        return FirebaseFunctionsExceptionHandler(code, 'Service unavailable.');
      case 'data-loss':
        return FirebaseFunctionsExceptionHandler(code, 'Data loss occurred.');
      case 'unauthenticated':
        return FirebaseFunctionsExceptionHandler(code, 'User unauthenticated.');
      default:
        return FirebaseFunctionsExceptionHandler(code, 'Unknown Firebase Functions error.');
    }
  }

  @override
  String toString() => 'FirebaseFunctionsException($code): $message';
}

class FirebaseExceptionHandler {
  static Exception handleException(dynamic error) {
    if (error is FirebaseAuthExceptionHandler) {
      return error;
    } else if (error is FirebaseException) {
      switch (error.plugin) {
        case 'firebase_auth':
          return FirebaseAuthExceptionHandler.fromCode(error.code);
        case 'cloud_firestore':
          return FirebaseFirestoreExceptionHandler.fromCode(error.code);
        case 'firebase_storage':
          return FirebaseStorageExceptionHandler.fromCode(error.code);
        case 'cloud_functions':
          return FirebaseFunctionsExceptionHandler.fromCode(error.code);
        default:
          return FirebaseAuthExceptionHandler('unknown', 'Unknown Firebase error');
      }
    } else {
      return Exception('Unknown error: $error');
    }
  }
}