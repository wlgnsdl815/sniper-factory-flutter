// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserData {
  String firstName;
  String imageUrl;
  String lastName;
  String phoneNumber;
  int userId;

  UserData({
    required this.firstName,
    required this.imageUrl,
    required this.lastName,
    required this.phoneNumber,
    required this.userId,
  });

  UserData.fromMap(Map<String, dynamic> map)
      : firstName = map['firstName'],
        imageUrl = map['imageUrl'] ?? '',
        lastName = map['lastName'],
        phoneNumber = map['phoneNumber'],
        userId = map['userId'];

  Map<String, dynamic> toMap() => {
        'firstName': firstName,
        'imageUrl': imageUrl,
        'lastName': lastName,
        'phoneNumber': phoneNumber,
        'userId': userId,
      };

  @override
  int get hashCode => userId.hashCode;

  @override
  operator ==(Object other) => other is UserData && userId == other.userId;
}
