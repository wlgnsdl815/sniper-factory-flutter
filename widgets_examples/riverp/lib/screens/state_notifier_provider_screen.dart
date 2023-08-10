import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverp/layout/default_layout.dart';
import 'package:riverp/model/shopping_item_model.dart';
import 'package:riverp/providers/state_notifier_provider.dart';

class StateNotifierProviderScreen extends ConsumerWidget {
  const StateNotifierProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // provider를 watch
    final List<ShoppingItemModel> state = ref.watch(shoppingListProvider);

    return DefaultLayout(
      title: 'StateNotifierProviderScreen',
      body: ListView(
        children: state
            .map(
              (e) => CheckboxListTile(
                title: Text(e.name),
                // value에는 체크 박스가 체크가 되었는지 안되었는지 표시하는 값
                value: e.hasBought,
                onChanged: (value) {
                  // ref.watch또는 read를 할 때 .notifier까지 하면 class 전체를 가져온다.
                  ref.read(shoppingListProvider.notifier).toggleHasBought(
                        name: e.name,
                      );
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
