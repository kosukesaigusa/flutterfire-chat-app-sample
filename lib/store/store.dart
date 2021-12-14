import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions_app_sample/utils/enum/env_name.dart';
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

  FirebaseFirestore get db => FirebaseFirestore.instance;
  FirebaseStorage get storage => FirebaseStorage.instance;
  String get uuid => const Uuid().v4();

  /// 現在開いている BottomNavigationBar のタブ番号
  int tabIndex = 0;

  /// BottomNavigationBar のタブの切り替え
  void changeTab(int index) {
    tabIndex = index;
    notifyListeners();
  }

  /// Firebase Authentication が管理する現在のユーザー
  User? get currentUser => FirebaseAuth.instance.currentUser;

  /// SignInRequiredPage の child で使って良い non-null の uid
  String get nonNullUid => FirebaseAuth.instance.currentUser!.uid;
}
