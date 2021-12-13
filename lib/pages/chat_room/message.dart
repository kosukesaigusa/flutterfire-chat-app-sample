import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:cloud_functions_app_sample/models/app_user/app_user.dart';
import 'package:cloud_functions_app_sample/models/chat_room/chat_room.dart';
import 'package:cloud_functions_app_sample/theme/theme.dart';
import 'package:cloud_functions_app_sample/utils/datetime.dart';
import 'package:cloud_functions_app_sample/widgets/image_widget/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

const double radius = 32;

class MessageWidget extends StatelessWidget {
  const MessageWidget(this.message);
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FirestoreBuilder<AppUserDocumentSnapshot>(
          ref: usersRef.doc(message.senderRef.id),
          builder: (context, snapshot, child) {
            if (snapshot.hasError) {
              return const CirclePlaceHolder(radius);
            }
            final sender = snapshot.data?.data;
            if (sender == null) {
              return const CirclePlaceHolder(radius);
            }
            return CircleCachedNetworkImage(
              radius: radius,
              imageURL: sender.imageURL ?? '',
            );
          },
        ),
        const Gap(16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  FirestoreBuilder<AppUserDocumentSnapshot>(
                    ref: usersRef.doc(message.senderRef.id),
                    builder: (context, snapshot, child) {
                      if (snapshot.hasError) {
                        return const SizedBox();
                      }
                      final sender = snapshot.data?.data;
                      if (sender == null) {
                        return const SizedBox();
                      }
                      return Flexible(
                        child: Text(
                          sender.name,
                          style: bold16,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    },
                  ),
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
  }
}
