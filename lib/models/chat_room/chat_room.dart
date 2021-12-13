import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:cloud_functions_app_sample/converters/json_converter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chat_room.g.dart';

final db = FirebaseFirestore.instance;

@JsonSerializable()
class ChatRoom {
  ChatRoom({
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
class Message {
  Message({
    this.createdAt,
    required this.isDeleted,
    required this.senderRef,
    required this.content,
  });

  @TimestampConverter()
  DateTime? createdAt;
  @JsonKey(defaultValue: false)
  final bool isDeleted;
  @DocumentReferenceConverter()
  final DocumentReference senderRef;
  final String content;
}

@Collection<ChatRoom>('chatRooms')
@Collection<Message>('chatRooms/*/messages', name: 'messages')
final chatRoomsRef = ChatRoomCollectionReference();
ChatRoomDocumentReference chatRoomRef({required String chatRoomId}) =>
    ChatRoomDocumentReference(db.collection('chatRooms').doc(chatRoomId).withConverter<ChatRoom>(
          fromFirestore: ChatRoomCollectionReference.fromFirestore,
          toFirestore: ChatRoomCollectionReference.toFirestore,
        ));
MessageCollectionReference messagesRef({required String chatRoomId}) =>
    MessageCollectionReference(db.collection('chatRooms').doc(chatRoomId).withConverter<ChatRoom>(
          fromFirestore: ChatRoomCollectionReference.fromFirestore,
          toFirestore: ChatRoomCollectionReference.toFirestore,
        ));
