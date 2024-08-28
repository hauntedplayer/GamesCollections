import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:games_colletions/controllers/game_controller.dart';
import 'package:games_colletions/repositories/user_repository.dart';

import '../models/user_model.dart';
import '../services/user_service.dart';

final userControllerProvider =
    StateNotifierProvider<UserController, User?>((ref) {
  final userService = ref.read(userServiceProvider);
  return UserController(userService);
});

final userServiceProvider = Provider<UserService>((ref) {
  final userRepository = ref.read(userRepositoryProvider);
  return UserService(userRepository);
});

final userRepositoryProvider = Provider<UserRepository>((ref) {
  final databaseHelper = ref.read(databaseHelperProvider);
  return UserRepository(databaseHelper);
});

class UserController extends StateNotifier<User?> {
  final UserService _userService;

  UserController(this._userService) : super(null);

  Future<User?> loginUser(String username, String password) async {
    final user = await _userService.loginUser(username, password);
    if (user != null) {
      state = user;
    }
    return user;
  }

  Future<void> registerUser(User user) async {
    _userService.registerUser(user);
  }

  void logoutUser() {
    state = null;
  }
}
