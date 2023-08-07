import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_examples/riverpod/models/user_model.dart';
import 'package:widgets_examples/riverpod/services/user_service.dart';

class UserNotifier extends StateNotifier<List<User>> {
  UserNotifier(this._userService) : super([]);

  final UserService _userService;

  Future getUsers() async {
    try {
      List<User> users = await _userService.getUsers();
      state = users;
    } catch (e) {
      throw Exception('Failed to load users');
    }
  }
}

final userProvider = StateNotifierProvider<UserNotifier, List<User>>((ref) {
  return UserNotifier(UserService());
});
