import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInRequiredPage extends StatelessWidget {
  const SignInRequiredPage({required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser == null) {
      return const Text('サインインが必要です。');
    }
    return child;
  }
}
