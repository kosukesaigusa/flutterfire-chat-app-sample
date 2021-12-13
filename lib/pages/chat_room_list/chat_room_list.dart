import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:cloud_functions_app_sample/models/app_user/app_user.dart';
import 'package:cloud_functions_app_sample/models/chat_room/chat_room.dart';
import 'package:cloud_functions_app_sample/pages/chat_room/chat_room.dart';
import 'package:cloud_functions_app_sample/store/store.dart';
import 'package:cloud_functions_app_sample/theme/theme.dart';
import 'package:cloud_functions_app_sample/utils/datetime.dart';
import 'package:cloud_functions_app_sample/widgets/error_widget/error_text_widget.dart';
import 'package:cloud_functions_app_sample/widgets/image_widget/cached_network_image.dart';
import 'package:cloud_functions_app_sample/widgets/loading_widget/spinkit_circle.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

final store = Store();

class ChatRoomListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chats'), centerTitle: false),
      body: FirestoreBuilder<AttendingChatRoomQuerySnapshot>(
        // ref: attendingChatRoomsRef(store.nonNullUid),
        ref: attendingChatRoomsRef(userId: 'EqGWv1sZAMNiVifprM5ku4DNzKu2'),
        builder: (context, snapshot, child) {
          if (snapshot.hasError) {
            return ErrorTextWidget();
          }
          if (!snapshot.hasData) {
            return const PrimarySpinkitCircle(size: 48);
          }
          final querySnapshot = snapshot.requireData;
          return ListView.separated(
            separatorBuilder: (context, index) => const Divider(height: 0),
            itemCount: querySnapshot.docs.length,
            itemBuilder: (context, index) {
              final attendingChatRoom = querySnapshot.docs[index].data;
              return InkWell(
                onTap: () async {
                  await Navigator.of(context).push<void>(
                    ChatRoomPage.route(
                        args: ChatRoomPageArguments(
                            chatRoomRef(chatRoomId: querySnapshot.docs[index].id))),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleCachedNetworkImage(
                        radius: 48,
                        imageURL: attendingChatRoom.imageURL ?? '',
                      ),
                      const Gap(16),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Flexible(
                                        child: Text(
                                          '${attendingChatRoom.name}',
                                          style: bold16,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const Gap(4),
                                      Text('(${attendingChatRoom.usersCount})', style: regular12),
                                    ],
                                  ),
                                ),
                                const Gap(16),
                                Text(
                                  dateTimeString(datetime: attendingChatRoom.updatedAt),
                                  style: regular12,
                                ),
                              ],
                            ),
                            const Gap(4),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    attendingChatRoom.lastMessage,
                                    style: regular12,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const Gap(48),
                                attendingChatRoom.unreadCount > 0
                                    ? Container(
                                        height: 24,
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 4,
                                          horizontal: 8,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).colorScheme.primary,
                                          borderRadius: BorderRadius.circular(16),
                                        ),
                                        child: Center(
                                          child: Text(
                                            attendingChatRoom.unreadCount < 100
                                                ? '${attendingChatRoom.unreadCount}'
                                                : '99+',
                                            style: white10,
                                          ),
                                        ),
                                      )
                                    : const SizedBox(height: 24),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
