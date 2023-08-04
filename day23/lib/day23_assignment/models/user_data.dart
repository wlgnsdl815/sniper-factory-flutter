// 기본 클래스
class UserData {
  String id;
  DateTime birth;
  String email;
  DateTime lastLoginDate;
  String name;
  String phoneNumber;

  // 생성자
  UserData({
    required this.id,
    required this.birth,
    required this.email,
    required this.lastLoginDate,
    required this.name,
    required this.phoneNumber,
  });

  @override
  // toString을 오버라이드해서 결과 출력
  String toString() {
    return 'id: $id\nbirth: $birth\nemail: $email\nlastLoginDate: $lastLoginDate\nname: $name\nphoneNumber: $phoneNumber';
  }
}
