import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:games_colletions/controllers/game_controller.dart';
import 'package:games_colletions/repositories/user_repository.dart';
import 'package:games_colletions/views/login_screen.dart';

import '../models/user_model.dart';
import '../services/user_service.dart';

// Provider to manage the loading state
final loadingProvider = StateProvider<bool>((ref) => false);

final userControllerProvider =
    StateNotifierProvider<UserController, UserCredential?>((ref) {
  final userService = ref.read(userServiceProvider);
  return UserController(userService, ref);
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
  final Ref ref;

  UserController(this._userService, this.ref) : super(null);
  
  

  Future<UserCredential?> loginUser(UserModel userModel) async {
    try {
      ref.read(loadingProvider.notifier).state = true;
      final user = await _userService.loginUser(userModel);
      if (user != null) {
        state = user;
      }
      return user;
    } finally {
      ref.read(loadingProvider.notifier).state = false;
    }
  }

  Future<void> registerUser(UserModel user) async {
    try {
      ref.read(loadingProvider.notifier).state = true;
      await _userService.registerUser(user);
    } finally {
      ref.read(loadingProvider.notifier).state = false;
    }
  }

  void logoutUser() {
    state = null;
  
  }
}
