import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Secret {
  final String? author;
  final String? authorName;
  final String collectionId;
  final String collectionName;
  final String created;
  final String id;
  final String secret;
  final String updated;

  Secret({
    this.author,
    this.authorName,
    required this.collectionId,
    required this.collectionName,
    required this.created,
    required this.id,
    required this.secret,
    required this.updated,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'author': author,
      'authorName': authorName,
      'collectionId': collectionId,
      'collectionName': collectionName,
      'created': created,
      'id': id,
      'secret': secret,
      'updated': updated,
    };
  }

  factory Secret.fromMap(Map<String, dynamic> map) {
    return Secret(
      author: map['author'] != null ? map['author'] as String : null,
      authorName:
          map['authorName'] != null ? map['authorName'] as String : null,
      collectionId: map['collectionId'] as String,
      collectionName: map['collectionName'] as String,
      created: map['created'] as String,
      id: map['id'] as String,
      secret: map['secret'] as String,
      updated: map['updated'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Secret.fromJson(String source) =>
      Secret.fromMap(json.decode(source) as Map<String, dynamic>);
}
