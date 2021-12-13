import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:cloud_functions_app_sample/models/chat_room/chat_room.dart';
import 'package:cloud_functions_app_sample/pages/chat_room/input_widget.dart';
import 'package:cloud_functions_app_sample/routes/route.dart';
import 'package:cloud_functions_app_sample/theme/theme.dart';
import 'package:cloud_functions_app_sample/utils/datetime.dart';
import 'package:cloud_functions_app_sample/widgets/error_widget/error_text_widget.dart';
import 'package:cloud_functions_app_sample/widgets/error_widget/not_found_widget.dart';
import 'package:cloud_functions_app_sample/widgets/image_widget/cached_network_image.dart';
import 'package:cloud_functions_app_sample/widgets/loading_widget/spinkit_circle.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
    return FirestoreBuilder<ChatRoomDocumentSnapshot>(
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
              final querySnapshot = snapshot.requireData;
              return Column(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: ListView.builder(
                          reverse: true,
                          itemCount: querySnapshot.docs.length,
                          itemBuilder: (context, index) {
                            final message = querySnapshot.docs[index].data;
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const CircleCachedNetworkImage(
                                  radius: 36,
                                  imageURL: '',
                                ),
                                const Gap(16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Flexible(
                                              child: Text(
                                            '大谷翔平',
                                            style: bold16,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          )),
                                          const Gap(16),
                                          Text(
                                            dateTimeString(datetime: message.createdAt),
                                            style: regular12,
                                          ),
                                          const Gap(48),
                                        ],
                                      ),
                                      Text(message.content),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  ChatInputWidget(),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
