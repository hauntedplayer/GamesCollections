import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:games_colletions/controllers/game_controller.dart';
import 'package:games_colletions/repositories/user_repository.dart';

import '../models/user_model.dart';
import '../services/user_service.dart';

final userControllerProvider =
    StateNotifierProvider<UserController, UserCredential?>((ref) {
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

class UserController extends StateNotifier<UserCredential?> {
  final UserService _userService;

  UserController(this._userService) : super(null);

  Future<UserCredential?> loginUser(UserModel userModel) async {
    final user = await _userService.loginUser(userModel);
    if (user != null) {
      state = user;
    }
    return user;
  }

  Future<void> registerUser(UserModel user) async {
    _userService.registerUser(user);
  }

  void logoutUser() {
    state = null;
  }
}
