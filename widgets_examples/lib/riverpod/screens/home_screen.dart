import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_examples/riverpod/state/user_notifier.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersState = ref.watch(userProvider);
    final userNotifier = ref.read(userProvider.notifier);
    if (usersState.isEmpty) {
      userNotifier.getUsers();
    }
    log('$usersState', name: 'usersState');

    return Scaffold(
      body: ListView.builder(
        itemCount: usersState.length,
        itemBuilder: (context, index) {
          return Text(
            usersState[index].name,
          );
        },
      ),
    );
  }
}
