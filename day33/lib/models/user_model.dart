import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final String? avatar;
  final String collectionId;
  final String collectionName;
  final String created;
  final bool emailVisibility;
  final String id;
  final String? name;
  final String updated;
  final String username;
  final bool verified;

  User({
    this.avatar,
    required this.collectionId,
    required this.collectionName,
    required this.created,
    required this.emailVisibility,
    required this.id,
    this.name,
    required this.updated,
    required this.username,
    required this.verified,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'avatar': avatar,
      'collectionId': collectionId,
      'collectionName': collectionName,
      'created': created,
      'emailVisibility': emailVisibility,
      'id': id,
      'name': name,
      'updated': updated,
      'username': username,
      'verified': verified,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
      collectionId: map['collectionId'] as String,
      collectionName: map['collectionName'] as String,
      created: map['created'] as String,
      emailVisibility: map['emailVisibility'] as bool,
      id: map['id'] as String,
      name: map['name'] != null ? map['name'] as String : null,
      updated: map['updated'] as String,
      username: map['username'] as String,
      verified: map['verified'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
