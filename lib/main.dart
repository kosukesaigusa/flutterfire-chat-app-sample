import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:cloud_functions_app_sample/models/app_user/app_user.dart';
import 'package:cloud_functions_app_sample/store/store.dart';
import 'package:cloud_functions_app_sample/widgets/sign_in_required_page.dart';
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
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final store = Store();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FirestoreBuilder<AttendingChatRoomQuerySnapshot>(
        // ref: attendingChatRoomsRef(store.nonNullUid),
        ref: attendingChatRoomsRef(userId: 'EqGWv1sZAMNiVifprM5ku4DNzKu2'),
        builder: (context, snapshot, child) {
          if (snapshot.hasError) return const Text('Something went wrong!');
          if (!snapshot.hasData) return const Text('Loading users...');
          final querySnapshot = snapshot.requireData;
          return ListView.builder(
            itemCount: querySnapshot.docs.length,
            itemBuilder: (context, index) {
              final user = querySnapshot.docs[index].data;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('名前: ${user.name}'),
                  Text('画像 URL：${user.imageURL}'),
                  Text('updatedAt：${user.updatedAt}'),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
