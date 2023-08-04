// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:day23/day23_assignment/models/subway_data.dart';

class Human {
  String name;
  int money;
  Subway? curSubway;

  Human({
    required this.name,
    required this.money,
    this.curSubway,
  });

  // Subway를 인자값으로 받아서 현재 가지고 있는 돈을 계산 후 탑승시킨다
  getOn(Subway subway) {
    if (money > 1500) {
      money -= 1500;
      subway.passengers.add(
        Human(name: name, money: money),
      );
      // 탑승에 성공하면 curSubway를 현재 subway로 바꾸어준다
      curSubway = subway;
      return '$name이(가) 성공적으로 탑승하였습니다. (남은 돈 : $money)';
    } else {
      return '$name이(가) 탑승에 실패했습니다. (잔액부족)';
    }
  }

  @override
  String toString() =>
      'Human(human: $name, money: $money, curSubway: $curSubway)';
}
