import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:cloud_functions_app_sample/models/app_user/app_user.dart';
import 'package:cloud_functions_app_sample/models/chat_room/chat_room.dart';
import 'package:cloud_functions_app_sample/pages/chat_room/input_widget.dart';
import 'package:cloud_functions_app_sample/pages/chat_room/message.dart';
import 'package:cloud_functions_app_sample/repository/attending_chat_room/attending_chat_room.dart';
import 'package:cloud_functions_app_sample/routes/route.dart';
import 'package:cloud_functions_app_sample/widgets/error_widget/error_text_widget.dart';
import 'package:cloud_functions_app_sample/widgets/error_widget/not_found_widget.dart';
import 'package:cloud_functions_app_sample/widgets/loading_widget/spinkit_circle.dart';
import 'package:cloud_functions_app_sample/widgets/tap_to_unfocus_page.dart';
import 'package:flutter/material.dart';

class ChatRoomPageArguments {
  ChatRoomPageArguments(this.chatRoomRef);
  final ChatRoomDocumentReference chatRoomRef;
}

class ChatRoomPage extends StatelessWidget {
  static Route<dynamic> route({required ChatRoomPageArguments args}) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => ChatRoomPage(),
      settings: RouteSettings(
        name: RouteName.chatRoom.name,
        arguments: args,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments! as ChatRoomPageArguments;
    return TapToUnfocusPage(
      child: FirestoreBuilder<ChatRoomDocumentSnapshot>(
        ref: args.chatRoomRef,
        builder: (context, snapshot, child) {
          if (snapshot.hasError) {
            return ErrorTextWidgetPage();
          }
          if (!snapshot.hasData) {
            return const PrimarySpinkitCircle(size: 48);
          }
          final chatRoom = snapshot.data?.data;
          if (chatRoom == null) {
            return NotFoundWidgetPage();
          }
          return Scaffold(
            appBar: AppBar(title: Text(chatRoom.name), centerTitle: false),
            body: FirestoreBuilder<MessageQuerySnapshot>(
              ref: messagesRef(chatRoomId: args.chatRoomRef.id),
              builder: (context, snapshot, child) {
                if (snapshot.hasError) {
                  return ErrorTextWidget();
                }
                if (!snapshot.hasData) {
                  return const PrimarySpinkitCircle(size: 48);
                }
                // ignore: unawaited_futures
                resetUnreadCount(attendingChatRoomRef(
                    userId: store.nonNullUid, chatRoomId: args.chatRoomRef.id));
                final querySnapshot = snapshot.requireData;
                return Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: ListView.builder(
                          reverse: true,
                          itemCount: querySnapshot.docs.length,
                          itemBuilder: (context, index) {
                            final message = querySnapshot.docs[index].data;
                            return MessageWidget(message);
                          },
                        ),
                      ),
                    ),
                    ChatInputWidget(chatRoomId: args.chatRoomRef.id),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
