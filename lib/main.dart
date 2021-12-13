import 'package:cloud_functions_app_sample/pages/chat_room_list/chat_room_list.dart';
import 'package:cloud_functions_app_sample/store/store.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final store = Store();
  runApp(
    ChangeNotifierProvider<Store>.value(
      value: store,
      builder: (context, child) => const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Cloud Functions app',
      theme: ThemeData.dark(),
      home: ChatRoomListPage(),
    );
  }
}
