import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_user.g.dart';

@JsonSerializable()
class AppUser {
  AppUser({
    // this.createdAt,
    // this.updatedAt,
    required this.name,
    this.imageURL,
  });

  // @TimestampConverter()
  // DateTime? createdAt;
  // @TimestampConverter()
  // DateTime? updatedAt;
  final String name;
  final String? imageURL;
}

@Collection<AppUser>('users')
final usersRef = AppUserCollectionReference();
