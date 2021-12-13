import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:cloud_functions_app_sample/converters/json_converter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_user.g.dart';

final db = FirebaseFirestore.instance;

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
final usersRef = AppUserCollectionReference();
AttendingChatRoomCollectionReference attendingChatRoomsRef({required String userId}) =>
    AttendingChatRoomCollectionReference(db.collection('users').doc(userId).withConverter<AppUser>(
          fromFirestore: AppUserCollectionReference.fromFirestore,
          toFirestore: AppUserCollectionReference.toFirestore,
        ));
// AttendingChatRoomCollectionReference attendingChatRoomsRef({required String userId}) =>
//     AttendingChatRoomCollectionReference(
//         db.collection('users').doc(userId) as DocumentReference<AppUser>);
