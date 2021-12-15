import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:cloud_functions_app_sample/converters/json_converter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_user.g.dart';

@JsonSerializable()
class AppUser {
  AppUser({
    this.createdAt,
    this.updatedAt,
    required this.name,
    this.imageURL,
  });

  @TimestampConverter()
  DateTime? createdAt;
  @TimestampConverter()
  DateTime? updatedAt;
  final String name;
  final String? imageURL;
}

@JsonSerializable()
class AttendingChatRoom {
  AttendingChatRoom({
    this.updatedAt,
    required this.chatRoomRef,
    required this.lastMessage,
    required this.name,
    this.imageURL,
    this.usersCount,
    this.mute,
    this.unreadCount,
  });

  @TimestampConverter()
  DateTime? updatedAt;
  @DocumentReferenceConverter()
  final DocumentReference chatRoomRef;
  final String lastMessage;
  final String name;
  final String? imageURL;
  @JsonKey(defaultValue: 0)
  final int? usersCount;
  @JsonKey(defaultValue: false)
  final bool? mute;
  @JsonKey(defaultValue: 0)
  final int? unreadCount;
}

@Collection<AppUser>('users')
@Collection<AttendingChatRoom>('users/*/attendingChatRooms', name: 'attendingChatRooms')
final usersRef = AppUserCollectionReference();
AppUserDocumentReference userRef({required String userId}) =>
    AppUserDocumentReference(usersRef.doc(userId).reference);
AttendingChatRoomCollectionReference attendingChatRoomsRef({required String userId}) =>
    AttendingChatRoomCollectionReference(usersRef.doc(userId).reference);
AttendingChatRoomDocumentReference attendingChatRoomRef(
        {required String userId, required String chatRoomId}) =>
    AttendingChatRoomDocumentReference(
        attendingChatRoomsRef(userId: userId).doc(chatRoomId).reference);
