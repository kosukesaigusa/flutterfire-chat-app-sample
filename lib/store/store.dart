import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Store extends ChangeNotifier {
  factory Store() => _instance;
  Store._internal();
  static final Store _instance = Store._internal();

  /// 現在開いている BottomNavigationBar のタブ番号
  int tabIndex = 0;

  /// BottomNavigationBar のタブの切り替え
  void changeTab(int index) {
    tabIndex = index;
    notifyListeners();
  }

  // Firebase Authentication が管理する現在のユーザー
  User? get currentUser => FirebaseAuth.instance.currentUser;
}
