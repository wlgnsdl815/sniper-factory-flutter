// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:day23/day23_assignment/models/human_data.dart';

// 기본 클래스
class Subway {
  String line;
  String current;
  List<Human> passengers;

  // 생성자. 생성자가 호출되면 print를 통해서 생성이 되었음을 알린다.
  Subway({
    required this.line,
    required this.current,
    required this.passengers,
  }) {
    print('[$line] 지하철이 생성되었습니다.');
  }

  // toString을 오버라이드
  @override
  String toString() =>
      'Subway([$line | $current] 현재 지하철 탑승인원 ${passengers.length}명)';
}
