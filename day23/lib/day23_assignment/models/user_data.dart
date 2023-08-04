// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserData {
  String id;
  DateTime birth;
  String email;
  DateTime lastLoginDate;
  String name;
  String phoneNumber;

  UserData({
    required this.id,
    required this.birth,
    required this.email,
    required this.lastLoginDate,
    required this.name,
    required this.phoneNumber,
  });

  @override
  String toString() {
    return 'id: $id\nbirth: $birth\nemail: $email\nlastLoginDate: $lastLoginDate\nname: $name\nphoneNumber: $phoneNumber';
  }
}
