import 'package:flutter_riverpod/flutter_riverpod.dart';

// 숫자를 관리하는 numberProvider 생성
// 제너릭에는 관리하는 데이터의 타입을 넣어주면 된다.
final numberProvider = StateProvider<int>((ref) => 0);
