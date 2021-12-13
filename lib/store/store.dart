import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Store extends ChangeNotifier {
  factory Store() => _instance;
  Store._internal();
  static final Store _instance = Store._internal();

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
