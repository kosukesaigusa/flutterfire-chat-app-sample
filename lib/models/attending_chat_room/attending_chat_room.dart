import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:cloud_functions_app_sample/converters/json_converter.dart';
import 'package:cloud_functions_app_sample/models/app_user/app_user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'attending_chat_room.g.dart';

@JsonSerializable()
class AttendingChatRoom {
  AttendingChatRoom({
    this.updatedAt,
    required this.chatRoomRef,
    required this.lastMessage,
    required this.name,
    this.imageURL,
    required this.usersCount,
    required this.mute,
  });

  @TimestampConverter()
  DateTime? updatedAt;
  @DocumentReferenceConverter()
  final DocumentReference chatRoomRef;
  final String lastMessage;
  final String name;
  final String? imageURL;
  @JsonKey(defaultValue: 0)
  final int usersCount;
  @JsonKey(defaultValue: false)
  final bool mute;
}

@Collection<AppUser>('users')
@Collection<AttendingChatRoom>('users/*/attendingChatRooms', name: 'attendingChatRooms')
AttendingChatRoomCollectionReference attendingChatRoomsRef(String userId) =>
    AttendingChatRoomCollectionReference(
        FirebaseFirestore.instance.collection('users').doc(userId) as DocumentReference<AppUser>);
