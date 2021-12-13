import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:cloud_functions_app_sample/converters/json_converter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chat_room.g.dart';

@JsonSerializable()
class ChatRoom {
  ChatRoom({
    this.createdAt,
    this.updatedAt,
    required this.name,
    this.imageURL,
    this.usersCount,
  });

  @TimestampConverter()
  DateTime? createdAt;
  @TimestampConverter()
  DateTime? updatedAt;
  final String name;
  final String? imageURL;
  @JsonKey(defaultValue: 0)
  int? usersCount;
}

@JsonSerializable()
class Message {
  Message({
    this.createdAt,
    this.isDeleted,
    required this.senderRef,
    required this.content,
  });

  @TimestampConverter()
  DateTime? createdAt;
  @JsonKey(defaultValue: false)
  bool? isDeleted;
  @DocumentReferenceConverter()
  final DocumentReference senderRef;
  final String content;
}

@Collection<ChatRoom>('chatRooms')
@Collection<Message>('chatRooms/*/messages', name: 'messages')
final chatRoomsRef = ChatRoomCollectionReference();
ChatRoomDocumentReference chatRoomRef({required String chatRoomId}) =>
    ChatRoomDocumentReference(chatRoomsRef.doc(chatRoomId).reference);
MessageCollectionReference messagesRef({required String chatRoomId}) =>
    MessageCollectionReference(chatRoomRef(chatRoomId: chatRoomId).reference);
