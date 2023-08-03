// ignore_for_file: public_member_api_docs, sort_constructors_first

void main(List<String> arguments) {
  // 3번 문제 결과 출력
  print(UserData.dummy());

  UserData userData = UserData(
    id: "id",
    birth: DateTime.parse('1990-01-01'),
    email: "sniperfactory@naver.com",
    lastLoginDate: DateTime.now(),
    name: "스나이퍼",
    phoneNumber: '01023456789',
  );

  // 4번 문제 결과 출력 - 1
  print('나이는 : ${userData.getAge}살 입니다.');

  UserData userData2 = UserData(
    id: "id",
    birth: DateTime.now(),
    email: "sniperfactory@naver.com",
    lastLoginDate: DateTime.now(),
    name: "스나이퍼",
    phoneNumber: '01023456789',
  );

  // 4번 문제 결과 출력 - 2
  userData2.upDateUserName('팩토리');
  print(userData2.name);
}

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

  static dummy() {
    return UserData(
      id: 'DUMMY',
      name: '더미데이터',
      birth: DateTime.now(),
      email: 'dummyData@dummy.com',
      phoneNumber: '0l0',
      lastLoginDate: DateTime.now(),
    );
  }

  // print()는 어떤 객체가 전달되든 그 객체의 toString() 함수를 호출한다.
  @override
  String toString() {
    return 'id: $id\nname: $name\nbirth: $birth\nemail: $email\nphoneNumber: $phoneNumber\nlastLoginDate: $lastLoginDate\n';
  }

  // getter 사용 DateTime의 함수를 사용하고 윤년포함 평균나이를 구할 때 쓰는 365.25로 나누어주고, 숫자를 내림처리했다.
  int get getAge =>
      ((DateTime.now().difference(birth).inDays) / 365.25).floor();

  // setter가 아닌 일반 함수
  void upDateUserName(String name) {
    this.name = name;
  }
}
