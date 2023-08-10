import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverp/model/shopping_item_model.dart';

// shoppingListProvider를 생성.
// 제너릭의 첫번째는 클래스, 두번째는 그 클래스가 관리하는 타입을 넣어주면 된다.
// 순서는 아래 클래스를 먼저 생성하고 프로바이더를 생성한다.
final shoppingListProvider =
    StateNotifierProvider<ShoppingListNotifier, List<ShoppingItemModel>>(
  (ref) => ShoppingListNotifier(),
);

// StateNotifierProvider는 StateNotifier를 꼭 extends 해야한다.
// ShoppingItemModel을 List로 관리하는 ShoppingListNotifier 생성
class ShoppingListNotifier extends StateNotifier<List<ShoppingItemModel>> {
  // 생성자 : super()안에 값을 넣어주면 그게 ShoppingListProvider를 초기화 하는 것이다.(defualt값)
  // 아래 예시에서는 5개의 ShoppingItemModel을 리스트로 넣었다.
  ShoppingListNotifier()
      : super([
          ShoppingItemModel(
            name: '김치',
            quantity: 3,
            hasBought: false,
            isSpicy: true,
          ),
          ShoppingItemModel(
            name: '라면',
            quantity: 5,
            hasBought: false,
            isSpicy: true,
          ),
          ShoppingItemModel(
            name: '삼겹살',
            quantity: 10,
            hasBought: false,
            isSpicy: false,
          ),
          ShoppingItemModel(
            name: '수박',
            quantity: 2,
            hasBought: false,
            isSpicy: true,
          ),
          ShoppingItemModel(
            name: '카스테라',
            quantity: 5,
            hasBought: false,
            isSpicy: false,
          ),
        ]);

  // StateProvier와는 다르게 StateNotifier를 extends한
  // StateNotifierProvider는 class이기 때문에 메소드를 작성해서 상태관리가 가능하다.
  void toggleHasBought({required String name}) {
    // state는 무조건 super()안에 초기화 된 값으로 들어온다.
    // 현재 예시에서는 5개의 ShoppingItemModel들이다.
    // 이름 값을 비교해서 같으면 그 모델의 hasBought를 반대로 변경, 아니면 그대로 반납
    state = state
        .map(
          (e) => e.name == name
              ? ShoppingItemModel(
                  name: e.name,
                  quantity: e.quantity,
                  hasBought: !e.hasBought,
                  isSpicy: e.isSpicy)
              : e,
        )
        .toList();
  }
}
