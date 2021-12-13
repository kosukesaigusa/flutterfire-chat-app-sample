// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class ChatRoomCollectionReference
    implements
        ChatRoomQuery,
        FirestoreCollectionReference<ChatRoomQuerySnapshot> {
  factory ChatRoomCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$ChatRoomCollectionReference;

  static ChatRoom fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$ChatRoomFromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    ChatRoom value,
    SetOptions? options,
  ) {
    return _$ChatRoomToJson(value);
  }

  @override
  ChatRoomDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<ChatRoomDocumentReference> add(ChatRoom value);
}

class _$ChatRoomCollectionReference extends _$ChatRoomQuery
    implements ChatRoomCollectionReference {
  factory _$ChatRoomCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$ChatRoomCollectionReference._(
      firestore.collection('chatRooms').withConverter(
            fromFirestore: ChatRoomCollectionReference.fromFirestore,
            toFirestore: ChatRoomCollectionReference.toFirestore,
          ),
    );
  }

  _$ChatRoomCollectionReference._(
    CollectionReference<ChatRoom> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<ChatRoom> get reference =>
      super.reference as CollectionReference<ChatRoom>;

  @override
  ChatRoomDocumentReference doc([String? id]) {
    return ChatRoomDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<ChatRoomDocumentReference> add(ChatRoom value) {
    return reference.add(value).then((ref) => ChatRoomDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$ChatRoomCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class ChatRoomDocumentReference
    extends FirestoreDocumentReference<ChatRoomDocumentSnapshot> {
  factory ChatRoomDocumentReference(DocumentReference<ChatRoom> reference) =
      _$ChatRoomDocumentReference;

  DocumentReference<ChatRoom> get reference;

  /// A reference to the [ChatRoomCollectionReference] containing this document.
  ChatRoomCollectionReference get parent {
    return _$ChatRoomCollectionReference(reference.firestore);
  }

  late final MessageCollectionReference messages = _$MessageCollectionReference(
    reference,
  );

  @override
  Stream<ChatRoomDocumentSnapshot> snapshots();

  @override
  Future<ChatRoomDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String name,
    String? imageURL,
  });

  Future<void> set(ChatRoom value);
}

class _$ChatRoomDocumentReference
    extends FirestoreDocumentReference<ChatRoomDocumentSnapshot>
    implements ChatRoomDocumentReference {
  _$ChatRoomDocumentReference(this.reference);

  @override
  final DocumentReference<ChatRoom> reference;

  /// A reference to the [ChatRoomCollectionReference] containing this document.
  ChatRoomCollectionReference get parent {
    return _$ChatRoomCollectionReference(reference.firestore);
  }

  late final MessageCollectionReference messages = _$MessageCollectionReference(
    reference,
  );

  @override
  Stream<ChatRoomDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return ChatRoomDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<ChatRoomDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return ChatRoomDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<void> delete() {
    return reference.delete();
  }

  Future<void> update({
    Object? name = _sentinel,
    Object? imageURL = _sentinel,
  }) async {
    final json = {
      if (name != _sentinel) "name": name as String,
      if (imageURL != _sentinel) "imageURL": imageURL as String?,
    };

    return reference.update(json);
  }

  Future<void> set(ChatRoom value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is ChatRoomDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class ChatRoomDocumentSnapshot extends FirestoreDocumentSnapshot {
  ChatRoomDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<ChatRoom> snapshot;

  @override
  ChatRoomDocumentReference get reference {
    return ChatRoomDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final ChatRoom? data;
}

abstract class ChatRoomQuery implements QueryReference<ChatRoomQuerySnapshot> {
  @override
  ChatRoomQuery limit(int limit);

  @override
  ChatRoomQuery limitToLast(int limit);

  ChatRoomQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  ChatRoomQuery whereImageURL({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });

  ChatRoomQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ChatRoomDocumentSnapshot? startAtDocument,
    ChatRoomDocumentSnapshot? endAtDocument,
    ChatRoomDocumentSnapshot? endBeforeDocument,
    ChatRoomDocumentSnapshot? startAfterDocument,
  });

  ChatRoomQuery orderByImageURL({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    ChatRoomDocumentSnapshot? startAtDocument,
    ChatRoomDocumentSnapshot? endAtDocument,
    ChatRoomDocumentSnapshot? endBeforeDocument,
    ChatRoomDocumentSnapshot? startAfterDocument,
  });
}

class _$ChatRoomQuery extends QueryReference<ChatRoomQuerySnapshot>
    implements ChatRoomQuery {
  _$ChatRoomQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<ChatRoom> reference;

  ChatRoomQuerySnapshot _decodeSnapshot(
    QuerySnapshot<ChatRoom> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return ChatRoomQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<ChatRoomDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: ChatRoomDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return ChatRoomQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<ChatRoomQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<ChatRoomQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  ChatRoomQuery limit(int limit) {
    return _$ChatRoomQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  ChatRoomQuery limitToLast(int limit) {
    return _$ChatRoomQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  ChatRoomQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$ChatRoomQuery(
      reference.where(
        'name',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  ChatRoomQuery whereImageURL({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$ChatRoomQuery(
      reference.where(
        'imageURL',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  ChatRoomQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ChatRoomDocumentSnapshot? startAtDocument,
    ChatRoomDocumentSnapshot? endAtDocument,
    ChatRoomDocumentSnapshot? endBeforeDocument,
    ChatRoomDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('name', descending: false);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$ChatRoomQuery(query, _collection);
  }

  ChatRoomQuery orderByImageURL({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ChatRoomDocumentSnapshot? startAtDocument,
    ChatRoomDocumentSnapshot? endAtDocument,
    ChatRoomDocumentSnapshot? endBeforeDocument,
    ChatRoomDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('imageURL', descending: false);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$ChatRoomQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$ChatRoomQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class ChatRoomQuerySnapshot
    extends FirestoreQuerySnapshot<ChatRoomQueryDocumentSnapshot> {
  ChatRoomQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<ChatRoom> snapshot;

  @override
  final List<ChatRoomQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<ChatRoomDocumentSnapshot>> docChanges;
}

class ChatRoomQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements ChatRoomDocumentSnapshot {
  ChatRoomQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<ChatRoom> snapshot;

  @override
  ChatRoomDocumentReference get reference {
    return ChatRoomDocumentReference(snapshot.reference);
  }

  @override
  final ChatRoom data;
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class MessageCollectionReference
    implements
        MessageQuery,
        FirestoreCollectionReference<MessageQuerySnapshot> {
  factory MessageCollectionReference(
    DocumentReference<ChatRoom> parent,
  ) = _$MessageCollectionReference;

  static Message fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$MessageFromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Message value,
    SetOptions? options,
  ) {
    return _$MessageToJson(value);
  }

  /// A reference to the containing [ChatRoomDocumentReference] if this is a subcollection.
  ChatRoomDocumentReference get parent;

  @override
  MessageDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<MessageDocumentReference> add(Message value);
}

class _$MessageCollectionReference extends _$MessageQuery
    implements MessageCollectionReference {
  factory _$MessageCollectionReference(
    DocumentReference<ChatRoom> parent,
  ) {
    return _$MessageCollectionReference._(
      ChatRoomDocumentReference(parent),
      parent.collection('messages').withConverter(
            fromFirestore: MessageCollectionReference.fromFirestore,
            toFirestore: MessageCollectionReference.toFirestore,
          ),
    );
  }

  _$MessageCollectionReference._(
    this.parent,
    CollectionReference<Message> reference,
  ) : super(reference, reference);

  @override
  final ChatRoomDocumentReference parent;

  String get path => reference.path;

  @override
  CollectionReference<Message> get reference =>
      super.reference as CollectionReference<Message>;

  @override
  MessageDocumentReference doc([String? id]) {
    return MessageDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<MessageDocumentReference> add(Message value) {
    return reference.add(value).then((ref) => MessageDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$MessageCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class MessageDocumentReference
    extends FirestoreDocumentReference<MessageDocumentSnapshot> {
  factory MessageDocumentReference(DocumentReference<Message> reference) =
      _$MessageDocumentReference;

  DocumentReference<Message> get reference;

  /// A reference to the [MessageCollectionReference] containing this document.
  MessageCollectionReference get parent {
    return _$MessageCollectionReference(
      reference.parent.parent!.withConverter<ChatRoom>(
        fromFirestore: ChatRoomCollectionReference.fromFirestore,
        toFirestore: ChatRoomCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<MessageDocumentSnapshot> snapshots();

  @override
  Future<MessageDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    bool isDeleted,
    String content,
  });

  Future<void> set(Message value);
}

class _$MessageDocumentReference
    extends FirestoreDocumentReference<MessageDocumentSnapshot>
    implements MessageDocumentReference {
  _$MessageDocumentReference(this.reference);

  @override
  final DocumentReference<Message> reference;

  /// A reference to the [MessageCollectionReference] containing this document.
  MessageCollectionReference get parent {
    return _$MessageCollectionReference(
      reference.parent.parent!.withConverter<ChatRoom>(
        fromFirestore: ChatRoomCollectionReference.fromFirestore,
        toFirestore: ChatRoomCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<MessageDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return MessageDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<MessageDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return MessageDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<void> delete() {
    return reference.delete();
  }

  Future<void> update({
    Object? isDeleted = _sentinel,
    Object? content = _sentinel,
  }) async {
    final json = {
      if (isDeleted != _sentinel) "isDeleted": isDeleted as bool,
      if (content != _sentinel) "content": content as String,
    };

    return reference.update(json);
  }

  Future<void> set(Message value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is MessageDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class MessageDocumentSnapshot extends FirestoreDocumentSnapshot {
  MessageDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<Message> snapshot;

  @override
  MessageDocumentReference get reference {
    return MessageDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Message? data;
}

abstract class MessageQuery implements QueryReference<MessageQuerySnapshot> {
  @override
  MessageQuery limit(int limit);

  @override
  MessageQuery limitToLast(int limit);

  MessageQuery whereIsDeleted({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
  });
  MessageQuery whereContent({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });

  MessageQuery orderByIsDeleted({
    bool descending = false,
    bool startAt,
    bool startAfter,
    bool endAt,
    bool endBefore,
    MessageDocumentSnapshot? startAtDocument,
    MessageDocumentSnapshot? endAtDocument,
    MessageDocumentSnapshot? endBeforeDocument,
    MessageDocumentSnapshot? startAfterDocument,
  });

  MessageQuery orderByContent({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    MessageDocumentSnapshot? startAtDocument,
    MessageDocumentSnapshot? endAtDocument,
    MessageDocumentSnapshot? endBeforeDocument,
    MessageDocumentSnapshot? startAfterDocument,
  });
}

class _$MessageQuery extends QueryReference<MessageQuerySnapshot>
    implements MessageQuery {
  _$MessageQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<Message> reference;

  MessageQuerySnapshot _decodeSnapshot(
    QuerySnapshot<Message> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return MessageQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<MessageDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: MessageDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return MessageQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<MessageQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<MessageQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  MessageQuery limit(int limit) {
    return _$MessageQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  MessageQuery limitToLast(int limit) {
    return _$MessageQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  MessageQuery whereIsDeleted({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
  }) {
    return _$MessageQuery(
      reference.where(
        'isDeleted',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  MessageQuery whereContent({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$MessageQuery(
      reference.where(
        'content',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  MessageQuery orderByIsDeleted({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MessageDocumentSnapshot? startAtDocument,
    MessageDocumentSnapshot? endAtDocument,
    MessageDocumentSnapshot? endBeforeDocument,
    MessageDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('isDeleted', descending: false);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$MessageQuery(query, _collection);
  }

  MessageQuery orderByContent({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MessageDocumentSnapshot? startAtDocument,
    MessageDocumentSnapshot? endAtDocument,
    MessageDocumentSnapshot? endBeforeDocument,
    MessageDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('content', descending: false);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$MessageQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$MessageQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class MessageQuerySnapshot
    extends FirestoreQuerySnapshot<MessageQueryDocumentSnapshot> {
  MessageQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<Message> snapshot;

  @override
  final List<MessageQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<MessageDocumentSnapshot>> docChanges;
}

class MessageQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements MessageDocumentSnapshot {
  MessageQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<Message> snapshot;

  @override
  MessageDocumentReference get reference {
    return MessageDocumentReference(snapshot.reference);
  }

  @override
  final Message data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatRoom _$ChatRoomFromJson(Map<String, dynamic> json) => ChatRoom(
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
      updatedAt: const TimestampConverter().fromJson(json['updatedAt']),
      name: json['name'] as String,
      imageURL: json['imageURL'] as String?,
    );

Map<String, dynamic> _$ChatRoomToJson(ChatRoom instance) => <String, dynamic>{
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
      'name': instance.name,
      'imageURL': instance.imageURL,
    };

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
      isDeleted: json['isDeleted'] as bool? ?? false,
      senderRef: const DocumentReferenceConverter()
          .fromJson(json['senderRef'] as DocumentReference<Object?>),
      content: json['content'] as String,
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'isDeleted': instance.isDeleted,
      'senderRef':
          const DocumentReferenceConverter().toJson(instance.senderRef),
      'content': instance.content,
    };
