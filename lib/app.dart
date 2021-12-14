import 'package:cloud_functions_app_sample/pages/chat_room/chat_room.dart';
import 'package:cloud_functions_app_sample/pages/chat_room_list/chat_room_list.dart';
import 'package:cloud_functions_app_sample/pages/sing_in/sign_in_page.dart';
import 'package:cloud_functions_app_sample/routes/route.dart';
import 'package:cloud_functions_app_sample/widgets/loading_widget/spinkit_circle.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Cloud Functions app',
      theme: ThemeData.dark(),
      home: _buildUserStateStreamBuilder(),
      routes: {
        RouteName.signIn.name: (context) => SignInPage(),
        RouteName.chatRoomList.name: (context) => ChatRoomListPage(),
        RouteName.chatRoom.name: (context) => ChatRoomPage(),
      },
    );
  }

  /// ログイン状態を監視して初期ページを出し分ける
  Widget _buildUserStateStreamBuilder() => StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const PrimarySpinkitCircle(size: 48);
          }
          if (snapshot.hasData) {
            return ChatRoomListPage();
          }
          return SignInPage();
        },
      );
}
