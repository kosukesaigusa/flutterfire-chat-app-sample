// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

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
abstract class AppUserCollectionReference
    implements
        AppUserQuery,
        FirestoreCollectionReference<AppUserQuerySnapshot> {
  factory AppUserCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$AppUserCollectionReference;

  static AppUser fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$AppUserFromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    AppUser value,
    SetOptions? options,
  ) {
    return _$AppUserToJson(value);
  }

  @override
  AppUserDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<AppUserDocumentReference> add(AppUser value);
}

class _$AppUserCollectionReference extends _$AppUserQuery
    implements AppUserCollectionReference {
  factory _$AppUserCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$AppUserCollectionReference._(
      firestore.collection('users').withConverter(
            fromFirestore: AppUserCollectionReference.fromFirestore,
            toFirestore: AppUserCollectionReference.toFirestore,
          ),
    );
  }

  _$AppUserCollectionReference._(
    CollectionReference<AppUser> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<AppUser> get reference =>
      super.reference as CollectionReference<AppUser>;

  @override
  AppUserDocumentReference doc([String? id]) {
    return AppUserDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<AppUserDocumentReference> add(AppUser value) {
    return reference.add(value).then((ref) => AppUserDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$AppUserCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class AppUserDocumentReference
    extends FirestoreDocumentReference<AppUserDocumentSnapshot> {
  factory AppUserDocumentReference(DocumentReference<AppUser> reference) =
      _$AppUserDocumentReference;

  DocumentReference<AppUser> get reference;

  /// A reference to the [AppUserCollectionReference] containing this document.
  AppUserCollectionReference get parent {
    return _$AppUserCollectionReference(reference.firestore);
  }

  late final AttendingChatRoomCollectionReference attendingChatRooms =
      _$AttendingChatRoomCollectionReference(
    reference,
  );

  @override
  Stream<AppUserDocumentSnapshot> snapshots();

  @override
  Future<AppUserDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String name,
    String? imageURL,
  });

  Future<void> set(AppUser value);
}

class _$AppUserDocumentReference
    extends FirestoreDocumentReference<AppUserDocumentSnapshot>
    implements AppUserDocumentReference {
  _$AppUserDocumentReference(this.reference);

  @override
  final DocumentReference<AppUser> reference;

  /// A reference to the [AppUserCollectionReference] containing this document.
  AppUserCollectionReference get parent {
    return _$AppUserCollectionReference(reference.firestore);
  }

  late final AttendingChatRoomCollectionReference attendingChatRooms =
      _$AttendingChatRoomCollectionReference(
    reference,
  );

  @override
  Stream<AppUserDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return AppUserDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<AppUserDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return AppUserDocumentSnapshot._(
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

  Future<void> set(AppUser value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is AppUserDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class AppUserDocumentSnapshot extends FirestoreDocumentSnapshot {
  AppUserDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<AppUser> snapshot;

  @override
  AppUserDocumentReference get reference {
    return AppUserDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final AppUser? data;
}

abstract class AppUserQuery implements QueryReference<AppUserQuerySnapshot> {
  @override
  AppUserQuery limit(int limit);

  @override
  AppUserQuery limitToLast(int limit);

  AppUserQuery whereName({
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
  AppUserQuery whereImageURL({
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

  AppUserQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    AppUserDocumentSnapshot? startAtDocument,
    AppUserDocumentSnapshot? endAtDocument,
    AppUserDocumentSnapshot? endBeforeDocument,
    AppUserDocumentSnapshot? startAfterDocument,
  });

  AppUserQuery orderByImageURL({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    AppUserDocumentSnapshot? startAtDocument,
    AppUserDocumentSnapshot? endAtDocument,
    AppUserDocumentSnapshot? endBeforeDocument,
    AppUserDocumentSnapshot? startAfterDocument,
  });
}

class _$AppUserQuery extends QueryReference<AppUserQuerySnapshot>
    implements AppUserQuery {
  _$AppUserQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<AppUser> reference;

  AppUserQuerySnapshot _decodeSnapshot(
    QuerySnapshot<AppUser> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return AppUserQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<AppUserDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: AppUserDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return AppUserQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<AppUserQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<AppUserQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  AppUserQuery limit(int limit) {
    return _$AppUserQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  AppUserQuery limitToLast(int limit) {
    return _$AppUserQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  AppUserQuery whereName({
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
    return _$AppUserQuery(
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

  AppUserQuery whereImageURL({
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
    return _$AppUserQuery(
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

  AppUserQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AppUserDocumentSnapshot? startAtDocument,
    AppUserDocumentSnapshot? endAtDocument,
    AppUserDocumentSnapshot? endBeforeDocument,
    AppUserDocumentSnapshot? startAfterDocument,
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

    return _$AppUserQuery(query, _collection);
  }

  AppUserQuery orderByImageURL({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AppUserDocumentSnapshot? startAtDocument,
    AppUserDocumentSnapshot? endAtDocument,
    AppUserDocumentSnapshot? endBeforeDocument,
    AppUserDocumentSnapshot? startAfterDocument,
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

    return _$AppUserQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$AppUserQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class AppUserQuerySnapshot
    extends FirestoreQuerySnapshot<AppUserQueryDocumentSnapshot> {
  AppUserQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<AppUser> snapshot;

  @override
  final List<AppUserQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<AppUserDocumentSnapshot>> docChanges;
}

class AppUserQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements AppUserDocumentSnapshot {
  AppUserQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<AppUser> snapshot;

  @override
  AppUserDocumentReference get reference {
    return AppUserDocumentReference(snapshot.reference);
  }

  @override
  final AppUser data;
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class AttendingChatRoomCollectionReference
    implements
        AttendingChatRoomQuery,
        FirestoreCollectionReference<AttendingChatRoomQuerySnapshot> {
  factory AttendingChatRoomCollectionReference(
    DocumentReference<AppUser> parent,
  ) = _$AttendingChatRoomCollectionReference;

  static AttendingChatRoom fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$AttendingChatRoomFromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    AttendingChatRoom value,
    SetOptions? options,
  ) {
    return _$AttendingChatRoomToJson(value);
  }

  /// A reference to the containing [AppUserDocumentReference] if this is a subcollection.
  AppUserDocumentReference get parent;

  @override
  AttendingChatRoomDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<AttendingChatRoomDocumentReference> add(AttendingChatRoom value);
}

class _$AttendingChatRoomCollectionReference extends _$AttendingChatRoomQuery
    implements AttendingChatRoomCollectionReference {
  factory _$AttendingChatRoomCollectionReference(
    DocumentReference<AppUser> parent,
  ) {
    return _$AttendingChatRoomCollectionReference._(
      AppUserDocumentReference(parent),
      parent.collection('attendingChatRooms').withConverter(
            fromFirestore: AttendingChatRoomCollectionReference.fromFirestore,
            toFirestore: AttendingChatRoomCollectionReference.toFirestore,
          ),
    );
  }

  _$AttendingChatRoomCollectionReference._(
    this.parent,
    CollectionReference<AttendingChatRoom> reference,
  ) : super(reference, reference);

  @override
  final AppUserDocumentReference parent;

  String get path => reference.path;

  @override
  CollectionReference<AttendingChatRoom> get reference =>
      super.reference as CollectionReference<AttendingChatRoom>;

  @override
  AttendingChatRoomDocumentReference doc([String? id]) {
    return AttendingChatRoomDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<AttendingChatRoomDocumentReference> add(AttendingChatRoom value) {
    return reference
        .add(value)
        .then((ref) => AttendingChatRoomDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$AttendingChatRoomCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class AttendingChatRoomDocumentReference
    extends FirestoreDocumentReference<AttendingChatRoomDocumentSnapshot> {
  factory AttendingChatRoomDocumentReference(
          DocumentReference<AttendingChatRoom> reference) =
      _$AttendingChatRoomDocumentReference;

  DocumentReference<AttendingChatRoom> get reference;

  /// A reference to the [AttendingChatRoomCollectionReference] containing this document.
  AttendingChatRoomCollectionReference get parent {
    return _$AttendingChatRoomCollectionReference(
      reference.parent.parent!.withConverter<AppUser>(
        fromFirestore: AppUserCollectionReference.fromFirestore,
        toFirestore: AppUserCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<AttendingChatRoomDocumentSnapshot> snapshots();

  @override
  Future<AttendingChatRoomDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String lastMessage,
    String name,
    String? imageURL,
    int usersCount,
    bool mute,
  });

  Future<void> set(AttendingChatRoom value);
}

class _$AttendingChatRoomDocumentReference
    extends FirestoreDocumentReference<AttendingChatRoomDocumentSnapshot>
    implements AttendingChatRoomDocumentReference {
  _$AttendingChatRoomDocumentReference(this.reference);

  @override
  final DocumentReference<AttendingChatRoom> reference;

  /// A reference to the [AttendingChatRoomCollectionReference] containing this document.
  AttendingChatRoomCollectionReference get parent {
    return _$AttendingChatRoomCollectionReference(
      reference.parent.parent!.withConverter<AppUser>(
        fromFirestore: AppUserCollectionReference.fromFirestore,
        toFirestore: AppUserCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<AttendingChatRoomDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return AttendingChatRoomDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<AttendingChatRoomDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return AttendingChatRoomDocumentSnapshot._(
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
    Object? lastMessage = _sentinel,
    Object? name = _sentinel,
    Object? imageURL = _sentinel,
    Object? usersCount = _sentinel,
    Object? mute = _sentinel,
  }) async {
    final json = {
      if (lastMessage != _sentinel) "lastMessage": lastMessage as String,
      if (name != _sentinel) "name": name as String,
      if (imageURL != _sentinel) "imageURL": imageURL as String?,
      if (usersCount != _sentinel) "usersCount": usersCount as int,
      if (mute != _sentinel) "mute": mute as bool,
    };

    return reference.update(json);
  }

  Future<void> set(AttendingChatRoom value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is AttendingChatRoomDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class AttendingChatRoomDocumentSnapshot extends FirestoreDocumentSnapshot {
  AttendingChatRoomDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<AttendingChatRoom> snapshot;

  @override
  AttendingChatRoomDocumentReference get reference {
    return AttendingChatRoomDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final AttendingChatRoom? data;
}

abstract class AttendingChatRoomQuery
    implements QueryReference<AttendingChatRoomQuerySnapshot> {
  @override
  AttendingChatRoomQuery limit(int limit);

  @override
  AttendingChatRoomQuery limitToLast(int limit);

  AttendingChatRoomQuery whereLastMessage({
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
  AttendingChatRoomQuery whereName({
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
  AttendingChatRoomQuery whereImageURL({
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
  AttendingChatRoomQuery whereUsersCount({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  });
  AttendingChatRoomQuery whereMute({
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

  AttendingChatRoomQuery orderByLastMessage({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    AttendingChatRoomDocumentSnapshot? startAtDocument,
    AttendingChatRoomDocumentSnapshot? endAtDocument,
    AttendingChatRoomDocumentSnapshot? endBeforeDocument,
    AttendingChatRoomDocumentSnapshot? startAfterDocument,
  });

  AttendingChatRoomQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    AttendingChatRoomDocumentSnapshot? startAtDocument,
    AttendingChatRoomDocumentSnapshot? endAtDocument,
    AttendingChatRoomDocumentSnapshot? endBeforeDocument,
    AttendingChatRoomDocumentSnapshot? startAfterDocument,
  });

  AttendingChatRoomQuery orderByImageURL({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    AttendingChatRoomDocumentSnapshot? startAtDocument,
    AttendingChatRoomDocumentSnapshot? endAtDocument,
    AttendingChatRoomDocumentSnapshot? endBeforeDocument,
    AttendingChatRoomDocumentSnapshot? startAfterDocument,
  });

  AttendingChatRoomQuery orderByUsersCount({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    AttendingChatRoomDocumentSnapshot? startAtDocument,
    AttendingChatRoomDocumentSnapshot? endAtDocument,
    AttendingChatRoomDocumentSnapshot? endBeforeDocument,
    AttendingChatRoomDocumentSnapshot? startAfterDocument,
  });

  AttendingChatRoomQuery orderByMute({
    bool descending = false,
    bool startAt,
    bool startAfter,
    bool endAt,
    bool endBefore,
    AttendingChatRoomDocumentSnapshot? startAtDocument,
    AttendingChatRoomDocumentSnapshot? endAtDocument,
    AttendingChatRoomDocumentSnapshot? endBeforeDocument,
    AttendingChatRoomDocumentSnapshot? startAfterDocument,
  });
}

class _$AttendingChatRoomQuery
    extends QueryReference<AttendingChatRoomQuerySnapshot>
    implements AttendingChatRoomQuery {
  _$AttendingChatRoomQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<AttendingChatRoom> reference;

  AttendingChatRoomQuerySnapshot _decodeSnapshot(
    QuerySnapshot<AttendingChatRoom> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return AttendingChatRoomQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<AttendingChatRoomDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: AttendingChatRoomDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return AttendingChatRoomQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<AttendingChatRoomQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<AttendingChatRoomQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  AttendingChatRoomQuery limit(int limit) {
    return _$AttendingChatRoomQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  AttendingChatRoomQuery limitToLast(int limit) {
    return _$AttendingChatRoomQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  AttendingChatRoomQuery whereLastMessage({
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
    return _$AttendingChatRoomQuery(
      reference.where(
        'lastMessage',
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

  AttendingChatRoomQuery whereName({
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
    return _$AttendingChatRoomQuery(
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

  AttendingChatRoomQuery whereImageURL({
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
    return _$AttendingChatRoomQuery(
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

  AttendingChatRoomQuery whereUsersCount({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$AttendingChatRoomQuery(
      reference.where(
        'usersCount',
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

  AttendingChatRoomQuery whereMute({
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
    return _$AttendingChatRoomQuery(
      reference.where(
        'mute',
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

  AttendingChatRoomQuery orderByLastMessage({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AttendingChatRoomDocumentSnapshot? startAtDocument,
    AttendingChatRoomDocumentSnapshot? endAtDocument,
    AttendingChatRoomDocumentSnapshot? endBeforeDocument,
    AttendingChatRoomDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('lastMessage', descending: false);

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

    return _$AttendingChatRoomQuery(query, _collection);
  }

  AttendingChatRoomQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AttendingChatRoomDocumentSnapshot? startAtDocument,
    AttendingChatRoomDocumentSnapshot? endAtDocument,
    AttendingChatRoomDocumentSnapshot? endBeforeDocument,
    AttendingChatRoomDocumentSnapshot? startAfterDocument,
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

    return _$AttendingChatRoomQuery(query, _collection);
  }

  AttendingChatRoomQuery orderByImageURL({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AttendingChatRoomDocumentSnapshot? startAtDocument,
    AttendingChatRoomDocumentSnapshot? endAtDocument,
    AttendingChatRoomDocumentSnapshot? endBeforeDocument,
    AttendingChatRoomDocumentSnapshot? startAfterDocument,
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

    return _$AttendingChatRoomQuery(query, _collection);
  }

  AttendingChatRoomQuery orderByUsersCount({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AttendingChatRoomDocumentSnapshot? startAtDocument,
    AttendingChatRoomDocumentSnapshot? endAtDocument,
    AttendingChatRoomDocumentSnapshot? endBeforeDocument,
    AttendingChatRoomDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('usersCount', descending: false);

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

    return _$AttendingChatRoomQuery(query, _collection);
  }

  AttendingChatRoomQuery orderByMute({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AttendingChatRoomDocumentSnapshot? startAtDocument,
    AttendingChatRoomDocumentSnapshot? endAtDocument,
    AttendingChatRoomDocumentSnapshot? endBeforeDocument,
    AttendingChatRoomDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('mute', descending: false);

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

    return _$AttendingChatRoomQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$AttendingChatRoomQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class AttendingChatRoomQuerySnapshot
    extends FirestoreQuerySnapshot<AttendingChatRoomQueryDocumentSnapshot> {
  AttendingChatRoomQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<AttendingChatRoom> snapshot;

  @override
  final List<AttendingChatRoomQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<AttendingChatRoomDocumentSnapshot>>
      docChanges;
}

class AttendingChatRoomQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot
    implements AttendingChatRoomDocumentSnapshot {
  AttendingChatRoomQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<AttendingChatRoom> snapshot;

  @override
  AttendingChatRoomDocumentReference get reference {
    return AttendingChatRoomDocumentReference(snapshot.reference);
  }

  @override
  final AttendingChatRoom data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppUser _$AppUserFromJson(Map<String, dynamic> json) => AppUser(
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
      updatedAt: const TimestampConverter().fromJson(json['updatedAt']),
      name: json['name'] as String,
      imageURL: json['imageURL'] as String?,
    );

Map<String, dynamic> _$AppUserToJson(AppUser instance) => <String, dynamic>{
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
      'name': instance.name,
      'imageURL': instance.imageURL,
    };

AttendingChatRoom _$AttendingChatRoomFromJson(Map<String, dynamic> json) =>
    AttendingChatRoom(
      updatedAt: const TimestampConverter().fromJson(json['updatedAt']),
      chatRoomRef: const DocumentReferenceConverter()
          .fromJson(json['chatRoomRef'] as DocumentReference<Object?>),
      lastMessage: json['lastMessage'] as String,
      name: json['name'] as String,
      imageURL: json['imageURL'] as String?,
      usersCount: json['usersCount'] as int? ?? 0,
      mute: json['mute'] as bool? ?? false,
    );

Map<String, dynamic> _$AttendingChatRoomToJson(AttendingChatRoom instance) =>
    <String, dynamic>{
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
      'chatRoomRef':
          const DocumentReferenceConverter().toJson(instance.chatRoomRef),
      'lastMessage': instance.lastMessage,
      'name': instance.name,
      'imageURL': instance.imageURL,
      'usersCount': instance.usersCount,
      'mute': instance.mute,
    };
