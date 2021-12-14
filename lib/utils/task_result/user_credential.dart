import 'package:firebase_auth/firebase_auth.dart';

/// サインイン・サインアップの TaskResult
class UserCredentialTaskResult {
  UserCredentialTaskResult({
    required this.userCredential,
    required this.isSucces,
    required this.message,
  });
  final UserCredential? userCredential;
  final bool isSucces;
  final String message;
}
