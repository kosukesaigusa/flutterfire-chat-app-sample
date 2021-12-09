import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class DocumentReferenceConverter implements JsonConverter<DocumentReference, DocumentReference> {
  const DocumentReferenceConverter();

  @override
  DocumentReference fromJson(DocumentReference reference) => reference;

  @override
  DocumentReference toJson(DocumentReference reference) => reference;
}

class DocumentReferenceNullableConverter
    implements JsonConverter<DocumentReference?, DocumentReference?> {
  const DocumentReferenceNullableConverter();

  @override
  DocumentReference? fromJson(DocumentReference? reference) => reference;

  @override
  DocumentReference? toJson(DocumentReference? reference) => reference;
}

class DocumentReferenceListConverter
    implements JsonConverter<List<DocumentReference>, List<DocumentReference>> {
  const DocumentReferenceListConverter();

  @override
  List<DocumentReference> fromJson(List<DocumentReference> refs) => refs;

  @override
  List<DocumentReference> toJson(List<DocumentReference> refs) => refs;
}

class TimestampConverter implements JsonConverter<DateTime?, Timestamp?> {
  const TimestampConverter();

  @override
  DateTime? fromJson(Timestamp? json) => json?.toDate();

  @override
  Timestamp? toJson(DateTime? object) => object == null ? null : Timestamp.fromDate(object);
}
