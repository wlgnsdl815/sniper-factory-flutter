// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  String name;
  String phoneNum;
  String email;
  String? nickname;
  String? profileImgUrl;
  String? backgroundImgUrl;
  List<User> friends;
  List<User> favorite;

  User({
    required this.name,
    required this.phoneNum,
    required this.email,
    this.nickname,
    this.profileImgUrl,
    this.backgroundImgUrl,
    required this.friends,
    required this.favorite,
  });
}
