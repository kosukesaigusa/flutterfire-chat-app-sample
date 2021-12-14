import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions_app_sample/constants/string/string.dart';
import 'package:cloud_functions_app_sample/utils/enum/env_name.dart';
import 'package:cloud_functions_app_sample/utils/task_result/user_credential.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Store extends ChangeNotifier {
  factory Store() => _instance;
  Store._internal();
  static final Store _instance = Store._internal();

  // リスタート時にやること
  Future<void> initialize() async {
    useLocalEmulator = const bool.fromEnvironment('USE_LOCAL_EMULATOR');
    envName = const String.fromEnvironment('FLAVOR');
  }

  /// ==========================================================================
  /// 環境関係
  /// ==========================================================================
  bool useLocalEmulator = false;
  String _envName = '';
  String get envName => _envName;

  set envName(String flavor) {
    if (flavor == EnvName.local.name) {
      _envName = EnvName.local.name;
      return;
    } else if (flavor == EnvName.dev.name) {
      _envName = EnvName.dev.name;
      return;
    } else if (flavor == EnvName.prod.name) {
      _envName = EnvName.prod.name;
      return;
    }
    throw AssertionError('--dart-define flavor is not appropriate.');
  }

  FirebaseAuth get auth => FirebaseAuth.instance;
  FirebaseFirestore get db => FirebaseFirestore.instance;
  FirebaseStorage get storage => FirebaseStorage.instance;
  String get uuid => const Uuid().v4();

  /// ==========================================================================
  /// ユーザー認証関係
  /// ==========================================================================

  /// /// Firebase Authentication が管理する現在のユーザー
  User? get currentUser => FirebaseAuth.instance.currentUser;

  /// SignInRequiredPage の child で使って良い non-null の uid
  String get nonNullUid => FirebaseAuth.instance.currentUser!.uid;

  /// メールアドレスとパスワードによるサインイン
  Future<UserCredentialTaskResult> signInWithEmail(String email, String password) async {
    try {
      final userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return UserCredentialTaskResult(
        userCredential: userCredential,
        isSucces: true,
        message: 'ログインしました。',
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-disabled') {
        return UserCredentialTaskResult(
          userCredential: null,
          isSucces: false,
          message: 'そのアカウントはご使用になれません。',
        );
      } else if (e.code == 'user-not-found') {
        return UserCredentialTaskResult(
          userCredential: null,
          isSucces: false,
          message: '入力されたメールアドレスのユーザーは見つかりません。',
        );
      } else if (e.code == 'wrong-password') {
        return UserCredentialTaskResult(
          userCredential: null,
          isSucces: false,
          message: 'パスワードが正しくありません。',
        );
      } else if (e.code == 'too-many-requests') {
        return UserCredentialTaskResult(
          userCredential: null,
          isSucces: false,
          message: '認証失敗の回数が一定を超えました。'
              'しばらくして再度サインインしてください。',
        );
      } else {
        return UserCredentialTaskResult(
          userCredential: null,
          isSucces: false,
          message: generalErrorMessage,
        );
      }
    }
  }

  /// サインアウトする
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
