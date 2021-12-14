import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:cloud_functions_app_sample/app.dart';
import 'package:cloud_functions_app_sample/store/store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final store = Store();
  await store.initialize();
  if (store.useLocalEmulator) {
    await setUpLocalEmulator();
  }
  runApp(
    ChangeNotifierProvider<Store>.value(
      value: store,
      builder: (context, child) => const App(),
    ),
  );
}

/// Firebase Emulator Suite を使用する際の設定を行う
Future<void> setUpLocalEmulator() async {
  print('-------------------------------------------');
  print('Running with Firebase Local Emulator Suite');
  print('-------------------------------------------');
  const localhost = 'localhost';
  FirebaseFirestore.instance.settings = Settings(
    host: Platform.isAndroid ? '10.0.2.2:8080' : 'localhost:8080',
    sslEnabled: false,
    persistenceEnabled: true,
  );
  FirebaseFirestore.instance.useFirestoreEmulator(localhost, 8080);
  FirebaseFunctions.instance.useFunctionsEmulator(localhost, 5001);
  FirebaseStorage.instanceFor(bucket: 'default-bucket');
  await Future.wait(
    [
      FirebaseAuth.instance.useAuthEmulator(localhost, 9099),
      FirebaseStorage.instance.useStorageEmulator(localhost, 9199),
    ],
  );
}
