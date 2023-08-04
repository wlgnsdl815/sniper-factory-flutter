import 'package:day23/day23_assignment/models/human_data.dart';
import 'package:day23/day23_assignment/models/subway_data.dart';

void main() {
  // // 3번 과제
  // 인스턴스 생성
  var subway = Subway(line: '2호선', current: '홍대입구역', passengers: []);
  var human1 = Human(name: '사람1', money: 5000, curSubway: null);
  var human2 = Human(name: '사람2', money: 3450, curSubway: null);
  var human3 = Human(name: '사람3', money: 450, curSubway: null);

  // 사람 탑승
  print(human1.getOn(subway));
  print(human2.getOn(subway));
  print(human3.getOn(subway));

  // 현재 지하철 탑승
  print(subway.toString());

  // 각 사람들의 현재 상태를 출력
  print(human1.toString());
  print(human2.toString());
  print(human3.toString());
}
