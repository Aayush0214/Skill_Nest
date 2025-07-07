import 'package:firebase_core/firebase_core.dart';

class FirebaseAuthException implements Exception {
  final String code;
  final String message;

  FirebaseAuthException(this.code, [this.message = '']);

  factory FirebaseAuthException.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return FirebaseAuthException(code, 'The email address is badly formatted.');
      case 'user-disabled':
        return FirebaseAuthException(code, 'This user has been disabled.');
      case 'user-not-found':
        return FirebaseAuthException(code, 'No user found with this email.');
      case 'wrong-password':
        return FirebaseAuthException(code, 'Wrong password provided.');
      case 'email-already-in-use':
        return FirebaseAuthException(code, 'Email already in use.');
      case 'operation-not-allowed':
        return FirebaseAuthException(code, 'Email/password accounts are not enabled.');
      case 'weak-password':
        return FirebaseAuthException(code, 'Password is too weak.');
      case 'requires-recent-login':
        return FirebaseAuthException(code, 'Requires recent authentication.');
      case 'too-many-requests':
        return FirebaseAuthException(code, 'Too many requests. Try again later.');
      case 'account-exists-with-different-credential':
        return FirebaseAuthException(code, 'Account exists with different credentials.');
      case 'invalid-credential':
        return FirebaseAuthException(code, 'Invalid credential.');
      case 'invalid-verification-code':
        return FirebaseAuthException(code, 'Invalid verification code.');
      case 'invalid-verification-id':
        return FirebaseAuthException(code, 'Invalid verification ID.');
      case 'session-cookie-expired':
        return FirebaseAuthException(code, 'Firebase session cookie expired.');
      case 'uid-already-exists':
        return FirebaseAuthException(code, 'UID already exists.');
      case 'invalid-phone-number':
        return FirebaseAuthException(code, 'Invalid phone number.');
      case 'missing-phone-number':
        return FirebaseAuthException(code, 'Missing phone number.');
      case 'credential-already-in-use':
        return FirebaseAuthException(code, 'Credential already in use.');
      case 'provider-already-linked':
        return FirebaseAuthException(code, 'Provider already linked.');
      case 'app-not-authorized':
        return FirebaseAuthException(code, 'App not authorized.');
      case 'expired-action-code':
        return FirebaseAuthException(code, 'Expired action code.');
      case 'invalid-action-code':
        return FirebaseAuthException(code, 'Invalid action code.');
      case 'missing-action-code':
        return FirebaseAuthException(code, 'Missing action code.');
      case 'unauthorized-domain':
        return FirebaseAuthException(code, 'Unauthorized domain.');
      case 'network-request-failed':
        return FirebaseAuthException(code, 'Network error occurred.');
      default:
        return FirebaseAuthException(code, 'Unknown Firebase authentication error.');
    }
  }

  @override
  String toString() => 'FirebaseAuthException($code): $message';
}

class FirebaseFirestoreException implements Exception {
  final String code;
  final String message;

  FirebaseFirestoreException(this.code, [this.message = '']);

  factory FirebaseFirestoreException.fromCode(String code) {
    switch (code) {
      case 'cancelled':
        return FirebaseFirestoreException(code, 'Operation cancelled.');
      case 'unknown':
        return FirebaseFirestoreException(code, 'Unknown Firestore error.');
      case 'invalid-argument':
        return FirebaseFirestoreException(code, 'Invalid argument provided.');
      case 'deadline-exceeded':
        return FirebaseFirestoreException(code, 'Deadline exceeded.');
      case 'not-found':
        return FirebaseFirestoreException(code, 'Document not found.');
      case 'already-exists':
        return FirebaseFirestoreException(code, 'Document already exists.');
      case 'permission-denied':
        return FirebaseFirestoreException(code, 'Permission denied.');
      case 'resource-exhausted':
        return FirebaseFirestoreException(code, 'Resource exhausted.');
      case 'failed-precondition':
        return FirebaseFirestoreException(code, 'Precondition failed.');
      case 'aborted':
        return FirebaseFirestoreException(code, 'Operation aborted.');
      case 'out-of-range':
        return FirebaseFirestoreException(code, 'Operation out of range.');
      case 'unimplemented':
        return FirebaseFirestoreException(code, 'Operation not implemented.');
      case 'internal':
        return FirebaseFirestoreException(code, 'Internal Firestore error.');
      case 'unavailable':
        return FirebaseFirestoreException(code, 'Service unavailable.');
      case 'data-loss':
        return FirebaseFirestoreException(code, 'Data loss occurred.');
      case 'unauthenticated':
        return FirebaseFirestoreException(code, 'User unauthenticated.');
      default:
        return FirebaseFirestoreException(code, 'Unknown Firestore error.');
    }
  }

  @override
  String toString() => 'FirebaseFirestoreException($code): $message';
}

class FirebaseStorageException implements Exception {
  final String code;
  final String message;

  FirebaseStorageException(this.code, [this.message = '']);

  factory FirebaseStorageException.fromCode(String code) {
    switch (code) {
      case 'object-not-found':
        return FirebaseStorageException(code, 'No object exists at the reference.');
      case 'bucket-not-found':
        return FirebaseStorageException(code, 'No bucket is configured.');
      case 'project-not-found':
        return FirebaseStorageException(code, 'No project is configured.');
      case 'quota-exceeded':
        return FirebaseStorageException(code, 'Quota exceeded.');
      case 'unauthenticated':
        return FirebaseStorageException(code, 'User unauthenticated.');
      case 'unauthorized':
        return FirebaseStorageException(code, 'User unauthorized.');
      case 'retry-limit-exceeded':
        return FirebaseStorageException(code, 'Retry limit exceeded.');
      case 'invalid-checksum':
        return FirebaseStorageException(code, 'Checksum mismatch.');
      case 'canceled':
        return FirebaseStorageException(code, 'Operation canceled.');
      case 'invalid-argument':
        return FirebaseStorageException(code, 'Invalid argument.');
      case 'invalid-default-bucket':
        return FirebaseStorageException(code, 'Invalid default bucket.');
      case 'cannot-slice-blob':
        return FirebaseStorageException(code, 'Cannot slice blob.');
      case 'server-file-wrong-size':
        return FirebaseStorageException(code, 'Server file size mismatch.');
      case 'download-range':
        return FirebaseStorageException(code, 'Invalid download range.');
      default:
        return FirebaseStorageException(code, 'Unknown Firebase Storage error.');
    }
  }

  @override
  String toString() => 'FirebaseStorageException($code): $message';
}

class FirebaseFunctionsException implements Exception {
  final String code;
  final String message;
  final dynamic details;

  FirebaseFunctionsException(this.code, [this.message = '', this.details]);

  factory FirebaseFunctionsException.fromCode(String code) {
    switch (code) {
      case 'ok':
        return FirebaseFunctionsException(code, 'Operation completed successfully.');
      case 'cancelled':
        return FirebaseFunctionsException(code, 'Operation was cancelled.');
      case 'unknown':
        return FirebaseFunctionsException(code, 'Unknown error.');
      case 'invalid-argument':
        return FirebaseFunctionsException(code, 'Invalid argument provided.');
      case 'deadline-exceeded':
        return FirebaseFunctionsException(code, 'Deadline exceeded.');
      case 'not-found':
        return FirebaseFunctionsException(code, 'Resource not found.');
      case 'already-exists':
        return FirebaseFunctionsException(code, 'Resource already exists.');
      case 'permission-denied':
        return FirebaseFunctionsException(code, 'Permission denied.');
      case 'resource-exhausted':
        return FirebaseFunctionsException(code, 'Resource exhausted.');
      case 'failed-precondition':
        return FirebaseFunctionsException(code, 'Precondition failed.');
      case 'aborted':
        return FirebaseFunctionsException(code, 'Operation aborted.');
      case 'out-of-range':
        return FirebaseFunctionsException(code, 'Operation out of range.');
      case 'unimplemented':
        return FirebaseFunctionsException(code, 'Operation not implemented.');
      case 'internal':
        return FirebaseFunctionsException(code, 'Internal error.');
      case 'unavailable':
        return FirebaseFunctionsException(code, 'Service unavailable.');
      case 'data-loss':
        return FirebaseFunctionsException(code, 'Data loss occurred.');
      case 'unauthenticated':
        return FirebaseFunctionsException(code, 'User unauthenticated.');
      default:
        return FirebaseFunctionsException(code, 'Unknown Firebase Functions error.');
    }
  }

  @override
  String toString() => 'FirebaseFunctionsException($code): $message';
}

class FirebaseExceptionHandler {
  static Exception handleException(dynamic error) {
    if (error is FirebaseAuthException) {
      return error;
    } else if (error is FirebaseException) {
      switch (error.plugin) {
        case 'firebase_auth':
          return FirebaseAuthException.fromCode(error.code);
        case 'cloud_firestore':
          return FirebaseFirestoreException.fromCode(error.code);
        case 'firebase_storage':
          return FirebaseStorageException.fromCode(error.code);
        case 'cloud_functions':
          return FirebaseFunctionsException.fromCode(error.code);
        default:
          return FirebaseAuthException('unknown', 'Unknown Firebase error');
      }
    } else {
      return Exception('Unknown error: $error');
    }
  }
}