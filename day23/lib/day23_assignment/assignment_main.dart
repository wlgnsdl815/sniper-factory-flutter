import 'package:day23/day23_assignment/models/user_data.dart';

void main() {
  UserData userData = UserData(
    id: 'snpierFactory',
    birth: DateTime.now(),
    email: 'sniperfactory@naver.com',
    lastLoginDate: DateTime.now(),
    name: '스나이퍼',
    phoneNumber: '01023456789',
  );

  // 1번 과제
  print(userData);
}
